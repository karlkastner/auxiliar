function h = patch_man(T,X,Y,V,varargin);
	h = patch(X([T(:,1) T(:,2) T(:,3) T(:,4)]'), ...
		Y([T(:,1) T(:,2) T(:,3) T(:,4)]'), ...
		V([T(:,1) T(:,2) T(:,3) T(:,4)]'), varargin{:});
end

