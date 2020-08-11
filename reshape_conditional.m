% Tue 21 Apr 10:52:09 +08 2020
% for use with structfun
function x = reshape_conditional(x,n)
	if (numel(x)==prod(n))
		x = reshape(x,n);
	end
end % reshape_


