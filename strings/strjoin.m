% Sat Jan 10 15:29:05 CET 2015
% Karl Kastner, Berlin

function s = strjoin(str_A,jstr)
	s = str_A{1};
	for idx=2:length(str_A)
		s = [s jstr str_A{idx}];
	end
end

