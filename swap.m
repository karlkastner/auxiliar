% Tue 29 Nov 18:27:43 CET 2016
%
% warning : matlab performs copy on write, and for large arrays,
% inlining the swap is much faster
%

function [a] = swap(a,id1,id2)
		help   = a(id1);
		c = a(id2);
		a(id1) = c; %a(id2);
		a(id2) = help;
end

%function [a b] = swap(a,b,fdx)
%		help = a(fdx);
%		a(fdx) = b(fdx);
%		b(fdx) = help;
%end

