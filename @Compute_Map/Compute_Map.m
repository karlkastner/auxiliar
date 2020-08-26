% Sat 14 Oct 16:39:01 CEST 2017
%% container class to store multiple scenarios
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
% along with this program.  If not, see <https://www.gnu.org/licenses/>.
%
classdef Compute_Map < handle
	properties
		recompute = false;
		recflag   = false;
		autosave  = true;
		filename  = '';
		cmap
	end % properties
	methods
		function obj = Compute_Map(filename)
			if (nargin()>0)
				obj.filename = filename;
			end
		end % constructor

		function obj = init(obj)
			if (0 ~= exist(obj.filename,'file'))
				load(obj.filename,'cmap');
				obj.cmap = cmap;
			else
				disp('file not existing, creating new container')
				obj.cmap = containers.Map();
			end
		end % filename

		function obj = save(obj)
			if (obj.recflag)
				cmap = obj.cmap;
				save(obj.filename,'cmap');
				% reset recflag
				obj.recflag = false;
			end
		end % filename

		% Sat 14 Oct 16:41:04 CEST 2017
		function [obj] = run(obj,val_C,pflag)
				val_C = {obj,val_C{:}};
				if (nargin()>2 && pflag)
					iterate_cell(@plot,val_C);
				else
					iterate_cell(@fun,val_C);
				end
		end % run
	end % methods
end % Compute_Map

