% 2015-03-13 16:55:23.675152859 +0100
% Karl Kastner, Berlin
%
% function h = errorlines(x,y,lower,upper,varargin)
function h = errorlines(x,y,lower,upper,varargin)
	ih = ishold();
	% fix for 2014 matlab version
	coi = get(gca,'ColorOrderIndex');
	h = plot(x,y,varargin{:});
	hold on
	if (nargin() < 4 || isempty(upper))
		s     = lower;
		lower = y-s;
		upper = y+s;
	end
	set(gca, 'ColorOrderIndex', coi);
	hl = plot(x,lower,varargin{:},'linestyle','--');
	for idx=1:length(hl)
		set(get(get(hl(idx),'Annotation'),'LegendInformation'),'IconDisplayStyle','off');
	end
	% fix for 2014 matlab version
	set(gca, 'ColorOrderIndex', coi)
	hu = plot(x,upper,varargin{:},'linestyle','--');
	for idx=1:length(hu)
		set(get(get(hu(idx),'Annotation'),'LegendInformation'),'IconDisplayStyle','off');
	end
	if (~ih)
		hold off;
	end
end

