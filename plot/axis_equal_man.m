function axis_equal_man()
	x = xlim;
	y = ylim;
	x0 = mean(x);
	y0 = mean(y);
	w = max(diff(x),diff(y));
	xlim(x0 + 0.5*w*[-1 1]);
	ylim(y0 + 0.5*w*[-1 1]);
end
