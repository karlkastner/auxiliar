% Fri 16 Jun 19:01:46 CEST 2017
classdef Expanding_Double < double
	methods 
		function obj = Expanding_Double(dat)
			obj = obj@double(dat);
		end
		% the .* operator
		function c = times(obj,b)
			c = Expanding_Double(bsxfun(@times,obj,b));
		end
		function c = mtimes(obj,b)
			c = Expanding_Double(bsxfun(@mtimes,obj,b));
		end
		function c = rdivide(obj,b)
			c = Expanding_Double(bsxfun(@rdivide,obj,b));
		end
		function c = plus(obj,b)
			c = Expanding_Double(bsxfun(@plus,obj,b));
		end
		function c = minus(obj,b)
			c = Expanding_Double(bsxfun(@minus,obj,b));
		end
		function c = power(obj,b)
			c = Expanding_Double(bsxfun(@power,obj,b));
		end
		function c = log(obj)
			c = Expanding_Double(log(double(obj)));
		end
		function c = sin(obj)
			c = Expanding_Double(sin(double(obj)));
		end
	end
end

