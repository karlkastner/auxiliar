% 2017-08-19 16:23:52.389112213 +0200

function varargout = getout(id,fun,varargin)
	[outargs{1:max(id)}] = feval(fun,varargin{:});
	varargout{:} = outargs{id};
end

