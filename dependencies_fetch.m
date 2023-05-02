% Wed  9 Nov 11:01:00 CET 2022
% Karl Kastner, Berlin
%
% This program is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
%
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with this program.  If not, see <http://www.gnu.org/licenses/>.
%
% demonstration, that averaging densities with the same distribution
% but different regularity results in a density that is more pointed
% and has heavier tales than the underlying distribution
%
%% fetch the dependencies stored in other repositories
%

function dependencies_fetch(url,filename_str,dryrun,svnflag)
	if (nargin()<1)
		return;
	end
	
	if (nargin()<3)
		dryrun = false;
	end

	if (nargin()<4)
		svnflag = false;
	end
	
	% check for svn
	if (svnflag)
		ret = system('svn --version');
		if (ret)
			error('svn has to be installed and acessible via the library path. You can set svnflag to false to fetch dependencies without svn.');
		end
	end
	
	% read dependencies from file
	file_str = fileread(filename_str);
	
	% split into lines
	file_C = strsplit(file_str, '\n');

	url_  = regexprep(url,'/$','');
	url_C = strsplit(url_,'/');
	user = url_C{end};
	
	% export all dependencies, this may take a while
	for idx=1:length(file_C)
		line  = file_C{idx};
		if (~isempty(line))
			line_C     = strsplit(line,' ');
			dep        = line_C{1};
			revision   = line_C{2};
			commithash = line_C{3};
			dep_C      = strsplit(dep,'/');
			repository = dep_C{1};
			path       = join(dep_C(2:end),filesep);
			dirname_   = join(dep_C(1:end-1),filesep);
			mkdir(['lib/',dirname_{1}]);
			dest = sprintf('./lib/%s/%s',repository,path{1});
			if (0 == exist(dest,'file'))
				if (svnflag)
				cmd  = sprintf('svn export -r %s %s/%s/trunk/%s %s',revision,url,repository,path{1},dest);
				if (dryrun)
					disp(cmd);
				else
					system(cmd);
				end % else of is dryrun
				else
					baseurl = 'https://raw.githubusercontent.com';
					fullurl = [baseurl,'/',user,'/',repository,'/',commithash,'/',path{1}];
					disp(['saving ',fullurl,' to ',dest]);
					if (~dryrun)
						% there seems to be a bug in matlab websave
						% websave(dest,cmd)
						urlwrite(fullurl,dest);
					end
				end
			end % if 0 == exist
		end % if ~isempty line
	end % for idx
end % dependencies_fetch

