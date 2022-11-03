% 2015-08-21 19:07:35.673249363 +0200
% Karl Kästner, Berlin
%
%% print values to standard output
%
function printf(format, varargin)
	fprintf(1,format,varargin{:});
end

