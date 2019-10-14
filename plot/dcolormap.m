% Di 15. Mär 09:29:28 CET 2016
%
% cmapi = dcolormap(ni,lim,cmap)
%
function cmapi = dcolormap(ni,lim,cmap)
	if (nargin() < 2 || isempty(lim))
		lim   = caxis();
	else
		caxis(lim);
	end
	if (nargin() < 3 || isempty(cmap))
		cmap = colormap();
	end
	if (nargin() < 1 || isempty(ni))
		ni = size(cmap,1);
	end
	n      = size(cmap,1);

%	level  = lim(1) + (lim(2)-lim(1))*(0:n-1)/n;
%	leveli = lim(1) + (lim(2)-lim(1))*(0:ni-1)/ni;
%	cmapi = interp1(level,cmap,leveli,'nearest');
	cmapi     = interp1(1:n,cmap,linspace(1,n,ni),'nearest');
	colormap(cmapi);
%	dcolorbar([-10 6],n,colormap_man('BGR',[0.1 0.9]));
%	caxis([-10 6]);
%	c=colormap;
%	colormap(c);
end
