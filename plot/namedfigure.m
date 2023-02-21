% 2014-11-26 18:01:51.969138940 +0100
% Karl Kästner, Berlin
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

