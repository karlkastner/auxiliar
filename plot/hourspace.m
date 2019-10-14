% Wed Nov 26 10:16:31 CET 2014
% Karl Kastner, Berlin
% returns a vector of dates spanning from t0 to t1 containing the first
% day of the month
function [t v] = monthspace(t0,t1,delta)
	t = (24*t0:24*delta:24*t1)';
	t = round(t)/24;
%	v = datevec(t);
	% reset year,month,day
%	v(:,1:3) = 0;
	% remove duplicates
%	v = unique(v,'rows','stable');
%	t = datenum(v);
end % monthspace

