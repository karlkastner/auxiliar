% Tue  5 Jun 11:53:35 CEST 2018
function str = num2str_log10(x,n,s)
	s = sign(x);
	x = abs(x);
	p = fix(log10(x));
	x = x/10.^p;
	for idx=1:n
		if (x>1)
			break;
		end
		x = 10*x;
		p = p-1;
	end
	if (nargin() < 3)
		str = sprintf(['%0.',num2str(n),'f\\cdot10^{%d}'],s.*x,p);
	else
		str = sprintf(['%-0.',num2str(n),'f\\cdot10^{%d}'],s.*x,p);
	end
end

