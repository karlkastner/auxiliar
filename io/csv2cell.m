% Tue Jul  2 13:24:06 UTC 2013
% Karl Kästner, Berlin

function C = csv2cell(filename,delim)
	C = {};
	fid = fopen(filename);
%	place = place(2:end-1,:);
%	idx=1;
%	line = fgets(fid);
	idx=1;
	line = fgets(fid);
	while ischar(line)
		token = regexp(line, '(;)', 'split')';
		for jdx=1:length(token)
			num = str2num(token{jdx});
			if (isempty(num))
				str = strtrim(token{jdx});
				if (nargin() > 1 & length(str) > 1 & (str(1) == delim) & (str(end) == delim) )
					str = str(2:end-1);
				end
				C{idx,jdx} = str;
			else
				C{idx,jdx} = num;
			end
		end
%		C{idx,1:length(token)} = token(:);
%		A = regexp(line, '(;)', 'split');
%		place(idx,2) = A(1);
		idx = idx+1;
		line = fgets(fid);
	end
	fclose(fid);
end % function csv2cell

