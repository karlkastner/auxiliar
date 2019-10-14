% Mon  8 Aug 13:39:10 CEST 2016
% build_name_index
function nid = str_cell_reverse_index(str_C)
	str_C = lower(regexprep(str_C,' ','_'));
	fdx = find(cellfun(@isempty,str_C));
	for idx=1:length(fdx)
		str_C{fdx(idx)} = ['empty_',num2str(idx)];
	end

	str_C = lower(regexprep(str_C,' ','_'));
	nid=struct();
	for idx=1:length(str_C);
		nid.(str_C{idx}) = idx;
	end
%	nid = struct();
%	for idx=1:length(modelq)
%		nid.
%	end
end

