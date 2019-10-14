function s=signs(x)
	s = repmat(' ',length(x));
	s(x<0) = '-';
end
