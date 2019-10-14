% 2016-09-25 22:42:10.897462336 +0200
%
%% index of maximum
%% if value is not required (e.g. use in other functions such as accummarray)
function mid = maxid(x,id)
	[void mid_local] = max(x(id));
	mid = id(mid_local);
end

