% Mon 27 Apr 09:38:37 CEST 2026
function s1 = struct_append(s1,s2,id,jd)
	f_C = fieldnames(s2);
	for idx=1:length(s2)
		f = f_C{idx};
		if (nargin()<3)
			s1.(f)(end+1) = s2.(f);
		else
			s1.(f)(id,jd) = s2.(f);
		end
	end
end


