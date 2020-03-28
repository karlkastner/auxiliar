% Mo 26. Okt 19:10:29 CET 2015
% Karl Kastner, Berlin
function [nc, info] = nc_readall(filename)
	nc = struct();
	info = ncinfo(filename);
	if (~isempty(info.Variables))
		fieldname_C = {info.Variables.Name};
		for idx=1:length(fieldname_C)
			f = fieldname_C{idx};
			if (f(1) >= '0' && f(1) <= '9')
				f = ['n',f];
			end
			nc.(f) = ncread(filename,fieldname_C{idx});
		end
	end
	if (~isempty(info.Attributes))
		fieldname_C = {info.Attributes.Name};
		for idx=1:length(fieldname_C)
			field = fieldname_C{idx};
			% avoid overwriting of viels
			while (isfield(nc,field))
				field(end+1) = '_';
			end
			nc.(fieldname_C{idx}) = info.Attributes(idx).Value;
		end
	end
end

