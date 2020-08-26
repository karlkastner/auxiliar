function A1 = fixnan3(A)
% fill by previous
A1 = A;
for idx=2:size(A,3)
	Ao  = A1(:,:,idx-1);
	Ai  = A1(:,:,idx);
	fdx = isnan(Ai);
	Ai(fdx) = Ao(fdx);
	A1(:,:,idx) = Ai;
end
% fill with next
A2 = A;
for idx=1:size(A,3)-1
	Ao  = A2(:,:,end-idx+1);
	Ai  = A2(:,:,end-idx);
	fdx = isnan(Ai);
	Ai(fdx) = Ao(fdx);
	A2(:,:,end-idx) = Ai;
end
fdx = isnan(A1);
A1(fdx) = A2(fdx);
fdx=isnan(A2);
A2(fdx) = A1(fdx);
A1 = 0.5*(A1+A2);
end

