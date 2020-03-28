% Fri 14 Sep 18:43:57 CEST 2018
function b = xml2struct(a)
	b = struct();
	b.Attributes = attributes(a.Attributes);
	b.Data       = a.Data;
	for idx=1:length(a.Children)
		name = a.Children(idx).Name;
		name = strrep(name,'#','');
		if (isfield(b,name))
			b.(name)(end+1) = xml2struct(a.Children(idx)); 
		else
			b.(name) = xml2struct(a.Children(idx));
		end
	end
end

function s = attributes(a)
	s = struct();
	for idx=1:length(a)
		name = a(idx).Name;
		s.(name) = a(idx).Value;
	end
end
