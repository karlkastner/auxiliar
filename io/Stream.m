% Wed 19 Oct 13:45:17 CEST 2016
% Karl Kastner, Berlin
classdef Stream < handle
	properties
		data
		pos
	end % properties
	methods
		function obj = Stream()
			%obj.filename = filename;
		end % constructor
		
		function init(obj,filename)
			% open input file
			fin = fopen(filename,'r');

			if (-1 == fin)
				error(['Stream: Cannot open file :',filename,' for reading.']);
			end % if
			% read entire file at once
			obj.data = fread(fin,'*uint8');
			obj.pos  = 0;
		
			% close input file
			fclose(fin);
		end % init

		function [val, obj] = read_float(obj)
			val = typecast(uint8(obj.data(obj.pos+1:obj.pos+4)),'single');
			obj.pos = obj.pos+4;
		end
		function [val, obj] = read_uint8(obj,n)
			if (nargin() < 2)
				n = 1;
			end
			val = typecast(uint8(obj.data(obj.pos+1:obj.pos+n)),'uint8');
			obj.pos = obj.pos+n;
		end
		function [val, obj] = read_uint16(obj)
			val = typecast(uint8(obj.data(obj.pos+1:obj.pos+2)),'uint16');
			obj.pos = obj.pos+2;
		end
		function [val, obj] = read_int16(obj)
			val = typecast(uint8(obj.data(obj.pos+1:obj.pos+2)),'int16');
			obj.pos = obj.pos+2;
		end
		function [val, obj] = read_int32(obj)
			val = typecast(uint8(obj.data(obj.pos+1:obj.pos+4)),'int32');
			obj.pos = obj.pos+4;
		end
		function [val, obj] = read_uint32(obj)
			val = typecast(uint8(obj.data(obj.pos+1:obj.pos+4)),'uint32');
			obj.pos = obj.pos+4;
		end
		function obj = skip(obj,n)
			obj.pos = obj.pos+n;
		end
		function [val, obj] = read(obj,n)
			val = obj.data(obj.pos+1:obj.pos+n);
			obj.pos = obj.pos+n;
		end
		function [flag, obj] = end(obj)
			flag = (obj.pos > length(obj.data));
		end
	end % methods
end % Stream

