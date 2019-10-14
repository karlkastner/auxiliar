% 2015-03-07 16:02:15.096436766 +0100
% Karl Kastner, Berlin
function tick = hourtick(delta,fstr)
	if (nargin < 1)
		delta = 1/24;
	end
	if (nargin() < 2)
		fstr = 'HH:MM';
	end
	lim  = xlim();
	tick = hourspace(floor(lim(1)/delta)*delta,ceil(lim(end)/delta)*delta,delta);
	set(gca,'xtick',tick,'xticklabel',datestr(tick,fstr));
end

