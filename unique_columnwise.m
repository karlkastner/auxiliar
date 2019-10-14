% Thu 22 Jun 13:22:55 CEST 2017
function x = unique_columnwise(x)
	x  = sort(x,1);
	id = [false(1,size(x,2));...
	      (x(2:end,:) == x(1:end-1,:))];
	x(id) = NaN;
	%x(1:end-1,:) = x(1:end-1).*id;
	x = sort(x,1);
	
end
