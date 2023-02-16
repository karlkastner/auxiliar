% Wed  8 Feb 09:52:04 CET 2017
% Karl Kästner, Berlin
%
%% combined figure and subplot
%
% function fh = splitfigure(siz,id,flag,name)
%
function [fh,ax,t] = splitfigure(siz,id,flag,name,factor,usetiledlayout,t,varargin)
	if (nargin() < 4 || isempty(name))
		name = '';
	end
	if (nargin() < 5 || isempty(factor))
		factor = 10;
	end
	if (nargin()<6)
		usetiledlayout = false;
	end
	if (flag)
		fh = namedfigure(factor*id(1)+id(2),name,varargin{:});
		if (~usetiledlayout)
			ax = subplot(1,1,1);
		else
			t  = tiledlayout(1,1);
			ax = axes(t);
			%nexttile(id(2));
		end
	else
		fh = namedfigure(factor*id(1),name,varargin{:});
		if (~usetiledlayout)
			ax = subplot(siz(1),siz(2),id(2));
		else
			if (1 == id(2))
				t = tiledlayout(siz(1),siz(2));
			end
			nexttile(id(2));
			%ax = axes(t);
			ax = gca;
		end
	end
end % splifigure

