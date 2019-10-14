% Mon  9 Apr 09:43:22 CEST 2018
function x = subsall(x,val)
	f_C = fieldnames(val);
	for idx=1:length(f_C)
		x = subs(x,f_C{idx},val.(f_C{idx}));
	end
end
