% Fr 22. Jan 17:31:04 CET 2016
% Karl Kastner, Berlin
function hlt = legendtitle(h,titlestr)
	hlt = text('Parent', h.DecorationContainer, ...
                   'String', titlestr, ...
                   'HorizontalAlignment', 'center', ...
                   'VerticalAlignment', 'bottom', ...
                   'Position', [0.5, 1.05, 0], ...
                   'Units', 'normalized');
end

