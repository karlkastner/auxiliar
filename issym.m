% 2016-03-12 16:09:36.316671795 +0100
% Karl Kastner, Berlin
%
%% return true of variable is symbolic
%
function flag = issym(x)
	flag = strcmp(class(x),'sym');
end

