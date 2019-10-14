function nansurf(X1,X2,val,varargin)
			X1_ = X1(2:end,1:end-1);
			X1  = X1(1:end-1,1:end-1);
			X2_ = X2(1:end-1,2:end);
			X2  = X2(1:end-1,1:end-1);

			flag = isfinite(val);
			flag = flag(:);
			patch(...
			        [X1(flag) X1(flag) X1_(flag) X1_(flag)]', ...
				[X2(flag) X2_(flag) X2_(flag) X2(flag)]', ...
			        val(flag)', varargin{:});

end

