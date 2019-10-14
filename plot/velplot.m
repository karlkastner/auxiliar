function velplot(vel)
	for idx=1:4;
		subplot(2,2,idx);
		imagesc(vel(:,:,idx));
		caxis([-1 1]);
		title(idx);
	end
end
