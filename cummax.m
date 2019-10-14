% Di 31. Mär 10:39:56 CEST 2015
% Karl Kastner, Berlin

function M = cummax(X)
	M = X;
	for idx=2:length(M);
		M(idx) = max(M(idx),M(idx-1));	
	end
end

