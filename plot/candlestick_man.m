function [h] = candlestick_man(x,y,l,u,varargin)
	for idx=1:length(x)
		x_(3*idx-2)  = x(idx);
		x_(3*idx-1)  = x(idx);
		x_(3*idx)    = NaN;
		y_(3*idx-2,:) = l(idx,:);
		y_(3*idx-1,:) = u(idx,:);
		y_(3*idx)    = NaN;
	end
	h = plot(x_,y_,varargin{:});
end
