function tracker(sVideo)

	%% Globals
	globals;

	%% Statistics
	imsStatsInit();
		
	%% Mean Shift

	% Load the video files
	imsVideoLoad(sVideo);
	
	% Get the first frame to select the target object
	imFrame = imsVideoGetFrame(1);
	y0 = imsGetRoi(imFrame);
	
	% Create a target model (i.e. a histogram)
	q = imsMstCreateModel(imFrame, y0);
	
	for i = 1:VIDEO_FRAMES
		
		imFrame = imsVideoGetFrame(i);

		p0 = imsMstCreateModel(imFrame, y0);
				
		[bD_, bC0] = imsBDistance(p0, q);
		
		while (true)
			W = imsMstWeights(imFrame, y0, q, p0);

			y1 = y0 + imsMstNextLocation(W);

			p1 = imsMstCreateModel(imFrame, y1);

			[bD1, bC1] = imsBDistance(p1, q);
		
			while (bC1 < bC0)
				y1  = 0.5 * (y0 + y1);
				p1  = imsMstCreateModel(imFrame, y1);
				[bD1, bC1] = imsBDistance(p1, q);
			end

			dist = norm(y1 - y0);
			
			p0 = p1;
			y0 = y1;
			bC0 = bC1;

			if (dist < EPSILON)
				break;
			end
		end
	
		% Statistics
		imsStatsAdd(i, imFrame, q, p1, y1, bC1, bD1);
	end

	%% Statistics
	imsStatsClose();
	
end
