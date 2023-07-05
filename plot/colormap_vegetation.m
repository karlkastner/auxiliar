% 2023-06-09 11:23:30.773539478 +0200
function c = colourmap_vegetation(n)
        if (nargin()<1)
		n = 2;
	end
	p = (0:n-1)'/(n-1);
	c = ( p*[255,251,128] ...
	      +(1-p)*[0,68,0])/255;
end

