% Di 8. Sep 14:57:16 CEST 2015
% Karl Kastner, Berlin

function retval = isprop_deep(s,fieldname)
	if (~isobject(s))
		retval = isfield_deep(s,fieldname);
	else
	% leading field
	field_A = strsplit(fieldname,'\.');
	% test, if leading field exists
	retval = isprop(s,field_A{1});
	% recurse if head leading field exists and tail is not empty
	if (retval && length(field_A) > 1)
		% trailing fields
		fieldname = strjoin(field_A(2:end),'.');
		retval = isprop_deep(s.(field_A{1}),fieldname);
	end % if recurse
	end % if is an object (not a struct)
end % isprop_deep

