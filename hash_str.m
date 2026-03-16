% Tue  9 Feb 12:36:14 CET 2021
% Karl Kästner, Berlin
%
%  This program is free software: you can redistribute it and/or modify
%  it under the terms of the GNU General Public License as published by
%  the Free Software Foundation, either version 3 of the License, or
%  (at your option) any later version.
%
%  This program is distributed in the hope that it will be useful,
%  but WITHOUT ANY WARRANTY; without even the implied warranty of
%  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%  GNU General Public License for more details.
%
%  You should have received a copy of the GNU General Public License
%  along with this program.  If not, see <https://www.gnu.org/licenses/>.
%
%% function [h,a] = hash_str(s,h,a)
%% hash a string into a single number
%
function [h,a] = hash_str(s,h,a)
	if (nargin()<2)
		h = 0;
		a = 1;
	end
	n = 2^31;
	for idx=1:length(s)
		h  = h + a*s(idx);
		h  = mod(h, n);
		a  = 31*a;
		a  = mod(a, n);
	end
end

