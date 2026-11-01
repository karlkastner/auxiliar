% Sat Jan 10 15:59:22 CET 2015
% Karl Kastner, Berlin
%
%%function s = setfield_deep(s,fieldname,value)
%%
%% set values of a struct or object, fieldnames can have sub-fields indicated by dots
%
function s = setfield_deep(s,fieldname,value,must_exist)
	if (must_exist && ~isfield(s,field_A{1}) && ~isprop(s,field_A{1}))
		msg = sprintf('Field or property %s does not exist in target.',fieldname);
		error(msg);
	end

	field_A = strsplit(fieldname,'.');
	% set recursively
	if (length(field_A) > 1)
		fieldname = strjoin(field_A(2:end),'.');
		if (~isfield(s,field_A{1}) && ~isprop(s,field_A{1}))
			s.(field_A{1}) = struct();
		end
		s.(field_A{1}) = setfield_deep(s.(field_A{1}),fieldname,value);
	else
		s.(field_A{1}) = value;
	end
end % setfield_deep

