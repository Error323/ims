function tracker(sVideo)

	% Load the globals
	globals;

	% Load the video files
	imsReadVideo(sVideo);
	
	% Get the first frame to select the target object
	imFirstFrame = imsLoadFrame(1);
	[imTarget, y0] = imsGetRoi(imFirstFrame);

	% Create a target model (i.e. a histogram)
	q = imsMstCreateModel(imTarget);

	% Show the target model
	imsShowHistogram(q);
	
end
