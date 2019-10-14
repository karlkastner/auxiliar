% 2017-05-02 14:01:12.741520468 +0200 wrap.m
% unwrap a function with period T
function x=unwrap_periodic(x,T)
	y=x;
	for idx=2:length(y)
		if (~isfinite(y(idx)))
			y(idx)=y(idx-1);
		end
	end

	fdx = find(y(2:end)<y(1:end-1),1,'first')+1;
	x(fdx:end)=x(fdx:end)+T;
end
