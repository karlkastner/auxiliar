% Sat 12 May 15:30:21 CEST 2018
% Karl Kastner, Berlin

function tick = weektick(format)
	lim  = xlim();
	%tick = weekspace(lim(1),lim(end));
	tick = (round(lim(1)):round(lim(2)))';
	if (nargin() < 1)
		format = 'dd/mm/yy';
	end
	set(gca,'xtick',tick,'xticklabel',datestr(tick,format));
end

