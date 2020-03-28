function x = chomp(x)
	while (length(x) > 0 && isnan(x(end)))
		x(end) = [];
	end
end

