% 2015-03-05 15:01:33.349275215 +0100
% Karl Kastner, Berlin
% 
% strip directory and suffix from file name
function str = basename(str,varargin)
	str = regexprep(str,'.*/','');
	str = regexprep(str,'.*\','');
	for idx=1:length(varargin)
		switch (varargin{idx})
		case {'-s'} % remove trailing suffix
			str = regexprep(str,'\.[^.]*$','');
		end
	end
end

