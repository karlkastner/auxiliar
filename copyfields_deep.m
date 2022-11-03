% Tue  7 Jan 10:08:49 +08 2020
function p2 = copyfields_deep(p1,p2)
	f = fieldnames(p1);
	for fi = rvec(f)
		if (isstruct(p1.(fi{1})))
			if (~isfieldorprop(p2,fi{1}))
				p2.(fi{1}) = p1.(fi{1});
			else
				p2.(fi{1}) = copyfields_deep(p1.(fi{1}),p2.(fi{1}));
			end
		else
			p2.(fi{1}) = p1.(fi{1});
		end
	end
end
