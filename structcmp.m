% 2025-08-10 09:53:40.307817868 +0200
function [df_C,flag,d] = structcmp(p,q)
	d = structdiff(p,q);
	f_C = fieldnames(d);
	for idx=1:length(f_C)
		flag(idx) = max(abs(d.(f_C{idx}))) > 0;
	end
	df_C = f_C(flag);
end


