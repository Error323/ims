function tracker(sVideo, iSkipFrames)

	global VIDEO_FRAMES EPSILON;
	
	% Load the globals
	globals;

	if ~exist('iSkipFrames', 'var')
		iSkipFrames = 1;
	end
		
	% Load the video files
	imsReadVideo(sVideo);
	
	% Get the first frame to select the target object
	imFrame = imsLoadFrame(1);
	y0 = imsGetRoi(imFrame);
	
	% Create a target model (i.e. a histogram)
	q = imsMstCreateModel(imFrame, y0);
	
	stats = zeros(1, VIDEO_FRAMES / iSkipFrames);
	if exist('cache/stats.mat', 'file')
		load('cache/stats.mat');
		stats(size(stats, 1) + 1, :) = 0;
	end
	
	for i = iSkipFrames:iSkipFrames:VIDEO_FRAMES
		
		imFrame = imsLoadFrame(i);

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
		
		imsMstVisualize(imFrame, q, p0, y0, bC0);
		stats(end, i / iSkipFrames) = bD1;
	end

	save('cache/stats.mat', 'stats');
	subplot(2, 3, [1 2 4 5]);
	plot(stats');
end
