% 2017-08-03 20:03:42.209509492 +0200
function x = circshift_fractional(x,nf)
	x = cvec(x);
	n = floor(nf);
	p = 1-(nf-n)
	
	x = p*circshift(x,[n 0]) + (1-p)*circshift(x,[n+1 0]);
end
