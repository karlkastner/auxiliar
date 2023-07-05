% Sat  4 Aug 13:04:07 CEST 2018
function col = colormap_byr()
	blue   = [0,0,1];
	red    = [1,0,0];
	yellow = [1,1,0];
	white  = [1,1,1];
	key    = [0,0,0];
	green  = [0,1,0];
	orange = [1,0.5,0];
	% rgb
	if (0)
%	b->y * k->w
%	y->r * w->k
	n = 10;
	kflag = true;

	x = linspace(0,1,n)';
	q = 1;
	yellow1 = q*blue + (1-q)*yellow;
	%yellow = [1,1,0];
	%yellow = [1,1,0.5];
	%yellow2 = red;
	yellow2 = q*red+(1-q)*yellow;

	% minimum brightness
	%bmin = 0.9;
	%bmax = 0.1;
	if (kflag)
		bmin = 1;
		bmax = 0;
		%bmin = 1;
		%bmax = 0.05;
		p    = linspace(bmin,bmax,n)'*[1 1 1];
	else
		bmin = 1;
		bmax = 0.05;
		p    = linspace(bmin,bmax,n)'*[1 1 1];
	end

	% the color
	% TODO remove second row of second line
%	col1 = [((1-x)*blue   + x*yellow1)];
%	col2 = [((1-x)*yellow2 + x*red)];
	col1 = [((1-x)*blue   + x*yellow1).*p];
	col2 = [((1-x)*yellow2 + x*red).*flipud(p)];
	col2 = col2(2:end,:);
	col = [col1;col2];
%	col1  = rgb2hsv(col1);
	else
	mode = 2;
	switch (mode)
	case {1}
	if (1)
	% key for high value
	n = 5;
	%x = linspace(0,1,n)';
	lower = 0.5;
	x = linspace(lower,1-lower,n)';
	y = linspace(1-lower,lower,n)';
	% key -> blue
	col1 = [y*key  + x*blue];
	col1 = col1(2:end,:);
	col2 = [y*blue + x*white];
	col2 = col2(2:end,:);
	
	col3 = [y*white + x*red];
	col3 = col3(2:end,:);
	col4 = [y*red + x*key];
	col4 = col4(2:end-1,:);
	col= [col1;col2;col3;col4];
	else
	n = 5;
	lower = 0.25;
	x = linspace(lower,1,n)';
	y = linspace(1,lower,n)';
	% key -> blue
	col1 = [y*white  + x*blue];
	col1 = col1(2:end,:);
	col2 = [y*blue + x*key];
	col2 = col2(2:end,:);
	col3 = [y*key + x*red];
	col3 = col3(2:end,:);
	col4 = [y*red + x*white];
	col4 = col4(2:end-1,:);
	col= [col1;col2;col3;col4];
	end
	case {2}
		help = key;
		key = white;
		white = help;
		n = 5;
		lower = 0;
		x = linspace(lower,1,n)';
		y = linspace(1,lower,n)';
		o = ones(n,1);
		p = innerspace(1,0,2*n)'*key;
		p = min(2*p,1);
%		col0 = [y*key  + x*blue];
%		col0 = col0(2:end,:);
		col1 = [y*blue  + x*(yellow+blue)/2];
%		col1 = col1(2:end,:);
		col2 = [y*(yellow+blue)/2 + x*green];
		%[y*yellow + x*white];
%		col2 = col2(2:end,:);
		col3 = o*orange;
		%[y*white + x*orange];
%		col3 = col3(2:end,:);
		col4 = [y*orange + x*red];
%		col4 = col4(2:end-1,:);
%		col5 = [y*red + x*key];
%		col5 = col5(2:end-1,:);
		col= [[col1;col2].*p;
                      [col3;col4].*(1-p)];
		col = min(col,1);
	end
	end
	
	
%	col1(:,2) = col1(:,2).*(1-x);
%	col1(:,2) = col1(:,2).*(1-x);

	if (nargout() < 1)
		colormap(col);
	end
end
	
	
	
	

