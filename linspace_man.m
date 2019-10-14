function X = linspace_man(x0,xend,n)
	dx = (xend-x0)/(n-1);
	X = repmat(x0,1,n) + dx*(0:n-1);
end % linspace_man

