% Mon Jun 23 14:24:59 WIB 2014
% Karl Kastner, Berlin

function rectangles(R)
	X = R(:,1);
	Y = R(:,3);
	W = R(:,2) - R(:,1);
	H = R(:,4) - R(:,3);

	for idx=1:length(R)
		rectangle('Position',[X(idx) Y(idx) W(idx) H(idx)]);
		%R(idx,:));
		hold on;
	end
end
