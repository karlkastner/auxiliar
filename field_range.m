function s = field_range(s,fdx)
	field_C = fieldnames(s);
	for idx=1:length(field_C)
		s.(field_C{idx}) = s.(field_C{idx})(fdx);
	end
end

