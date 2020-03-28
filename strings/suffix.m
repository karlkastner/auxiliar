% Tue 24 May 15:14:22 CEST 2016
function [suf base] = suffix(str)
	id = regexp(str,'\.[^.]*$');
	if (~isempty(id))
		suf  = str(id+1:end);
		base = str(1:id-1);
	else
		suf = [];
		base = str;
	end
end
