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

function fetch_dependencies(url,filename_str,dryrun)

if (nargin()<3)
	dryrun = false;
end

% check for svn
ret = system('svn --version');
if (ret)
	error('svn has to be installed and acessible via the library path')
end

% read dependencies from file
file_str = fileread(filename_str);

% split into lines
file_C = cvec(strsplit(file_str, '\n'));

% check out all dependencies, this may take a while
for idx=1:length(file_C)
	line  = file_C{idx};
	if (~isempty(line))
		line_C     = strsplit(line,' ');
		dep        = line_C{1};
		revision   = line_C{2};
		dep_C      = strsplit(dep,'/');
		repository = dep_C{1};
		path       = join(dep_C(2:end),filesep);
		dirname_   = join(dep_C(1:end-1),filesep);
		mkdir(['lib/',dirname_{1}]);
		dest = sprintf('./lib/%s/%s',repository,path{1});
		if (0 == exist(dest,'file'))
			cmd  = sprintf('svn export %s/%s/trunk/%s %s',url,repository,path{1},dest);
			if (dryrun)
				disp(cmd);
			else
				system(cmd);
			end
		end
	end
end % for idx

end % dependencies_fetch

