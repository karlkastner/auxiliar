% Mon  8 Aug 17:03:12 CEST 2016
% Karl Kastner, Berlin
function [nc info] = nc_read_sequential(filename,dimname,bid,bsiz,fieldname)
        nc = [];

	if (isempty(filename) || length(filename) == 0)
		return;
	end

	if (nargin() < 5)
		fieldname = [];
	end

        info = ncinfo(filename);
	tid  = strcmp({info.Dimensions.Name},dimname);
	if (sum(tid)>0)
		n    = info.Dimensions(tid).Length;
	else
		n = inf;
	end

	% do not read beyond end of file
	if ((bid-1)*bsiz + 1 > n)
		return;
	end

        fieldname_C = {info.Variables.Name};
	% for each variable
        for idx=1:length(fieldname_C)
		if (isempty(fieldname) || strcmp(fieldname_C{idx},fieldname))
		di  = info.Variables(idx).Dimensions;
		if (~isempty(di))
			start = zeros(size(di));
			count = zeros(size(di));
			for jdx=1:length(di)
				if (strcmp(di(jdx).Name,dimname))
					if (bsiz < inf)
						start(jdx) = (bid-1)*bsiz + 1;
					else
						start(jdx) = 1;
					end
					count(jdx) = min(bsiz,n-start(jdx)+1);
				else
					start(jdx) = 1;
					count(jdx) = di(jdx).Length;
				end
			end % for jdx (each dimensions)
			nc.(fieldname_C{idx}) = ncread(filename,fieldname_C{idx}, start, count);
		else
                	nc.(fieldname_C{idx}) = ncread(filename,fieldname_C{idx});
		end % if
		end
        end % for idx (each variable)
end % nc_read_sequential()

