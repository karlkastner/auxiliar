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

	% add class files
%	for idx=1:length(name_C)
%		fdx = strfind(name_C{idx},'@');
%		if (~isempty(fdx))
%			sdx = fdx+regexp(name_C{idx}(fdx+1:end),'/','once');
%			name_C{idx} = name_C{idx}(1:sdx-1);
%		end
%	end % for idx
	

	% strip rootfolder
	name_C = cvec(cellfun(@(x) strrep(x,[ROOTFOLDER,'src/'],''),name_C,'Uniformoutput',false));

	name_C = unique(name_C);

	% get revision number
	for idx=1:length(name_C)		
		cmd = sprintf('svn info --show-item revision %s\n',[ROOTFOLDER,'/src/',name_C{idx}]);
		[retval,ret_str] = system(cmd);
		if (0 == retval)
			rev_C{idx,1} = chomp(ret_str);
		else
			rev_C{idx} = '0';
		end
	end
	
	% get git commit hash
	for idx=1:length(name_C)
		cmd = sprintf('svn info --show-item repos-root-url %s',[ROOTFOLDER,'/src/',name_C{idx}]);
		[retval,ret_str] = system(cmd);
		if (0 == retval)
		url = chomp(ret_str);
		% remove the lib
		name_C{idx}
		c = strsplit(name_C{idx},filesep);
		c = join(c(3:end),'/');
c
		cmd = sprintf('svn propget git-commit --revprop -r HEAD %s\n',[url,'/',c{1}]);
		[retval,ret_str] = system(cmd);
		if (0 == retval)
			commit_C{idx,1} = chomp(ret_str);
		else
			commit_C{idx} = 0;
		end
		else
			commit_C{idx} = 0;
		end
	end
%https://github.com/karlkastner/auxiliar/addpath_recursive.m


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

