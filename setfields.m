% Tue 15 Aug 09:11:27 CEST 2017
function s = setfields(s,varargin)
	for idx=1:2:length(varargin)
		field = varargin{idx};
		val   = varargin{idx+1};
		%s.(field) = val;
		s = setfield_deep(s,field,val);
	end
end

