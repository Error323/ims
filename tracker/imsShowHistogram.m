function imsShowHistogram(H)

	h = (size(H, 1) - 1) * 4;
	w = (size(H, 2) - 1) * 4;
	img = imgNormalizedRgb(w, h);
	
	surface(H, ...
		flipdim(img, 1), ...
		'EdgeColor','black', ...
		'FaceColor', 'texturemap', ...
		'CDataMapping', 'direct');
	
	view(-25,45);
end