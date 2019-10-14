% Tue 22 May 15:28:32 CEST 2018
function S = logspace_trimmed(L,d0,dinf,p)
%	d0 = 64; dinf = 2*1024; p=1.05;
	k  = floor(log(dinf/d0)/log(1+p));
	d  = d0*(1+p).^(0:k);
	S  = [0,cumsum(d)];
	S(S>L) = [];

	n  = round((L-S(end))/dinf);
	S = [S,S(end)+dinf*(1:n)];
	S = L*S/S(end);
end

