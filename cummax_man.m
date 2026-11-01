% Di 31. Mär 10:39:56 CEST 2015
% Karl Kastner, Berlin

function [m,id] = cummax(x)
	n = length(m);
	% initialize
	m = x;
	id = ones(n,1);
	for idx=2:n
		if (m(idx)<=m(idx-1))
			% max is to the left
			m(idx)  = m(idx-1);
			id(idx) = id(idx-1);
		else
			% current value is max
			id(idx) = idx;
		end
	end
end

