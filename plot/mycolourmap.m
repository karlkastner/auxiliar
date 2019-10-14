% 2013-12-28 20:15:00 WIB
% Karl Kastner, Berlin

function colour = mycolourmap(n)
	colour = linspace(0,1,n)';
	%colour = [max(0,2*colour-1) min(2*colour,1-2*colour) max(0,1-2*colour)];
	colour = hsv2rgb(colour,ones(size(colour)),ones(size(colour)));
end

