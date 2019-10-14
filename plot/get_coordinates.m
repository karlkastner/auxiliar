% Sun Jul 21 14:28:26 UTC 2013
% Karl Kästner, Berlin
% 
% get a coordinate pair from mouse click
%
function [x y] = get_coordinates(fig,zoomflag,n)
	if (nargin()  < 1)
		fig = gcf;
	end
	if (nargin() < 2 || isempty(zoomflag))
		zoomflag = 0; %inp = 0;
	end
	if (nargin() < 3 || isempty(n))
		n = inf;
	end

	x = [];
	y = [];

	% save old axis limits
	ax0 = axis();
	
	% set mouse handler
	s = 0;

	% save state of hold
	ih = ishold;
	hold on

	% the following is valid while zoom is active
	hManager = uigetmodemanager(fig);

	try	% old matlab
	    set(hManager.WindowListenerHandles, 'Enable', 'off');  % HG1
	catch	% new version
	    [hManager.WindowListenerHandles.Enabled] = deal(false);  % HG2
	end
		
	fprintf('Zoom with + and -\n');
	fprintf('Move with cursor\n');
	fprintf('Aquire point with left click\n');
	fprintf('Complete with right click\n');
	fprintf('Abort with Esc\n');

	% deactivate menu bar
	set(fig, 'menubar', 'none');
	% listen to actions
	set(fig,'WindowButtonDownFcn',{@mousefunc});
	set(fig,'WindowButtonMotionFcn', @motionfunc);
	set(fig,'KeyPressFcn', {@keyfunc});

	% sleep until mouse click or key press occurs
	acquired = 0;
	% dummy handle
	lh = plot(NaN,NaN);
	while (0 == acquired)
		pause(0.1);
	end

	% delete points from plot
	delete(lh);

	% restore axis limits
	axis(ax0);

	% restore hold
	if (~ih)
		hold off;
	end

	% restore menu bar
	set(fig, 'menubar', 'figure');

	% unset listeners
	set(fig,'WindowButtonDownFcn','');
	set(fig,'WindowButtonMotionFcn', '');
	set(fig,'KeyPressFcn', '');
	[hManager.WindowListenerHandles.Enabled] = deal(true);

%
% functions
%

	function motionfunc(varargin)
        	p = get(gca, 'CurrentPoint');
		x = p(1,1);
		y = p(1,2);
	end

	% keyboard input handler
	function keyfunc(fig,evt)
		% get current coordinate
        	p = get(gca, 'CurrentPoint');
		x = p(1,1);
		y = p(1,2);

		c = get(fig, 'CurrentCharacter');
		ax = axis();
		x0 = ax(1);
		y0 = ax(3);
		xc = mean(ax(1:2));
		yc = mean(ax(3:4));
		dx = ax(2)-ax(1);
		dy = ax(4)-ax(3);

		switch (c)
			case {'+'} % zoom in
				axis([xc-0.25*dx xc+0.25*dx yc-0.25*dy yc+0.25*dy]);
			case {'-'} % zoom out
				axis([xc-2*dx xc+2*dx yc-2*dy yc+2*dy]);
			case {28} % left
				axis([x0-1/3*dx x0+2/3*dx y0 y0+dy]);
			case {29} % right
				axis([x0+1/3*dx x0+4/3*dx y0 y0+dy]);
			case {30} % 'up'
				axis([x0 x0+dx y0+1/3*dy y0+4/3*dy]);
			case {31} % 'down'
				axis([x0 x0+dx y0-1/3*dy y0+2/3*dy]);
			case {27}
				x = [];
				y = [];
				acquired = 1;
			otherwise % nothing
				printf('Unassigned key: %d\n',c)
		end
	end % keyfunc

	% mouse input handler
	% TODO distinguish drag from click
        function mousefunc(varargin)
		% get current coordinate
        	p = get(gca, 'CurrentPoint');
		switch (lower(get(gcf,'Selectiontype')))
		case {'alt'}
			acquired = true;
		case {'normal'}
			x(end+1) = p(1,1);
			y(end+1) = p(1,2);
			delete(lh);
			lh = plot(x,y,'r.-');
			if (length(x) >= n)
				acquired = true;
			end % k>=n
		end % switch
	end % mousefunc
end % get_coordinates

