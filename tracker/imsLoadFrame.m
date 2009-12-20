function imFrame = imsLoadFrame(i)

	global VIDEO_FILES;

	sFrame = VIDEO_FILES{i};
	
	imFrame = imread(sFrame);
	
	imFrame = im2double(imFrame);
	
	imsDebug('aquisition', ['Frame "', sFrame, '" loaded']);

end