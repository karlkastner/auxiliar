% 2024-07-28 13:35:22.507948106 +0200
function obj = struct2obj(s,classname)
	% preallocate
	obj(length(s)) = feval(classname);
	% struct to obj
	for idx:length(s)
		obj(idx) = feval(classname,s(idx));
	end 
end % struct2obj

