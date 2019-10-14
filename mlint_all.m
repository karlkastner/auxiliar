% 2015-01-12 16:51:06.219668762 +0100 /home/pia/phd/src/lib/matlab/mlint_all.m
more on;
ls_ = ls('.');
%ls('.','-1')
%a=(strsplit(ls_,'\s\s*'));
a = strsplit(ls_);
for idx=1:length(a);
	disp(a{idx})
	mlint(a{idx});
end

