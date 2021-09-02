function d = diffn(A,k)
	n = size(A,1);
	id = cell(1, ndims(A)-1);
	id(:) = {':'};
%	jd = id;
%	id{1} = 1:n-k+1;
%	jd{1} = k+1:n;
	d = A(k+1:end,id{:}) - A(1:end-k,id{:});
end

