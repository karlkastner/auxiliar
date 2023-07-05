% Wed 11 Jul 10:25:58 CEST 2018
function c=colormap3(id,flip)
	n = 85;
	x = (n-1:-1:0)'/(n);
	o=ones(size(x)); z=zeros(size(x));
	% hot w->red->black
if (1)
	c0 = ones(1,3); 
	c1 = ones(n,3); c1(:,id(1)) = x;
	c2 = ones(n,3); c2(:,id(1)) = 0; c2(:,id(2)) = x; 
	c3 = ones(n,2); c3(:,id(1)) = 0; c3(:,id(2)) = 0; c3(:,id(3)) = x;
	c = [c0;c1;c2;c3];
else
	y = flipud(x);
	c1 = [z x y];
	c2 = [y,z,x];
	c3 = [x,y,z];
	c = [c1;c2;c3];
end

	% winter w->blue->black
	% c = [ones(1,3); x,o,o; z,x,o; z,z,x];
	if (nargin() > 1 && flip)
		c = flipud(c);
	end
	if (nargout()<1)
		colormap(c)
	end
