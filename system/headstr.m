% 2015-03-01 12:29:53.919191429 +0100 /home/pia/phd/src/lib/system/head.m
function s = head(n,s)
	C = strsplit(s,'\n');
	s = sprintf('%s\n',C{1:n});
end

