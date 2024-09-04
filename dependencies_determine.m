% Wed 22 Dec 13:07:42 CET 2021
% Karl Kästner, Berlin
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
%% determine dependencies of a matlab function
%
%% function dependencies_determine(dep_filename,profile_filename,func_C)
%
% TODO class files are not properly fethced
% [l,p]=matlab.codetools.requiredFilesAndProducts('pattern_periodicity_test_batch')
% C = {}; for idx=1:length(p) if (p(idx).Certain) C{end+1,1}=p(idx).Name, end, end
function dependencies_determine(dep_filename,profile_filename,func_C)
	version_control_system = 'git';

	if (~exist(profile_filename,'file'))
		profile on;
		for idx=1:length(func_C)
			feval(func_C{idx});
		end
		profile off;
		p = profile('info');
		save(profile_filename,'p');
	else
		load(profile_filename);
	end % else of if ~exist

	name_C = {p.FunctionTable.CompleteName};
	disp(cvec(name_C));

	id= (   cellfun(@(x) isempty(regexp(x,'^/usr/.*','once')),name_C) ...
	      & cellfun(@(x) isempty(regexp(x,'^com.mathworks','once')),name_C) ...
	      & cellfun(@(x) isempty(regexp(x,'^java.','once')),name_C) ...
	      & cellfun(@(x) isempty(regexp(x,'src-external','once')),name_C) ...
	    );

	% strip function name
	name_C = unique(cellfun(@(x) regexprep(x,'>.*',''),name_C(id),'UniformOutput',false));
	name_C = cellfun(@(x) strrep(x,'/home/pia/1/trunk/','/home/pia/phd/src/'),name_C,'uniformoutput',false);
	% add pdfprint function by default
	% TODO no magic names
	name_C{end+1} = '/home/pia/phd/src/lib/auxiliar/plot/pdfprint.m';

	% strip file name of class folders
	if (0)
	for idx=1:length(name_C)
		fdx = strfind(name_C{idx},'@');
		if (~isempty(fdx))
			sdx = fdx+regexp(name_C{idx}(fdx+1:end),'/','once');
			name_C{idx} = name_C{idx}(1:sdx-1);
		end
	end % for idx
	end % if 0

	% add class files (for static classes)
	for idx=1:length(name_C)
		path_ = dirname(name_C{idx});
		dir_  = basename(path_);
		if ('@' == dir_(1))
			name_C{end+1} = [path_,filesep,dir_(2:end),'.m'];
		end
	end % for idx

	% strip rootfolder
	name_C = cvec(cellfun(@(x) strrep(x,[ROOTFOLDER,'src/'],''),name_C,'Uniformoutput',false));

	name_C = unique(name_C);

	switch (version_control_system)
		case {'git'}
			% get git commit hash
			for idx=1:length(name_C)
				rev_C{idx} = 'N/A';
				dir_str = dirname([ROOTFOLDER,'/src/',name_C{idx}]);
				%cmd = sprintf('git rev-parse HEAD "%s" | head -n 1',[ROOTFOLDER,'/src/',name_C{idx}]);
				cmd = sprintf('cd %s && git rev-parse HEAD',dir_str);
				[retval,ret_str] = system(cmd);
				if (0 == retval)
					commit_C{idx} = chomp(ret_str);
				else
					disp(ret_str);
					commit_C{idx} = 0;
				end
			end
		case {'svn'}

			% get svn revision number
			for idx=1:length(name_C)
				cmd = sprintf('svn info --show-item revision %s\n',[ROOTFOLDER,'/src/',name_C{idx}]);
				[retval,ret_str] = system(cmd);
				if (0 == retval)
					rev_C{idx,1} = chomp(ret_str);
				else
					rev_C{idx} = '0';
				end
			end % for idx

			% get git commit hash
			for idx=1:length(name_C)
				cmd = sprintf('svn info --show-item repos-root-url %s',[ROOTFOLDER,'/src/',name_C{idx}]);
				[retval,ret_str] = system(cmd);
				if (0 == retval)
					url = chomp(ret_str);
					% remove the lib
					c = strsplit(name_C{idx},filesep);
					c = join(c(3:end),'/');

					cmd = sprintf('svn propget git-commit --revprop -r HEAD %s\n',[url,'/',c{1}]);
					[retval,ret_str] = system(cmd);
					if (0 == retval)
						commit_C{idx,1} = chomp(ret_str);
					else
						commit_C{idx} = 0;
					end % if 0 == retval
				else
					commit_C{idx} = 0;
				end % if 0 == retval
			end % for idx
	end % switch version control

	% determine library files
	fid = fopen(dep_filename,'w');
	if (fid < 0)
		error('cannot open file for writing')
	end % if fid < 0
	for idx=1:length(name_C)
		name = name_C{idx};
		if (strcmp(name(1:4),'lib/'))
			%name_ = strsplit(name,'/');
			fprintf(fid,'%s %s %s\n',name(5:end),rev_C{idx},commit_C{idx});
		end
	end % for idx

	fclose(fid)
	type(dep_filename);

end % function dependencies_determine

