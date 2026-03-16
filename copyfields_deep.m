% Tue  7 Jan 10:08:49 +08 2020
% function dest = copyfields_deep(src,dest)
% copy fields from struct 1 to struct 2
function dest = copyfields_deep(src,dest)
	f = fieldnames(src);
%	for fi = rvec(f)
	for idx = 1:length(f)
		if (isstruct(src.(f{idx})))
			if (    ~isfieldorprop(dest,f{idx}) ...
			     || (   ~isstruct(dest.(f{idx})) ...
                                 && ~isobject(dest.(f{idx})) ...
				) ...
			   )
				dest.(f{idx}) = src.(f{idx});
			else
				dest.(f{idx}) = copyfields_deep(src.(f{idx}),dest.(f{idx}));
			end
		else
			dest.(f{idx}) = src.(f{idx});
		end
	end
end
