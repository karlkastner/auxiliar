% 2016-11-29 18:36:34.938777439 +0100
function s = rmfield_optional(s,field)
	if (isfield(s,field))
		s  = rmfield(s,field);
	end
end

