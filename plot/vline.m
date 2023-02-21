% 2014-11-03 18:54:53.806010046 +0100
% Karl Kastner, Berlin
%
% This program is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
%
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with this program.  If not, see <http://www.gnu.org/licenses/>.
%
%
%% plot a vertical line
%
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

