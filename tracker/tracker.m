function tracker(sVideo)

	globals;
		
	imsReadVideo(sVideo);
	
	imFirstFrame = imsLoadFrame(1);

	imTarget = imsGetRoi(imFirstFrame);
		
	q = imsMstTargetModel(imTarget);

end
