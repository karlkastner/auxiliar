function setfontsize(fs)
	set(get(gca,'XLabel'),'Fontsize',fs);
	set(get(gca,'YLabel'),'Fontsize',fs);
%	set(get(gca,'YLabel'),'Fontsize',fs);
	set(gca,'FontSize',fs);
end

