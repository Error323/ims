function tracker(sVideo)

	global VIDEO_FRAMES EPSILON TARGET_SIZE;
	
	% Load the globals
	globals;

	% Load the video files
	imsReadVideo(sVideo);
	
	% Get the first frame to select the target object
	imFrame = imsLoadFrame(1);
	y0 = imsGetRoi(imFrame);
	
	% Create a target model (i.e. a histogram)
	q = imsMstCreateModel(imFrame, y0);
	
	for i = 1:VIDEO_FRAMES
		
		imFrame = imsLoadFrame(i);

		p0 = imsMstCreateModel(imFrame, y0);
				
		[bD_, bC0] = imsBDistance(p0, q);
		
		while (true)
			W = imsMstWeights(imFrame, y0, q, p0);

			y1 = y0 + imsMstNextLocation(W);

			p1 = imsMstCreateModel(imFrame, y1);

			[bD_, bC1] = imsBDistance(p1, q);
		
			while (bC1 < bC0)
				y1  = 0.5 * (y0 + y1);
				p1  = imsMstCreateModel(imFrame, y1);
				[bD_, bC1] = imsBDistance(p1, q);
			end

			dist = norm(y1 - y0);
			
			p0 = p1;
			y0 = y1;
			bC0 = bC1;

			if (dist < EPSILON)
				break;
			end
		end
		
		imshow(imFrame);
		hold on;
		plot(y1(2), y1(1), 'o');
		rectangle( ...
			'Position', [y1(2) - TARGET_SIZE(2)/2, y1(1) - TARGET_SIZE(1)/2, TARGET_SIZE(2), TARGET_SIZE(1)], ...
			'Curvature', [1, 1], ...
			'EdgeColor', 'white', ...
			'LineWidth', 2);
		drawnow;
		hold off;		
	end

	% Show the target model
%	imsShowHistogram(q);
	
end
