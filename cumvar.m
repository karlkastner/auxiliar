% Wed 19 Jul 15:20:23 CEST 2017
% Karl Kastner, Berlin

function s2 = cumvar(X)
	if (isvector(X))
		X = cvec(X);
	end

%	M = bsxfun(@times,cumsum(X),1./(1:size(X,1))');
	sum1 = cummean(X);
	sum2 = cummean(X.^2);
	s2   = sum2 - sum1.^2;

%	M = X;
%	for idx=2:length(M);
%		%M(idx) = max(M(idx),M(idx-1));	
%		M 
%	end
end

