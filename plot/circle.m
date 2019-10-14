% 2014-08-24 13:23:22.973190714 +0200
% Karl Kastner, Berlin

function h = circle2(X,Y,R,varargin)
	for idx=1:length(X)
		x = X(idx);
		y = Y(idx);
		r = R(idx);

		d = r*2;
		px = x-r;
		py = y-r;
		h = rectangle('Position',[px py d d],'Curvature',[1,1],varargin{:});
	end
end

