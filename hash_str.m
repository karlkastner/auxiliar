% Tue  9 Feb 12:36:14 CET 2021
function [h,a] = hash_str(s,h,a)
	if (nargin()<2)
		h = 0;
		a = 1;
	end
	for idx=1:length(s)
%		id = mod(id,23);
		h  = h + a*s(idx);
		h  = mod(h, 2^31);
%		printf('%12d %20f\n',a,h)
		%id = id+1;
		a  = 31*a;
		a  = mod(a,2^31);
	end
end

