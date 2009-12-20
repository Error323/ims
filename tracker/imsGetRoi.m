function imRoi = imsGetRoi(imImage)

	f = figure;

	imshow(imImage);

	[x, y, w, h] = imsSelectRoi();
	
	imRoi = imImage(y:y+h, x:x+w, :);

	close(f);

end	    