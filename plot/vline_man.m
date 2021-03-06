% 2014-11-03 18:54:53.806010046 +0100
% Karl Kastner, Berlin

function varargout = vline(varargin)
	switch (class(varargin{1}))
	case {'matlab.graphics.axis.Axes'}
		ax = varargin{1};
		id = 2;
	otherwise
		ax = gca;
		id = 1;
	end
	x0 = varargin{id};
%	hx=graph2d.constantline(x0,varargin{:});
%	changedependvar(hx,'x');
%	plot([x0 x0],[realmin realmax],varargin{:});	
	yl = repmat(ylim(),length(x0(:)),1);
	ih = ishold();
	hold on;
	if (nargin() < 2)
		h = plot([x0(:) x0(:)]',ylim','color',[0 0 0],varargin{id+1:end});	
	else
		h = plot([x0(:) x0(:)]',ylim',varargin{id+1:end});	
	end
	if (~ih)
		hold off;
	end
	if (nargout() > 1)
		varargout{1} = h;
	else
		varargout = {};
	end
end

