% Wed  8 Feb 09:52:04 CET 2017
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
%% combined figure and subplot
%
% function fh = splitfigure(siz,id,flag,name)
%
function [fh,ax,t] = splitfigure(siz,id,flag,name,factor,usetiledlayout,t,varargin)
	if (nargin() < 4 || isempty(name))
		name = '';
	end
	if (nargin() < 5 || isempty(factor))
		factor = 10;
	end
	if (nargin()<6)
		usetiledlayout = false;
	end
	if (flag)
		fh = namedfigure(factor*id(1)+id(2),name,varargin{:});
		if (~usetiledlayout)
			ax = subplot(1,1,1);
		else
			t  = tiledlayout(1,1);
			ax = axes(t);
			%nexttile(id(2));
		end
	else
		fh = namedfigure(factor*id(1),name,varargin{:});
		if (~usetiledlayout)
			ax = subplot(siz(1),siz(2),id(2));
		else
			if (1 == id(2))
				t = tiledlayout(siz(1),siz(2));
			end
			nexttile(id(2));
			%ax = axes(t);
			ax = gca;
		end
	end
end % splifigure

