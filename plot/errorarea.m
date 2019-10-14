% 2014-09-04 16:24:06.709071232 +0200
% Karl Kastner, Berlin

function h = errorarea(X,Y,yl,yu,acolor,v1,v2)
	ih = ishold;

	if (nargin() < 4 || isempty(yu))
		sy = yl;
		yl = Y-sy;
		yu = Y+sy;
	else
		help = yl;
		yl = min(yl,yu);
		yu = max(help,yu);

	if (nargin() < 5 || isempty(acolor))
		color = colormap('lines');
		coi = get(gca,'colororderindex');
		acolor = color(coi,:);
	end

	fdx = find(isfinite(X(:).*Y(:).*yl(:).*yu(:)));
	X  = X(fdx);
	Y =  Y(fdx);
	yl = yl(fdx);
	yu = yu(fdx);
%	Y  = real(Y(fdx));
%	sy = real(sy(fdx));

	Xl = [X(1); 0.5*(X(1:end-1)+X(2:end));];
	Xr = [0.5*(X(1:end-1)+X(2:end)); X(end)];

%	yl = Y+sy;
%	yu = Y-sy;
	n = length(X)+1; 
	cdata = double(zeros(1,n-1,3));
	cdata(:,:,1) = acolor(1);
	cdata(:,:,2) = acolor(2);
	cdata(:,:,3) = acolor(3);
%	patch([X(1:end-1) X(2:end) X(2:end) X(1:end-1)]', ...
%	      [yl(1:end-1) yl(2:end) yu(2:end) yu(1:end-1)]', ...
	h = patch([Xl Xr Xr Xl]', ...
	      [yl yl yu yu]', ...
              cdata, 'edgecolor','none', 'facealpha', 0.25,'facecolor','flat');
	set(get(get(h,'Annotation'),'LegendInformation'),'IconDisplayStyle','off');
	if (nargin > 5 && ~isempty(v1))
		set(h,v1{:});
	end
	hold on
%	if (length(varargin) < 1 || ~(strcmp(varargin{1},'linewidth') && 0 == varargin{2}))
%		h = plot(X,Y,'color',acolor,v2{:}); %[lcolor{bdx} '-'],'linewidth',2);
%	end
	if (~ih)
		hold off
	end
end

