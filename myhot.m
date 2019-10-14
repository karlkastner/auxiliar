function c = myhot(flip)
	n = 85;
	x = (n-1:-1:0)'/(n);
	o=ones(size(x)); z=zeros(size(x));
	% hot w->red->black
	c = [ones(1,3); o,o,x; o,x,z; x,z,z];
	% winter w->blue->black
	% c = [ones(1,3); x,o,o; z,x,o; z,z,x];
	if (nargin() > 0 && flip)
		c = flipud(c);
	end
	if (nargout()<1)
		colormap(c)
	end
