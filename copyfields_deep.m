% Tue  7 Jan 10:08:49 +08 2020
function p2 = copyfields_deep(p1,p2)
	f = fieldnames(p1);
%	for fi = rvec(f)
	for idx = 1:length(f)
		if (isstruct(p1.(f{idx})))
			if (~isfieldorprop(p2,f{idx}))
				p2.(f{idx}) = p1.(f{idx});
			else
				p2.(f{idx}) = copyfields_deep(p1.(f{idx}),p2.(f{idx}));
			end
		else
			p2.(f{idx}) = p1.(f{idx});
		end
	end
end
