function ax = zoomaxis(ax,scale)
	x0 = 0.5*(ax(1)+ax(2));
	ax(1:2) = x0 + scale*(ax(1:2)-x0);
	y0 = 0.5*(ax(3)+ax(4));
	ax(3:4) = y0 + scale*(ax(3:4)-y0);
end
