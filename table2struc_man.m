function s = table2struct_man(tab,cdx)
	s = struct();
	colname = tab.Properties.VariableNames;
	for idx=1:size(tab,1)
		rowname = tab.(colname{cdx}){idx};
		for jdx=1:length(colname);
		s.(rowname).(colname{jdx}) = tab.(colname{jdx})(idx);
	end
end
