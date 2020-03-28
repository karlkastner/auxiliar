% Fri 21 Feb 21:13:00 +08 2020
% Karl Kastner, Berlin

function s2 = structcopy_deep(s1,s2)
	if (nargin()<2)
		s2 = struct();
	end
	field_C = fieldnames(s1);
	for idx=1:length(field_C)
		val = s1.(field_C{idx});
		if (~isstruct(val) || ~isfield(s2,field_C{idx}))
			s2.(field_C{idx}) = val;
		else
			s2.(field_C{idx}) = structcopy_deep(s1.(field_C{idx}),s2.(field_C{idx}));
		end
	end
end

