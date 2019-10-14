% Tue Jan 14 12:56:55 WIB 2014
% Karl Kastner, Berlin

function mark_night(t)
	flag = ishold();
	hold on

	night = isnight(t);

	l = ylim();
	colour = [0.9 0.9 0.9];
	area(t,l(1)+night*(l(2)-l(1)),'FaceColor',colour,'edgecolor','none');

	if (~flag)
		hold off
	end
end

