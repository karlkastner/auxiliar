% 2021-02-24 11:17:07.550854833 +0100
classdef Container < handle
	properties
		container
	end
	methods
		function obj = Container()
		end
		function v = get(obj,field)
			if (isfield(obj.container,field))
				v = obj.container.field;
			else
				v = [];
			end
		end
		function set(obj,field,value)
			obj.container.(field) = value;
		end
end

