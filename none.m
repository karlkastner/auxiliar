function x = none(x,dim)
	if (nargin() < 2)
		x = ~any(x);
	else
		x = ~any(x,dim);
	end
	
end
