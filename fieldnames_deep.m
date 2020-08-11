% Fri 24 Apr 16:22:27 +08 2020
% Karl Kastner, Berlin

function ff = fieldnames_deep(s)
	f = {};
	if (isobject(s))
		f = properties(s);
	elseif (isstruct(s))
		f = fieldnames(s);
	end
	ff = {};
	for idx=1:length(f)
		if (isstruct(s.(f{idx})) | isobject(s.(f{idx})))
			f_ = fieldnames_deep(s.(f{idx}));
			for jdx=1:length(f_)
				ff{end+1} = [f{idx},'.',f_{jdx}];
			end
		else
			ff{end+1} = f{idx};
		end
	end
end

