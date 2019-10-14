% Do 4. Jun 08:24:40 CEST 2015
% Karl Kastner, Berlin

function M = cummean(X)
	if (isvector(X))
		X = cvec(X);
	end
	M = bsxfun(@times,cumsum(X),1./(1:size(X,1))');
%	M = X;
%	for idx=2:length(M);
%		%M(idx) = max(M(idx),M(idx-1));	
%		M 
%	end
end

