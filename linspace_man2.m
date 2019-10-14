% 2014-05-27 19:08:01.293539460 +0200

function [X_ Y_] = ls_man(X,Y,n,half)

if (isempty(X))
	X_ = [];
	Y_ = [];
	return;
end

x0 = X(:,1);
xend = X(:,2);
if (half)
	dx = (xend-x0)/(n);
	X_ = repmat(x0,1,n) + dx*(0.5:n-0.5);
else
	dx = (xend-x0)/(n+1);
	X_ = repmat(x0,1,n) + dx*(1:n);
end

x0 = Y(:,1);
xend = Y(:,2);
if (half)
	dx = (xend-x0)/(n);
	Y_ = repmat(x0,1,n) + dx*(0.5:n-0.5);
else
	dx = (xend-x0)/(n+1);
	Y_ = repmat(x0,1,n) + dx*(1:n);
end

end

