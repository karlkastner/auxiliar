% Mon  6 Dec 09:43:57 CET 2021
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
%% has the model parameters for filename generation
%
function [key_val, key_str] = hashobj(obj,hashfield_C) 
	key_str = keyfun('',obj,hashfield_C,'');
	key_val = hash_str(key_str);

	function key_str = keyfun(key_str,s,field_C,prefix)
		for idx=1:length(field_C)
			val = getfield_deep(s,field_C{idx});
			% hot fix, otherwise hash changes after run/init
			if (strcmp(field_C{idx},'z0'))
				val = [];
			end
			% hot fix, otherwise hash changes after run/init
			if (strcmp(field_C{idx},'p'))
				% TODO hot fix
				val = struct();
			end
			if (isstruct(val))
				key_str = keyfun(key_str,val,fieldnames(val),[prefix,'.',field_C{idx}]);
			else
				if (isstr(val))
					val_s = val;
				elseif (isa(val,'function_handle'))
					val_s = func2str(val);
				elseif (iscell(val))
					for cdx=1:length(val)
						val_s = '';
						if (isempty(val{cdx}))
							% nothing to do
						elseif (isstr(val{cdx}))
							if (isempty(val_s))
								val_s = val{cdx};
							else
								val_s = [val_s,' ',val{cdx}];
							end
						else
							error('not yet implmented')
						end
					end % for cdx
				elseif (isnumeric(val))
					if (length(val)>2)
						val_s = hash_float(val);
					else
						val_s = sprintf('%g',val);
					end
				else
					error('unimplemented type');
				end % type of val
				if (isempty(prefix))
					key_str = [key_str, sprintf('%s=%s;',field_C{idx},val_s)];
				else
					key_str = [key_str,sprintf('%s=%s;',[prefix,'.',field_C{idx}],val_s)];
				end % else of isempty prefix
			end % else of isstruct val
end % hashobj

