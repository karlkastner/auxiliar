% 2026-04-27 09:44:58.406496843 +0200
function s1 = struct_assign(s1,s2,id,jd)
	f_C = fieldnames(s2);
	for idx=1:length(f_C)
		f = f_C{idx};
		s1.(f)(id,jd) = s2.(f);
	end
end

