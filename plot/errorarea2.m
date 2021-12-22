% 2020-01-05 11:34:46.930214876 +0100
function errorarea(x,y,color,varargin)
	a = area(x,[y(:,1),y(:,3)-y(:,1)]);
	a(1).FaceColor='none';
	a(2).FaceColor  = color; %[1,1,1]l
	a(2).FaceAlpha = 0.2;
	a(2).EdgeColor='none';
	a(1).EdgeColor='none';
	a(1).HandleVisibility='off';
	a(2).HandleVisibility='off';
	for idx=1:2:length(varargin)
		a(2).(varargin{idx}) = (varargin{idx+1});
	end
end
