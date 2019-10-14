% Fri  1 Jun 10:50:04 CEST 2018
% TODO this should be separated into mkquad
function h = quadsurf(X,Y,val,varargin)
	n = size(X);
if (1)
	tri = grid2tri(n);
	val = [val(:),val(:)];
	h = trisurf(tri,flat(X),flat(Y),[],val,varargin{:});
else
	% as of 2018, matlab uses mesh for trisurf, so better use patch immediately
	elem = grid2quad(n);
	h = patch(elem,X(:),Y(:),val(:),varargin{:});
	
end
end

