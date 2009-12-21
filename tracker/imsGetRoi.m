function [imRoi, y0] = imsGetRoi(imImage)
	
	global CACHE

	if CACHE && exist('cache/imsGetRoi.mat', 'file')
		load('cache/imsGetRoi.mat');
		imsDebug('target', ['Target loaded from file x=', num2str(y0(2)), ', y=', num2str(y0(1)),', width=', num2str(size(imRoi, 2)), ', height=', num2str(size(imRoi, 1))]);
		return
	end
	
	f = figure;

	imshow(imImage);

	[x, y, w, h] = imsSelectRoi();
	
	imRoi = imImage(y:y+h, x:x+w, :);

	close(f);
	
	y0 = [y+h/2; x+w/2];

	if CACHE save('cache/imsGetRoi.mat', 'imRoi', 'y0');

	imsDebug('target', ['Target selected by user x=', num2str(y0(2)), ', y=', num2str(y0(1)),', width=', num2str(size(imRoi, 2)), ', height=', num2str(size(imRoi, 1))]);

end	    