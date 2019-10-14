% Wed Nov 26 10:16:31 CET 2014
% Karl Kastner, Berlin
% returns a vector of dates spanning from t0 to t1 containing the first
% day of the month
function [t v] = weekspace(t0,t1)
	t0 = round(t0);
	offset   = weekday(t0);
	t0   = t0-offset+1;
	t    = t0:7:t1;
%	v = datevec(t0);
%	n = ceil((t1-t0)/28);
%	t = datenum(v(1),v(2)+(0:n-1),1);
%	t = (t0:28:t1)';
%	v = datevec(t);
%	% reset days to first of month
%	v(:,3) = 1;
%	% reset time of day
%	v(:,4:6) = 0;
%	% remove duplicates
%	v = unique(v,'rows','stable');
%	t = datenum(v);
end % monthspace

