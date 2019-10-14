% Tue  5 Jun 11:35:23 CEST 2018
function [xy0] = relpos(varargin)
	if (1 == nargin)
		ax = gca;
		p = varargin{1};
	else
		ax = varargin{1};
		p  = varargin{2};
	end
	x = xlim(ax);
	y = ylim(ax);
	xy0(1) = x(1) + p(1)*(x(2)-x(1));
	xy0(2) = y(1) + p(2)*(y(2)-y(1));
end

