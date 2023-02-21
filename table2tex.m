% 2023-02-14 21:25:03.604783095 +0100
% Karl Kastner, Berlin
%
% This program is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
%
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with this program.  If not, see <http://www.gnu.org/licenses/>.
%
% demonstration, that averaging densities with the same distribution
% but different regularity results in a density that is more pointed
% and has heavier tales than the underlying distribution
%

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

