% 2015-08-21 19:07:35.673249363 +0200
function printf(format, varargin)
	fprintf(1,format,varargin{:});
end

