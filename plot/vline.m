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
%	if (length(varargin)>id)
%		hv = varargin{id+1};
%	else
%		hf = 'off';
%	end
%	hx=graph2d.constantline(x0,varargin{:});
%	changedependvar(hx,'x');
%	plot([x0 x0],[realmin realmax],varargin{:});	
	yl = repmat(ylim(ax),length(x0(:)),1);
	ih = ishold(ax);
	hold(ax,'on');
	if (nargin() < 2)
		% 
		h = plot(ax,[x0(:) x0(:)]',ylim','color',[0 0 0],'HandleVisibility','off',varargin{id+1:end});	
	else
		%h = plot(ax,[x0(:) x0(:)]',ylim','HandleVisibility','off',varargin{id+1:end});	
		h = plot(ax,[x0(:) x0(:)]',ylim','HandleVisibility','off',varargin{id+1:end});	
	end
	if (~ih)
	%	set(ax,'hold','off');
		hold(ax,'off');
	end
	if (nargout() > 0)
		varargout{1} = h;
	else
		varargout = {};
	end
end

