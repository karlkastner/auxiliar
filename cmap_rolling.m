 cmap=[0,0,0]; for idx=1:size(c,1); if(mod(idx,2)==1) cmap(end+1,:) = [1 0 0]; else cmap(end+1,:)=[0 0.5 0]; end; end; caxis([0,size(c,1)]); colormap(cmap); colorbar

