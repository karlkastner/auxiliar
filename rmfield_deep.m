% Thu 17 Dec 13:50:14 +08 2020
% Karl Kastner, Berlin

function s = rmfield_deep(s,fieldname)
	field_A = strsplit(fieldname,'\.');
	% recurse
	if (length(field_A) > 1)
		fieldname = strjoin(field_A(2:end),'.');
		s.(field_A{1}) = rmfield_deep(s.(field_A{1}),fieldname);
	else
		s = rmfield(s,field_A{1});
	end
end

