% 2015-03-07 16:00:10.571050937 +0100
% Karl Kastner, Berlin
%
% function tick = weektick(format)
%
function tick = weektick(format)
	lim  = xlim();
	tick = weekspace(lim(1),lim(end));
	if (nargin() < 1)
		format = 'dd/mm/yy';
	end
	set(gca,'xtick',tick,'xticklabel',datestr(tick,format));
end

