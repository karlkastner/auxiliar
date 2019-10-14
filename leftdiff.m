% Thu Feb 26 11:23:04 CET 2015
% Karl Kastner, Berlin

% differences of columns of X
% degree  = 1 : central first order differences
% degreee = 2 : central second order differences
% TODO use difference matrix function for simplicity
function d = ldiff(X,degree) %delta)
	if (nargin() < 2)
		degree = 1;
	end
	if (isvector(X) && isrow(X))
		X = X';
		ir = true;
	else
		ir = false;
	end
	%d = zeros(size(X));
	switch (degree)
	case {1}
		% subtract left neighbour
		X(2:end,:) = X(2:end,:) - X(1:end-1,:);
		% linearly interpolation of left difference
		if (size(X,2)>3)
			X(1,:)     = 2*X(2,:) - X(3,:);
		else
			X(1,:) = X(2,:);
		end
		d = X;

		%d = [X(2) - X(1); 0.5*(X(3:end) - X(1:end-2)); X(end)-X(end-1)];
		%d(2:end-1,:) = 0.5*(X(3:end,:)-X(1:end-2,:));
		%if (size(X,1) > 1)
		%	d(1,:)       = X(2,:)   - X(1,:);
		%	d(end,:)     = X(end,:) - X(end-1,:);
		%end
	case {2}
		d(2:end-1,:) = (X(1:end-2,:)-2*X(2:end-1,:)+X(3:end,:));
		d(1,:)       = d(2,:);
		d(end,:)     = d(end-1,:);
	otherwise
		error('not yet implemented');
	end % switch
	if (ir)
		X = X';
	end % of else if isvector
end % cdiff

