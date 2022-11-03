% Wed  8 Feb 09:52:04 CET 2017
% Karl Kästner, Berlin
%
%% combined figure and subplot
%
% function fh = splitfigure(siz,id,flag,name)
%
function fh = splitfigure(siz,id,flag,name,factor)
	if (nargin() < 4 || isempty(name))
		name = '';
	end
	if (nargin() < 5)
		factor = 10;
	end
	if (flag)
		fh = namedfigure(factor*id(1)+id(2),name);
		subplot(1,1,1);
	else
		fh = namedfigure(factor*id(1),name);
		subplot(siz(1),siz(2),id(2));
	end
end % splifigure

