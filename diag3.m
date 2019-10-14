% Mon 28 May 13:26:49 CEST 2018
function d = diag3(A)
	n = size(A);
	A = reshape(A,n(1)*n(2),[]);
	n = n(1);
	id = (0:n-1)*n + (1:n);
	d = A(id,:);
end

