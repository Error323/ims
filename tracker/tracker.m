function tracker(sVideo)

	global VIDEO_FRAMES;
	
	% Load the globals
	globals;

	% Load the video files
	imsReadVideo(sVideo);
	
	% Get the first frame to select the target object
	imFrame = imsLoadFrame(1);
	y0 = imsGetRoi(imFrame)

	% Create a target model (i.e. a histogram)
	q = imsMstCreateModel(imFrame, y0);
	
	p0 = q;
	
	[bD_, bC0] = imsBDistance(p0,q)

	for i = 2:VIDEO_FRAMES
	
		imFrame = imsLoadFrame(i);

		W = imsMstWeights(imFrame, y0, q, p0);

		y1 = y0 + imsMstNextLocation(W);
		
		imshow(imFrame);
		hold on;
		plot(y1(2), y1(1), 'o');
		drawnow;
		hold off;

		p1 = imsMstCreateModel(imFrame, y1);

		[bD_, bC1] = imsBDistance(p1,q);
		
		%while (bC1 < bC0)
		%	y1  = 0.5 * (y0 + y1);
		%	p1  = imsMstCreateModel(imFrame, y1);
		%	bC1 = imsBDistance(p1,q);
		%end
		
		y0  = y1;
		p0  = p1;
		bC0 = bC1;
	end

	% Show the target model
%	imsShowHistogram(q);
	
end
