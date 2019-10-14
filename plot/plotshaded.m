% Wed 15 Nov 12:33:15 CET 2017
% change coloralong line
function f = plotshaded(x,y,c1,c2); 
	x = cvec(x);
	y = cvec(y);
	z = zeros(length(x),1);
	col = interp1([x(1),x(end)],[rvec(c1);rvec(c2)],x)
	
	x(end+1) = NaN;
	y(end+1) = NaN;
	z(end+1) = NaN;
	col(end+1,:) = [1 1 1];
	col=col;
	patch([x],[y],z,'FaceVertexCData',col,'edgecol','interp');
%	h = surface([x,x],[y,y],[z,z],'color',[col],...
 %       'facecol','no',...
  %      'edgecol','interp');
%        'linew',2);
end

