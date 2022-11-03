% 2015-03-11 17:12:55.043851641 +0100
% Karl Kastner, Berlin
%
%% strip file-name from path
%
function str = dirname(str)
	% strip trailing slashes
	str = regexprep(str,'\/*$','');
	% strip last directory or file name
	str = regexprep(str,'/[^\/]*$','');
end

