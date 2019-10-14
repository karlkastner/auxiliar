% Mon Mar 24 22:49:43 WIB 2014
% Karl Kastner, Berlin

function ind = sub2ind_man(siz,idx,jdx)
	%ind = (idx-1)*siz(2) + jdx;
	idx = int32(idx);
	jdx = int32(jdx);
	siz = int32(siz);
	%ind = (idx-1)*siz(2) + jdx;
	ind = idx + (jdx-1)*siz(1);
end

