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
	yl = repmat(ylim(ax),length(x0(:)),1);
	ih = ishold(ax);
	hold(ax,'on');
	if (nargin() < 2)
		% 
		h = plot(ax,[x0(:) x0(:)]',ylim','color',[0 0 0],varargin{id+1:end},'HandleVisibility','off');	
	else
		%h = plot(ax,[x0(:) x0(:)]',ylim','HandleVisibility','off',varargin{id+1:end});	
		h = plot(ax,[x0(:) x0(:)]',ylim',varargin{id+1:end},'HandleVisibility','off');	
	end
	if (~ih)
	%	set(ax,'hold','off');
		hold(ax,'off');
	end
	if (nargout() > 1)
		varargout{1} = h;
	else
		varargout = {};
	end
end

