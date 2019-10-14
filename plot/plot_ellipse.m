% Tue Dec  2 13:41:04 CET 2014
% Karl Kastner, Berlin

function h = plot_ellipse(varargin)
	idx = 1;
	if (strcmp(class(varargin{idx}),'matlab.graphics.axis.Axes'))
		ax = varargin{idx};
		idx = idx+1;
	else
		ax = gca;
	end
	c   = varargin{idx};
	idx = idx+1;
	if (length(varargin) >= idx && ~isempty(varargin{idx}))
		p = varargin{idx};
	else
		p = [];
	end
	idx = idx+1
	if (length(varargin) >= idx && ~isempty(varargin{idx}))
		n = varargin{idx};
	else
		n = [];
	end
	if (length(varargin) >= idx)
		idx=idx+1;
	end
	parg  = varargin(idx:end);

	[X Y] = ellipse(c,p,n);

	h = plot(ax,X,Y,parg{:});
end % plot_ellipse

