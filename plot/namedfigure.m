% 2014-11-26 18:01:51.969138940 +0100
% Karl Kästner, Berlin
%
%% create a figure and set its window title
%
% function varargout = namedfigure(n,name_str)
function varargout = namedfigure(n,name_str,varargin)
	if (length(varargin)>1 && strcmp(varargin{1},'Visible'))
		fh = findobj('type','figure','Number',n);
		if (isempty(fh))
		   vis = get(groot, 'DefaultFigureVisible');
		   set(groot, 'DefaultFigureVisible', varargin{2});
		   fh = figure(n);
		   set(groot, 'DefaultFigureVisible', vis);
		end
	else
		   fh = figure(n);
	end
	if (~isempty(name_str))
		set(fh,'Name',name_str);
	end
	if (nargout() > 0)
		varargout{1} = fh;
	else
		varargout = {};
	end
end

