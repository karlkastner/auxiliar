%Sun Jun 29 10:44:58 WIB 2014
function imagesc_(x,y,z)
	if (length(x) ~= size(z,1) || length(y) ~= size(z,2))
		error('dimensions do not match');
	end
	imagesc(x,y,z);
end
