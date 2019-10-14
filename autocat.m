function out = autocat(varargin)
	% TODO, this may fail if the first element is scalar
	if (0 == length(varargin))
		out = [];
	else
	if (isrow(varargin{1}))
		out = horzcat(varargin{:});
	else
		out = vertcat(varargin{:});
	end
	end	
end

