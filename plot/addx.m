% 2015-06-25 15:01:18.925178429 +0200
% Karl Kastner, Berlin

%function [ax1 ax2] = plotxx(x1,y1,varargin)
function ax2 = addx(ax,varargin);
	p = 0.8;
	if (nargin()<1 || isempty(ax))
		ax = gca;
	end
	ax1 = ax(end);
	ax1_pos = ax1.Position; % position of first axes
	ax2 = axes('Position',ax1_pos,...
		   'XAxisLocation','top',...
                   'YAxisLocation','right',...
                   'Color','none', ...
		   'XColor','k');
	set(ax(1),'box','off')
	%set(ax2,'xcolor','none')
	hold(ax2,'on')
	for idx=1:2:length(varargin)
		if (strcmpi('xlabel',varargin{idx}));
			xlabel(ax2,varargin{idx+1});
%		elseif (strcmpi('title',varargin{idx}));
%			title(ax2,varargin{idx+1});
		else
			set(ax2,varargin{idx},varargin{idx+1});
		end
	end
	ax(end+1) = ax2;
	if (length(ax)>2)
	% correct positions
	for idx=1:length(ax)-1
		set(ax(idx),'pos',[ax1_pos(1:2),p*ax1_pos(3),ax1_pos(4)])
	end
	xlim_ = xlim(ax(1));
	xlim(ax(end),[xlim_(1),xlim_(1) + (xlim_(2)-xlim_(1))/p]);
	%linkaxes(ax,'x')
	end
end

