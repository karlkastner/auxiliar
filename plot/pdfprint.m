% 2013-09-20 18:37:30 +0700
% Karl Kastner, Berlin
% scale is desired scale of testwidth in publication

function pdfprint(varargin)
	% this is pre-scaled for A5
	width  = 2*14.8; % cm
	height = 2*10.5; % cm
%	alw    = 0.75; % AxesLineWidth
%	fsz    = 11;   % Fontsize
%	lw     = 1.5;  % LineWidth
%	msz    = 8;    % MarkerSize

	% parse input arguments
	fh      = [];
	scale   = 1;
	aspect  = 1;
	svgflag = false;
	type    = 'svg'; % default is svg converted to ped
	dpos  = [0,0,0,0];
	fh    = varargin{1};
	name  = varargin{2};
	if (length(varargin())>2 && ~isempty(varargin{3}))
		scale = varargin{3};
	end
	if (length(varargin())>3 && ~isempty(varargin{4}))
		aspect = varargin{4};
	end
	if (length(varargin())>4 && ~isempty(varargin{5}))
		type = varargin{5};
	end
%	if (length(varargin())>6 && ~isempty(varargin{6}))
%		dpos = varargin{6};
%	end
%	error('input arguments are figure handle, filename, scale');

	if (isempty(fh))
		fh = gcf();
	end

	if (1~=scale)
		scalestr= ['-',num2str(scale)];
	else
		scalestr = '';
	end

	% filename flexibility
	if (strcmp(name(end-3),'.'))
		base = name(1:end-4);
	else
		base = name;
	end
	base = [base,scalestr];

	scalex = scale*sqrt(aspect);
	scaley = scale/sqrt(aspect);

	set(fh,'units','centimeters');
	pos = [0, 0, width/scalex, height/scaley];
	set(fh,'Position',pos);
	if (length(varargin) > 5 && ~isempty(varargin{6}))
		rm = varargin{6};
		pos(3:4) = (1+rm)*pos(3:4);
		%pos(3) = (1+rm)*pos(3);
	end
	pos = pos+dpos;
%	set(gca, 'FontSize', fsz);
%	set(gca, 'LineWidth', alw);
	set(fh,'papertype', 'a4'); % Papersize', [30 20]
	if (isfinite(pos))
		set(fh,'PaperPosition',pos); %[0, 0, width/scalex, height/scaley]);
	end
	set(fh,'PaperUnits','centimeters');
	set(fh,'PaperOrientation', 'portrait');
	% PaperPositionMode manual
%	set(fh,'PaperPosition', [0.5,0.5,10,7]);

%textobj = findobj('type', 'text');
%set(textobj, 'fontunits', 'points');
%fontsize = get(textobj, 'fontsize');
%set(textobj, 'fontsize', round(2*fontsize));
%'honk'
%set(findobj('type', 'text'), 'color', 'red');
		%set(gcf, 'PaperType', 'A4');
		%set(gcf, 'PaperType', 'A5');

%	end
	switch (type)
	case {'pdf'}
		epsname = [base,'.eps'];
		pdfname = [base,'.pdf'];
		print(fh,epsname,'-depsc');
		system(['LD_LIBRARY_PATH= epstopdf ', epsname]);
        	system(['LD_LIBRARY_PATH= pdfcrop ', pdfname]);
	case {'svg'}
		pdfname = [base,'.pdf'];
		svgname = [base,'.svg'];
		print(fh,svgname,'-dsvg');

		% TODO, this fails, if no dir is given
		dir   = dirname(pdfname);
		file  = basename(pdfname);

		% fix faulty bounding box
		system(['LD_LIBRARY_PATH= inkscape --verb=FitCanvasToDrawing --verb=FileSave --verb=FileClose --verb=FileQuit ', svgname,' 2>/dev/null']);
		system(['LD_LIBRARY_PATH= inkscape --export-pdf=',pdfname,' ',svgname,' 2>/dev/null']);
		system(['LD_LIBRARY_PATH= mkdir -p ',dir,'/crop']);
        	system(['LD_LIBRARY_PATH= pdfcrop ', pdfname ,' ', dir, '/crop/', file(1:end-4), '-crop.pdf 2>/dev/null']);
	case {'png'}
		pngname = [base,'.png'];
		print(fh,pngname,'-dpng','-r600');
		% trim the image
		command = ['LD_LIBRARY_PATH= convert ', pngname, ' -trim +repage ', base,'-crop.png']
		system(command);
	otherwise
		error('unknown type')
	end
%	delete(name);
%	system(['pdfcrop ', name, '.pdf']);
end

