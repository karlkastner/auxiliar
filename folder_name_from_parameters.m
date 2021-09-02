% 2020-03-17 15:54:12.933967393 +0800 delft3d_test_folder_name.m
function [folder, hfolder, h] = folder_name_from_parameters(base,param,sortflag)

	[field_C,value_C] = folder_name_from_parameters_({},{},param);
	if ( nargin()>2 & sortflag )
		[v,sdx] = sort(lower(field_C));
		% sort values
		field_C = field_C(sdx);
		value_C	= value_C(sdx);
	end
	% merge fields and values
	folder_C = {};
	h  = 0;
	id = 1;
	for idx=1:length(field_C)
		folder_C{idx} = [field_C{idx},'_',flat(value_C{idx})'];
		[h,id]        = hash_str(field_C{idx},h,id);
		[h,id]        = hash_str(value_C{idx},h,id);
	end
	folder_C = join(folder_C,'-');
	if (length(folder_C)>0)
		folder   = [base,'-',folder_C{1}];
	else
		folder = base;
	end
	hfolder  = [base,'-',sprintf('%010d',h)];
end

function [field_C, value_C] = folder_name_from_parameters_(field_C,value_C,param)

	field_C_ = fieldnames(param);

%	folder = base;	

	for idx=1:length(field_C_)
		field_C_{idx}
		val = param.(field_C_{idx});
		if (isstruct(val))
			[field_C, value_C] = folder_name_from_parameters_(field_C,value_C,val);
		else
			if (isnumeric(val)||islogical(val))
				val = num2str(val);
			end
			if (isstr(val))
				field_C{end+1} = field_C_{idx}; %,'_',val];
				value_C{end+1} = val;
			else
				warning(['skipping field ',field_C_{idx}]);
			end
			% folder_C{end+1} = [folder,'-',field_C{idx},'_',val];
		end
	end
end % folder_name_from_parameters

