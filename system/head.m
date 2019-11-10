% 2017-05-18 17:39:24.123138644 +0200
function h = head(x,n)
	if (nargin()<2)
		n = 5;
	end
	if (isvector(x))
		n = min(n,length(x));
		h = x(1:n);
	else
		n = min(n,size(x,1));
		h = x(1:n,:);
	end
end
