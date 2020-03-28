% Sat 13 Aug 13:27:34 CEST 2016
% Karl Kastner, Berlin

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
