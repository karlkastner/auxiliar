% Thu Feb 19 18:18:33 CET 2015
% Karl Kastner, Berlin
%
%% plot a horizontal line
%
function varargout = hline(varargin)
	switch (class(varargin{1}))
	case {'matlab.graphics.axis.Axes'}
		ax = varargin{1};
		id = 2;
	otherwise
		ax = gca;
		id = 1;
	end
	y0 = varargin{id};
%	hx=graph2d.constantline(x0,varargin{:});
%	changedependvar(hx,'x');
%	plot([x0 x0],[realmin realmax],varargin{:});	
	xl = repmat(xlim(),length(y0(:)),1);
	ih = ishold(ax);
	hold(ax,'on');
	if (nargin() < 2)
		h = plot(ax,xl',[y0(:) y0(:)]','color',[0 0 0],varargin{id+1:end});	
	else
		h = plot(ax,xl',[y0(:) y0(:)]',varargin{id+1:end});	
	end
	if (~ih)
		%hold off;
		hold(ax,'off');
	end

	if (nargout() > 0)
		varargout{1} = h;
	else
		varargout = {};
	end
end

