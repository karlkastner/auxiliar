% 2014-12-16 11:59:33.782143893 +0100
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
%% reshape input vector to a column vector
function X = rvec(X)
	s = size(X);
	if (s(1)<=1 && s(2)<=1)
		% scalar or empty, nothing to do
	elseif (s(1)>1 && s(2) > 1)
		error('input must be a vector');
	elseif (s(1) > 1)
		% translate
		X = X.';
	else
		% nothing to do
	end	
%	if (isvector(X))
%		X = X(:);
%	end
end % cvec
