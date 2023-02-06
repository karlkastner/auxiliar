% 2022-05-17 09:54:38.224803313 +0200
function labelline(x,y,lab)
	if (isnumeric(lab))
	lab = num2str(lab);
	end
	id = floor((length(x)-1)/2)
	a = atan2d(diff(y(id+(1:2))),diff(x(id+(1:2))));
	%a = atan2d(diff(x(id+(1:2))),diff(y(id+(1:2))));
	text(mid(x(id+(1:2))),mid(y(id+(1:2))), lab, 'BackgroundColor', 'w', 'rotation', a);
