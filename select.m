% 2017-07-14 14:37:14.236154741 +0200
%
%% select columns of a vector along dimension dim
%
function x = select(x,fdx,dim)
	if (nargin()<3 || 1 == dim)
		% rows
		x = x(fdx,:);
	else
		% columns
		x = x(:,fdx);
	end
end
