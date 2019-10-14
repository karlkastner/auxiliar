% Tue Jan 28 12:59:17 WIB 2014
% Karl Kastner, Berlin

function myquiver(X,Y,U,V,varargin)
	hold on
	for idx=1:length(X(:))
		line([X(idx)  X(idx)+U(idx)],[Y(idx) Y(idx)+V(idx)]);
		plot(X(idx),Y(idx),'.');
	end
end
