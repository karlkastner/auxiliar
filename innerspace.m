% Thu 31 May 14:32:07 CEST 2018
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
%% linearly increasing vector sampled at mid-intervals
%
function x = innerspace(x0,x1,n)
	if (nargin() < 3)
		n = 100;
	end
% this is wrong
%	x = x0 + (x1-x0)*(1:n)/(n+1);
	x = mid(linspace(x0,x1,n+1));
end
