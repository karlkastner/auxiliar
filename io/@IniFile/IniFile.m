% Sat 13 Aug 13:27:34 CEST 2016
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
% along with this program.  If not, see <https://www.gnu.org/licenses/>.

classdef IniFile < handle
	properties
		file_str = '';
%		data     = {};
		section_C
		key_C
		val_C
	end % methods
	methods
		function obj = IniFile(file_str)
			if (nargin() > 0)
				obj.file_str = file_str;
			end
		end
		function obj = read(obj,file_str)
			if (nargin() > 1)
				obj.file_str = file_str;
			end
			data = inifile(obj.file_str,'readall');
			obj.section_C = data(:,1);
			obj.key_C     = data(:,3);
			obj.val_C     = data(:,4);
		end
		function [val obj] = get(obj,section_str,key_str)
			fdx =     strcmp(obj.section_C,section_str)    ...
				& strcmp(obj.key_C,key_str);
			val = obj.val_C{fdx};
		end
		function [obj] = set(obj,section_str,key_str,val)
			fdx =     strcmp(obj.section_C,section_str)    ...
				& strcmp(obj.key_C,key_str);
			if (sum(fdx) > 0)
				if (isnumeric(val))
					val = num2str(val);
				end
				obj.val_C{fdx} = val;
			else
				error('adding not yet implemented')
			end
		end
		function obj = write(obj, file_str)
			if (nargin() > 1)
				obj.file_str = file_str;
			end
			data = {};
			data(:,1) = obj.section_C;
			data(:,2) = {''};
			data(:,3) = obj.key_C;
			data(:,4) = obj.val_C;
			inifile(obj.file_str,'new');
			inifile(obj.file_str,'write',data);
		end
	end % methods
end % classdef
