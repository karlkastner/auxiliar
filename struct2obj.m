function obj = struct2obj(s,classname)
	% preallocate
	obj(length(s)) = feval(classname);
	% struct to obj
	for idx:length(s)
		obj(idx) = feval(classname,s(idx));
	end 
end % struct2obj

