function plot_style(x,y,varargin)
	ih = ishold();
	for idx=1:size(y,2)
		plot(x,y(:,idx),varargin{:});
		set(gca,'LineStyleOrder',{'-','--','-.'});
		hold on
		set(gca,'linestyleorderindex',get(gca,'linestyleorderindex')+1)
		% colororderindex changes autopmatically
		%set(gca,'colororderindex',get(gca,'colororderindex')+1)
	end
end
