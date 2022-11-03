% Thu 31 May 14:32:07 CEST 2018
% Karl Kästner, Berlin
%
%% linearly increasing vector sampled at mid-intervals
%
function x = innerspace(x0,x1,n)
	if (nargin() < 3)
		n = 100;
	end
% this is wrong
%	x = x0 + (x1-x0)*(1:n)/(n+1);
	x = mid(linspace(x0,x1,n+1));
end
