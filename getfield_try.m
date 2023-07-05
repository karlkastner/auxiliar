% Tue  4 Jul 21:31:16 CEST 2023
function y = getfield_try(x,field,alt)
	try
		y = getfield_deep(x,field);
	catch e
		y = alt;
	end
end
