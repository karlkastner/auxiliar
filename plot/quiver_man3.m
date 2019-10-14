function quiver_man3(x0,y0,dx,dy,varargin)
	varargin = {'color',[0 0 0], varargin{:}};
	s = 0.1;
	ih = ishold;
	plot([x0,x0+dx],[y0,y0+dy],varargin{:});
	hold on
	%plot(x0+dx,y0+dx,x0+(1-s)*dx,y0+(1-s)*dy,varargin{:});
	%dx_ = -dy;
	% direction of arrowhead
	s_ = 2;
	d = -([dx dy] - [dy,-dx]/s_);
	plot([x0+dx,x0+dx+s*d(1)],[y0+dy,y0+dy+s*d(2)],varargin{:});
	d = -([dx dy] - [-dy,dx]/s_)
	plot([x0+dx,x0+dx+s*d(1)],[y0+dy,y0+dy+s*d(2)],varargin{:});
	if (~ih)
		hold off;
	end
end

