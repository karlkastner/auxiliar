% Thu 19 Nov 09:30:47 +08 2020
function s = setfield_behind(s,field,value,predecessor)
	s.(field) = value;
	f = fieldnames(s);
	pdx=find(strcmp(f,predecessor));
	if (isempty(pdx))
		warning(['field ',predecessor,' does not exist']);
	else
	% current position of field, not necessary the last, if field already existed
	fdx=find(strcmp(f,field));
	if (isempty(pdx))
		error('');
	end
	n = length(f);
	if (fdx < pdx)
		p = [1:fdx-1, fdx+1:pdx, fdx, pdx+1:n];
		s = orderfields(s,p);
	else
		p = [1:pdx, fdx, pdx+1:fdx-1, fdx+1:n];
		s = orderfields(s,p);
	end
	% do not do anything, if fdx == pdx
	end
end
