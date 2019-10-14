function xticklabel(varargin)
	switch (class(varargin{1}))
	case {'matlab.graphics.axis.Axes'}
		ax  = varargin{1};
		l1 = 2;
	otherwise
		ax = gca;
		l1 = 1;
	end
	set(ax,'xticklabel',varargin(l1:end));
end
