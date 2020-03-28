function str = num2str_power_10(n)
	str={};
	p=floor(log10(abs(n)));
	n=n.*10.^-p;
p
	for idx=1:length(n)
		str{idx} = sprintf('% 4.1f·10^{%d}',[rvec(n(idx));rvec(p(idx))]);
	end
end
