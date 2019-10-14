function h = area_man(x,y,varargin)
	x = cvec(x);
	y = cvec(y);
	h = patch([x x],[0*y y],varargin{:});
end
