% 2014-11-26 18:01:51.969138940 +0100
% Karl Kästner, Berlin
%
%% create a figure and set its window title
%
% function varargout = namedfigure(n,name_str)
function varargout = namedfigure(n,name_str)
	fh = figure(n);
	if (~isempty(name_str))
		set(fh,'Name',name_str);
	end
	if (nargout() > 0)
		varargout{1} = fh;
	else
		varargout = {};
	end
end

