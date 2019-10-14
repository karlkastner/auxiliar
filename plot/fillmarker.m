% 2016-09-23 14:13:00.195286656 +0200
function fillmarker(h)
	for jdx=1:length(h)
		set(h(jdx),'Markerfacecolor',get(h(jdx),'color'));
	end
end
