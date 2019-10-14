% Fri  1 Jun 10:50:04 CEST 2018
function h = quadsurf(elem,X,Y,val,varargin)
	if (size(elem,1) == length(val))
		patch(	X(elem)', Y(elem)', cvec(val), varargin{:});
	else
		patch(	X(elem)', Y(elem)', val(elem'), val(elem)', varargin{:});
	end
end

