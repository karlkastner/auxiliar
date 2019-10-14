% 2015-12-19 21:02:46.018038879 +0100
%function quiver_man(P,g)
function quiver_man(X,Y,V,W,scale,aspect)
	if (nargin > 2)
		P = [flat(X),flat(Y)];
		V = [flat(V),flat(W)];
	else
		P = X;
		V = Y;
	end
	fdx = all(isfinite(P),2) & all(isfinite(V),2);

	n = sum(fdx);
	%n=size(P,1);
	V = bsxfun(@times,V,rvec(scale));
	if (0)
		plot(P(fdx,1),P(fdx,2),'.r','markersize',1);
		hold on
		%+V(:,1),NaN(n,1)]',[P(:,2),P(:,2)+V(:,2),NaN(n,1)]','k.-')
		plot([P(fdx,1),P(fdx,1)+V(fdx,1),NaN(n,1)]',[P(fdx,2),P(fdx,2)+V(fdx,2),NaN(n,1)]','k-')
		%plot([P(:,1),P(:,1)+V(:,1)],[P(:,2),P(:,2)+V(:,2)],'.-')
	else
		% a = aspect(1:2)/sqrt(aspect(1)*aspect(2));

		ab = get(gca,'PlotBoxAspectRatio');
		ab = [1 1 1];
		ad = get(gca,'DataAspectRatio');
		a = ab./ad;
		% r := sqrt(xrange/yrange) = xrange/sqrt(xrange*yrange)
		r = 1./sqrt(a(1)/a(2));

%		xr = range(xlim());
%		yr = range(ylim());
%		r1 = xr/sqrt(xr*yr) % sqrt(xr/yr)
%		r2 = yr/sqrt(xr*yr) % sqrt(yr/xr)
%pause

%	V(isnan(V))=0;
%	colnorm(V)

%		r=sqrt(range(xlim)/range(ylim));
		headsize = 1;
		O = headsize*[V(:,2),-V(:,1)];
%nanmedian(V/scale)
		V(:,1)=V(:,1)*r;
		V(:,2)=V(:,2)/r;
%nanmedian(V)
%'honk'
%pause

		O(:,1)=O(:,1)*r;
		O(:,2)=O(:,2)/r;

%		plot([P(fdx,1),P(fdx,1)+V(fdx,1),NaN(n,1)]',[P(fdx,2),P(fdx,2)+V(fdx,2),NaN(n,1)]','k-')

		% orthogonal vector
%		O = 0.2*[a(1)*V(:,2),-a(2)*V(:,1)];
%		O = 0.2*[V(:,2),-V(:,1)];
		if (1)
		plot([P(fdx,1)-O(fdx,1)/2 ,P(fdx,1)+V(fdx,1), P(fdx,1)+O(fdx,1)/2,NaN(n,1)]', ...
		     [P(fdx,2)-O(fdx,2)/2 ,P(fdx,2)+V(fdx,2), P(fdx,2)+O(fdx,2)/2,NaN(n,1)]', ...
			'k-');
		else
		plot([P(fdx,1), P(fdx,1)+V(fdx,1),NaN(n,1)]', ...
		     [P(fdx,2), P(fdx,2)+V(fdx,2),NaN(n,1)]', ...
			'k-');
		end
	end
end
