% Fri 15 Dec 14:16:25 CET 2017
% recursively copy field values to a to b
function b = copy_fields(a,b)
	f_C = fieldnames(a);
	for idx=1:length(f_C)
		name = f_C{idx};
		val  = a.(name);
		if ( (isstruct(val) || isobject(val)) ...
                     && isfield(b,name) )
			b.(name) = copy_fields(val,b.(name));
		else
			b.(name) = val;
		end % if
	end % for
end % copy_fields

