% 2015-03-07 16:00:10.571050937 +0100
% Karl Kastner, Berlin

function tick = monthtick(ax,fmt,step)
	if (nargin()<1)
		ax = gca;
	end
	if (nargin()<2)
		fmt = 'mm/yy';
	end
	if (nargin() < 3)
		step = 1;
	end
	lim  = xlim(ax);
	tick = unique(monthspace(lim(1),lim(end)));
	set(ax,'xtick',tick(1:step:end),'xticklabel', ...
		datestr(tick(1:step:end),fmt));
end

