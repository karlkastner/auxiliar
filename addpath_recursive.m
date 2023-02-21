% Thu 27 Jun 13:28:22 CEST 2019
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
%% recursively add a directory and sub-directories to the Matlab search path
%% call restoredefaultpath to undo this
function d_ = addpath_recursive(d)
	d_ = dir(d);
	addpath(d);
	for id = 1:length(d_)
		if (d_(id).isdir)
		d_id = d_(id).name;
		if ( ~strcmp(d_id(1),'.') ...
		     && ~(d_id(1) == '@') )
			d__ = [d,filesep,d_id];
			addpath_recursive(d__);
			addpath(d__);
		end
		end
	end % for id
end % addpath_recursive

