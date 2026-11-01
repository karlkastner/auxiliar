% Tue  7 Jan 10:08:49 +08 2020
% function dest = copyfields_deep(src,dest)
% copy fields from struct 1 to struct 2
function dest = copyfields_deep(src,dest,must_exist)
	if (nargin()<3)
		must_exist = false;
	end
	f = fieldnames(src);
	for idx = 1:length(f)
		if (must_exist && ~isfieldorprop(dest,f{idx}))
			error(['Field or property ', f{idx}, ' does not exist in target.']);
		end
		if (isstruct(src.(f{idx})))
			if (        ~isfieldorprop(dest,f{idx}) ...
			     || (   ~isstruct(dest.(f{idx})) ...
                                 && ~isobject(dest.(f{idx})) ...
				) ...
			   )
			   
				dest.(f{idx}) = src.(f{idx});
			else
				dest.(f{idx}) = copyfields_deep(src.(f{idx}),dest.(f{idx}),must_exist);
			end
		else
				dest.(f{idx}) = src.(f{idx});
		end
	end
end
