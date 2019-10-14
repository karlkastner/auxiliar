% 2018-09-19 15:44:26.627294157 +0200
function obj2 = copy(obj)
	mco = eval(['?',class(obj)]);
	p   = mco.PropertyList;

	obj2 = feval(class(obj));

	for idx=1:length(p)
		% TODO this fails by objects that cross references each other
		% and non-public members
		if (strcmp(p(idx).SetAccess,'public'))
		field = p(idx).Name;
		if (isobject(obj.(field)))
			obj2.(field) = objcopy(obj.(field));
		else
			obj2.(field) = obj.(field);
		end
	end
if (0)
%	f_C = properties(obj);
	for idx=1:length(f_C)
		% TODO this fails by objects that cross references each other
		% and non-public members
		if (isobject(obj.(f_C{idx})))
			obj2.(f_C{idx}) = objcopy(obj.(f_C{idx}));
		else
			obj2.(f_C{idx}) = obj.(f_C{idx});
		end
	end
end
end

