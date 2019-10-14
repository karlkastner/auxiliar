lim = xlim;
set(gca,'Xtick',lim);
set(gca,'Xtick',lim(1):lim(2));
set(gca,'xticklabel',datestr(lim(1):lim(2),'dd'))

