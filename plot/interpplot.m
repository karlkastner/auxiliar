% Thu 24 May 18:30:42 CEST 2018
function h = splineplot(x,y,varargin)
	method = 'pchip';
	%method = 'spline';
	n = 100;
	if (isvector(y))
		y = cvec(y);
	end
	for idx=1:size(y,2)
	ds = hypot(diff(x),diff(y(:,idx)));
	ds = rvec(abs(diff(x)));
	s  = [0,cumsum(ds)];
	% normalize
	s = s/s(end);
	si = linspace(0,1,n);
	xi(:,idx) = interp1(s,x,si,method);
	yi(:,idx) = interp1(s,y(:,idx),si,method);
	%x_  = (x-x(1))/(x(end)-x(1));
	%xi_ = (xi-xi(1))/(xi(end)-xi(1));
	%yi  = interp1(xi,y,xi_,'spline');
	end
	h   = plot(xi,yi,varargin{:});
end

