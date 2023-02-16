function s = table2tex(tab)
	s = '\\begin{tabular}{';
	s = [s,'l'];
	for idx=2:size(tab,2)
		s = [s,'r'];
	end
	s = [s,'}\n'];
	v = tab.Properties.VariableNames;
	for idx=1:size(tab,2)
		if (idx>1)
		s = [s,'& '];
		end
		s = [s,strrep(v{idx},'\','\\')];
	end
	
	for idx=1:size(tab,1)
		for jdx=1:size(tab,2)
			if (jdx>1) %size(tab,2))
				s = [s,' &'];
			else
				s = [s,'\n\\\\'];
			end
			switch (class(tab{idx,jdx}))
			case {'double'}
				s = [s,num2str(tab{idx,jdx})];
			case {'string'}
				s = [s,tab{idx,jdx}{1}];
			end
		end
	end
	s = [s,'\n\\end{tabular}\n'];
end

