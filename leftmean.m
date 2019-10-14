% Thu 16 Nov 18:53:08 CET 2017
function x = leftmean(x)
	if (isvector(x))
		x = cvec(x);
	end
	x(2:end,:) = 0.5*(x(1:end-1)+x(2:end,:));
	% linearly extrapolate left mean
	x(1,:) = 2*x(2,:) - x(3,:);
end % leftmean

