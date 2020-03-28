% 2015-05-14 21:33:39.958259821 +0200 /home/pia/phd/src/lib/strings/chomp.m
function str = chomp(str)
	while (length(str) > 0 && ( 10 == str(end) || 13 == str(end) || 32 == str(end)))
		str = str(1:end-1);
	end
end
