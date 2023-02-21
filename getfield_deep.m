%Fr 10. Apr 14:25:26 CEST 2015
% Karl Kastner, Berlin
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
% demonstration, that averaging densities with the same distribution
% but different regularity results in a density that is more pointed
% and has heavier tales than the underlying distribution
%
%% function value = getfield_deep(s,fieldname)
%
function value = getfield_deep(s,fieldname)
	% note "nomagic" match, '.' has not to be scaped with \
	field_A = strsplit(fieldname,'.');
	% get recursively
	if (length(field_A) > 1)
		fieldname = strjoin(field_A(2:end),'.');
		value = getfield_deep(s.(field_A{1}),fieldname);
	else
		value = s.(field_A{1});
	end
end

