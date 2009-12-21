function tracker(sVideo)

	globals;
		
	imsReadVideo(sVideo);
	
	imFirstFrame = imsLoadFrame(1);

	[imTarget, y0] = imsGetRoi(imFirstFrame);
	
	min( size(imTarget, 1), size(imTarget, 2)); 
		
	q = imsMstCreateModel(imTarget);

	imsShowHistogram(q);
	
end
