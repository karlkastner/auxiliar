% 2015-04-06 19:26:16.621783732 +0200
% 2017-01-12 16:39:08.269157015 +0100
% Karl Kastner, Berlin
function x = dspace(x1,x2,dx)
	L = x2-x1;
	n = round(L/dx);
	x  = x1 + (x2-x1)*(0:n)/n;
	%x = linspace(x1,x2,n+1);
end

