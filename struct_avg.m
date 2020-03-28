% Sun  5 Jan 12:40:05 +08 2020
% function [ta, tas] = struct_avg(t,field_C,p,n,wrap,ta,tas)
function [ta, tas] = struct_avg(t,field_C,p,n,wrap,ta,tas)
	if (nargin() < 6)
		ta  = struct();
	end
	if (nargin()<7)
		tas = struct();
	end
	for idx=1:length(field_C)
		f   = field_C{idx};
		val = getfield_deep(t,f); 
		%h_p = nanmean(h,2);
		%ta.(f) = quantile(t.(f)',p)';
		val_a = quantile(val,p,2);
		val_a(:,2) = nanmean(val,2);
		ta = setfield_deep(ta,f,val_a);

		if (0)
		% if only few years are available
		for jdx=1:365
			fdx = isfinite(val(jdx,:));
			%ta=setfield_deep(ta.param,
			ta.param.(f)(jdx,:) = lognfit(t.(f)(jdx,fdx));
			ta.(f) = logninv(p,ta.param.(f)(1),ta.param.(f)(2));
		end
		
		end
		%tas.(f) = mysmooth(ta.(f),n,wrap);
		%tas.(f) = smooth_with_splines(ta.(f),n,wrap);
		tas = setfield_deep(tas,f,smooth_with_splines(getfield_deep(ta,f),n,wrap));
	end
end


