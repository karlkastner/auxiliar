% Wed 19 Jul 15:20:23 CEST 2017
% Karl Kastner, Berlin

function sd = cumstd(X)
	s2 = cumvar(X);
	sd = sqrt(s2);

%	M = X;
%	for idx=2:length(M);
%		%M(idx) = max(M(idx),M(idx-1));	
%		M 
%	end
end

