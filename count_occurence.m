% Mon 28 Nov 15:28:59 CET 2016
function [u, n] = count_occurcence(x)
	[u, ia, ib] = unique(x);
	n=accumarray(ib,ones(size(ib)));
end

