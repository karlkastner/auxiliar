% Fri  9 Sep 15:53:13 CEST 2016
function [im, alpha] = arrow(x0,y0,scale,angle,color)
	filename = [ROOTFOLDER,'/phd/img/arrow.png'];
	angle = angle+180;
	im    = imrotate(imcomplement(imread(filename)),angle);
	im    = double(im)/255;
%	min(im(:))
%	max(im(:))
	alpha    = abs(im-1)<1e-3;
	im(alpha)=color;
	x = x0+scale*((1:size(im,2))-0.5*size(im,2));
	y = y0+scale*((1:size(im,1))-0.5*size(im,1));

	h = imagesc(im,'xdata',[x(1) x(end)],'ydata',[y(1) y(end)]);
	set(h,'AlphaData',double(alpha))
end

