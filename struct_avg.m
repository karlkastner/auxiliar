% Sun  5 Jan 12:40:05 +08 2020
% function [ta, tas] = struct_avg(t,field_C,p,n,wrap,ta,tas)
function [ta, tas] = struct_avg(t,field_C,p,n,wrap,ta,tas)
	if (nargin() < 5)
		ta  = struct();
	end
	if (nargin()<6)
		tas = struct();
	end
	for idx=1:length(field_C)
		f = field_C{idx};
		%h_p = nanmean(h,2);
		ta.(f) = quantile(t.(f)',p)';
		ta.(f)(:,2) = nanmean(t.(f),2);
		if (0)
		% if only few years are available
		for jdx=1:365
			fdx = isfinite(t.(f)(jdx,:));
			ta.param.(f)(jdx,:) = lognfit(t.(f)(jdx,fdx));
			ta.(f) = logninv(p,ta.param.(f)(1),ta.param.(f)(2));
		end
		end
		%tas.(f) = mysmooth(ta.(f),n,wrap);
		tas.(f) = smooth_with_splines(ta.(f),n,wrap);
	end
end


