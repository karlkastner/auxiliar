% 2014-11-21 13:08:15.760165982 +0100
% Karl Kastner, Berlin

function X = cbrt(X)
	if (issym(X))
		X = X.^(1/3);
	else
	fdx = X>0;
	X(fdx) = X(fdx).^(1/3);
	% principal, i.e. non complex root
	fdx = ~fdx;
	X(fdx) = -((-X(fdx)).^(1/3));
	end
end

