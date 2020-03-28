% Mo 26. Okt 21:07:17 CET 2015
% Karl Kastner, Berlin

% TODO this does not write variable attributes
% TODO distinguish var and att
function nc = nc_writeall(filename,s,info)
%	if (exist(filename,'file'))
%		delete(filename);
%	end
	%nccreate(filename);

	ncid = netcdf.create(filename,'CLOBBER');

	dflag = false;
	if (nargin()>2)
		% write dimensions
		for idx=1:length(info.Dimensions)
			dimid_.(info.Dimensions(idx).Name) = netcdf.defDim(ncid,info.Dimensions(idx).Name,info.Dimensions(idx).Length);
		end
		dflag = true;
	end

	if (dflag)
		for idx=1:length(info.Variables)
			dimid = [];
			for jdx=1:length(info.Variables(idx).Dimensions)
				dimid(jdx) = dimid_.(info.Variables(idx).Dimensions(jdx).Name);
			end
			field = info.Variables(idx).Name;
			cls = class(s.(field));
		switch(cls)
		%case {'char'}
		%	%netcdf.endDef(ncid)
		%	varid = netcdf.getConstant('GLOBAL');
		%	netcdf.putAtt(ncid,varid,fieldname_C{idx},s.(field));
		%	%netcdf.reDef(ncid);
		%	continue;
		case {'double'}
			type = 'NC_DOUBLE';
		case {'int32'}
			type = 'NC_INT';
		otherwise
			error('data type not yet implemented');
		end % switch class of field
		varid = netcdf.defVar(ncid,field,type,dimid);
		netcdf.endDef(ncid)
		netcdf.putVar(ncid,varid,s.(field));
		netcdf.reDef(ncid);

		end % for idx
		for idx=1:length(info.Attributes)
			varid = netcdf.getConstant('GLOBAL');
			netcdf.putAtt(ncid,varid,info.Attributes(idx).Name, ...
						 info.Attributes(idx).Value);
		end
	else
	fieldname_C = fieldnames(s);
	for idx=1:length(fieldname_C)
		siz = size(s.(fieldname_C{idx}));
			dimid = netcdf.defDim(ncid,fieldname_C{idx},siz(1));
			%if (siz(1) > 1 && siz(2) > 1)
			if (siz(1) > 1 || siz(2) > 1)
				dimid(2) = netcdf.defDim(ncid,[fieldname_C{idx},'2'],siz(2));
			end
			cls = class(s.(fieldname_C{idx}));
		switch(cls)
		case {'char'}
			%netcdf.endDef(ncid)
			varid = netcdf.getConstant('GLOBAL');
			netcdf.putAtt(ncid,varid,fieldname_C{idx},s.(fieldname_C{idx}));
			%netcdf.reDef(ncid);
			continue;
		case {'double'}
			type = 'NC_DOUBLE';
		case {'int32'}
			type = 'NC_INT';
		otherwise
			error('data type not yet implemented');
		end % switch class of field
		varid = netcdf.defVar(ncid,fieldname_C{idx},type,dimid);
		netcdf.endDef(ncid)
		netcdf.putVar(ncid,varid,s.(fieldname_C{idx}));
		netcdf.reDef(ncid);
%        	nccreate(filename,fieldname_C{idx}, ...
%                                 'Dimensions',{fieldname_C{idx}, siz(1)}); %, 'c', siz(2)});
%		ncwrite(filename,fieldname_C{idx},s.(fieldname_C{idx}))
	end % for idx
	end
	netcdf.close(ncid);
end % nc_writeall

