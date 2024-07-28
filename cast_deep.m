% 2023-12-04 17:49:16.674406459 +0100
function s = cast_deep(s,type)
	f_C = fieldnames(s);
	for idx=1:length(f_C)
		p = s.(f_C{idx});
		if (isnumeric(p))
			s.(f_C{idx}) = type(p);
		elseif(isstruct(p))
			s.(f_C{idx}) = cast_deep(p,type);
		end
	end
end

