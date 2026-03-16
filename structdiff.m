% 2025-08-10 09:53:30.424803713 +0200
function [d,fdx]=structdiff(p,q)
	d = struct();
	f_C = fieldnames(p);
	for idx=1:length(f_C)
		if (isfield(q,f_C{idx}))
			if (  isnumeric(p.(f_C{idx}) ) ...
			    & isnumeric(p.(f_C{idx})) )
				d.(f_C{idx}) = (p.(f_C{idx}) - q.(f_C{idx}));
			end
		end
	end
end

