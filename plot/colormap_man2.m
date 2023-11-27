% 2015-02-13 10:14:35.468372571 +0100
% Karl Kastner, Berlin

function mc = colormap_man2(name,lim)
	if (nargin()<2 || isempty(lim))
		lim = [0 1];
	end

%	X = (0:255)'/255;
	X = linspace(lim(1),lim(2),256)';
	lim = [0 1];
	switch (name)
	case {'RGB'}
		mc = min(lim(2),max(lim(1),[3*X 3*X-1 3*X-2]))
	case {'RBG'}
		mc = min(lim(2),max(lim(1),[3*X 3*X-2 3*X-1]));
	case {'GRB'}
		mc = min(lim(2),max(lim(1),[3*X-1 3*X 3*X-2]));
	case {'GBR'}
		mc = min(lim(2),max(lim(1),[3*X-2 3*X 3*X-1]));
	case {'BRG'}
		mc = min(lim(2),max(lim(1),[3*X-1 3*X-2 3*X]));
	case {'BGR'}
		mc = min(lim(2),max(lim(1),[3*X-2 3*X-1 3*X]));
	otherwise
		x=linspace(0,1,64)';
		mc = colormap(hsv2rgb([mod(-0.8*(1-x)+0.7,1) x.^0 (1-x)*0.75+0.25]));
	end % case
	% sigmoid
	A=[vander_1d([0 1]',3); vanderd_1d([0 1]',3,1)];
	scale = 2;
	c=A \ [0; 1; scale; scale];
%	c=A \ [0; 1; scale; scale];
	c=A \ [0; 1; 3; 1.5];
	%x =linspace(0,1,100)';
	for idx=1:3
		A = vander_1d(mc(:,idx),3);
		%plot(x,A*c);
		mc(:,idx) = A*c;
	end
end % mycolormap

