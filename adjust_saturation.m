% Sun 28 Jul 11:53:46 CEST 2024
function img_rgb = adjust_saturation(img_rgb,factor)
	img_hsv = rgb2hsv(img_rgb);
	img_hsv(:,:,2) = factor*img_hsv(:,:,2);
	img_rgb = hsv2rgb(img_hsv);
end
