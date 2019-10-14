% Wed  8 Feb 09:52:04 CET 2017
%
% function fh = splitfigure(siz,id,flag,name)
%
function fh = splitfigure(siz,id,flag,name)
	if (nargin() < 4)
		name = '';
	end
	if (flag)
		fh = namedfigure(10*id(1)+id(2),name);
		subplot(1,1,1);
	else
		fh = namedfigure(10*id(1),name);
		subplot(siz(1),siz(2),id(2));
	end
end % splifigure

