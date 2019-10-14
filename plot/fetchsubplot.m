% Thu Nov 20 20:11:47 CET 2014
function [hfig2 hax] = fetchsubplot(f,row,col,id,fnew,varargin) %rn,cn)
	if (nargin() > 4 & ~isempty(fnew))
		hfig = figure(fnew);
		hax2 = axis()
	else
		hfig2 = figure();
		hax2  = gca();
	end
%	figure(hfig);
%	if (nargin() > 5)
%		% TODO, replace this by print position
%		subplot(rn,cn,1);
%	end

	figure(f);
	subplot(row,col,id);
	hax = gca();
%	hax = copyobj(allchild(hax), hfig);
%	hax_ = copyobj(allchild(hax),hax2);
%	copyaxes(hax,hax2);
	copyobj(hax,hfig2);
	hax_ = hax;
	set(hax_, 'Position', get(0, 'DefaultAxesPosition'));
	if (nargin() > 5)
		set(hfig,varargin{:});
	end
end

