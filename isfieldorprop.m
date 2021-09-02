function flag = isfielddorprop(so,str)
	if (isempty(so))
		flag = false;
	else
	flag = isfield(so,str);
	if (~flag)
		flag = isprop(so,str);
	end
	end
end
