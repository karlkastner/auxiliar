% 2025-08-10 17:52:46.275887668 +0200
function [d] = strucfun_paired(fun,p,q)
	d   = struct();
	f_C = fieldnames(p);
%	g_C = fieldnames(q);
	for idx=1:length(f_C)
		if (isfield(q,f_C{idx}))
			%$if (  isnumeric(p.(f_C{idx}) ) ...
			%    & isnumeric(q.(f_C{idx})) )
			try
				d.(f_C{idx}) = fun(p.(f_C{idx}),q.(f_C{idx}));
			catch e
				 e
			end
			%end
		end
	end
end
