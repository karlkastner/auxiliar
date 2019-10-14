function scaleplot(dw,dh)
	pos=get(gca,'position');
	%d=0.1;
	x0 = pos(1);
	y0 = pos(2);
	width  = pos(3);
	height = pos(4);
	set(gca,'position',[x0-0.5*(dw-1)*width,...
                            y0-0.5*(dh-1)*height, ...
			    dw*width, ...
			    dh*height]);
end

