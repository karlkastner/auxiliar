% 2015-05-16 11:28:38.771371437 +0200
% Karl Kastner, Berlin
function map = nmlcolormap(n,m,l)
	map = ones(n*m*l,3);
	for idx=1:n
	 for jdx=1:m
          for kdx=1:l
		map(idx + (jdx-1)*n + (kdx-1)*n*m,1) = idx-1;
		map(idx + (jdx-1)*n + (kdx-1)*n*m,2) = jdx-1;
		map(idx + (jdx-1)*n + (kdx-1)*n*m,3) = kdx-1; 
         end % kdx
        end % jdx
	end % idx

	map(:,1) = map(:,1)/(n);
	map(:,2) = map(:,2)/(m);
	map(:,3) = map(:,3)/(l);
end

