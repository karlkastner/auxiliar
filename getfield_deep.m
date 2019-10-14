%Fr 10. Apr 14:25:26 CEST 2015
% Karl Kastner, Berlin

function value = getfield_deep(s,fieldname)
	field_A = strsplit(fieldname,'\.');
	% get recursively
	if (length(field_A) > 1)
		fieldname = strjoin(field_A(2:end),'.');
		value = getfield_deep(s.(field_A{1}),fieldname);
	else
		value = s.(field_A{1});
	end
end

