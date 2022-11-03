% 2014-12-16 11:59:33.782143893 +0100
% Karl Kastner, Berlin
%
%% make vector a column vector
%
function X = cvec(X)
	s = size(X);
	if (s(1)<=1 && s(2)<=1)
		% scalar or empty, nothing to do
	elseif (s(1)>1 && s(2) > 1)
		error('input must be a vector');
	elseif (s(2) > 1)
		% translate
		X = X.';
	else
		% nothing to do
	end	
%	if (isvector(X))
%		X = X(:);
%	end
end % cvec

