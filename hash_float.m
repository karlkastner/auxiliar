% Tue  9 Feb 12:33:39 CET 2021
function [h,id] = hash_float(f,varargin)
	s       = sprintf('%8e',f);
	[h, id] = hash_str(s,varargin{:});	
end

