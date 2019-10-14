% Wed 15 Aug 14:43:58 CEST 2018
function str = sign2str(val)
	str = char('+'*(val>0)+'-'*(val<0) + '0'*(val==0));
end

