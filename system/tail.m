% 2015-03-01 13:00:25.762875871 +0100
function s = tail(n,s)
	C = strsplit(s,'\n');
	if (n < 0)
		s = sprintf('%s\n',C{-n:end});
	else
		s = sprintf('%s\n',C{end-n+1:end});
	end
end

