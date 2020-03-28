% Fri 21 Feb 21:13:00 +08 2020
% Karl Kastner, Berlin

function s = structfun_deep(fun,s)
	field_C = fieldnames(s);
	for idx=1:length(field_C)
		val = s.(field_C{idx});
		if (~isstruct(val))
			s.(field_C{idx}) = feval(fun,val);
		else
			s.(field_C{idx}) = structfun_deep(fun,s.(field_C{idx}));
		end
	end
end

