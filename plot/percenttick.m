% 2015-06-25 19:04:15.919333627 +0200
% Karl Kastner, Berlin

function h = percenttick(ax)
	switch(ax)
	case {'x'}
		tick = get(gca,'xtick');
		% reset tick to avoid roll-over when axis is resized
		% TODO this should be a call back
		set(gca,'xtick',tick);
		frac = max(abs(mod(tick'*100,1)));
		if (frac > 1e-7)
			formatstr = '%2.1f';
		else
			formatstr = '%2.0f';
		end
		set(gca,'xticklabel',num2str((tick'*100),formatstr));
	case {'y'}
		tick = get(gca,'ytick');
		set(gca,'ytick',tick);
		frac = max(abs(mod(tick'*100,1)));
		if (frac > 1e-7)
			formatstr = '%2.1f';
		else
			formatstr = '%2.0f';
		end
		set(gca,'yticklabel',num2str((tick'*100),formatstr));
	case {'c'}
		h    = colorbar();
		tick = get(h,'ytick');
		set(h,'ytick',tick);
		frac = max(abs(mod(tick'*100,1)));
		if (frac > 1e-7)
			formatstr = '%2.1f';
		else
			formatstr = '%2.0f';
		end
		set(h,'yticklabel',num2str((tick'*100),formatstr));
	end % switch		
end % percenttick

