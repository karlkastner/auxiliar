function dots(x,y,varargin)
	ih = ishold();
	col = colormap('lines');
	for idx=1:length(x)
		plot(x(idx),y(idx),varargin{:},'markerfacecolor',col(idx,:));
		hold on
	end
	if (~ih)
		hold off;
	end
end

