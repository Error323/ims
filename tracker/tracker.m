% tracker - Mean shift tracker
%
% INPUT:
%  - sVideo, Path to a video file or folder
%
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

		% Extract a frame from the video
		imFrame = imsVideoGetFrame(i);

		% Create an object model at the previous loation
		p0 = imsMstCreateModel(imFrame, y0);
				
		% Calculate the Bhattacharyya distance and coefficient
		[bD_, bC0] = imsBDistance(p0, q);
		
		while (true)
			
			% Calculate the weights
			W = imsMstWeights(imFrame, y0, q, p0);

			% Estimate the new location
			y1 = y0 + imsMstNextLocation(W);
			
			% Prevent from indexing errors
			if (isnan(sum(y1)))
				imsDebug(true, ['Object lost, skipping frame ' num2str(i) '/' num2str(VIDEO_FRAMES)]);
				break;
			end
			
			% Create an object model at the estimated location
			p1 = imsMstCreateModel(imFrame, y1);

			% Calculate the Bhattacharyya distance and coefficient
			[bD1, bC1] = imsBDistance(p1, q);

			% Improve the estimation
			while (bC1 < bC0)
				y1  = 0.5 * (y0 + y1);
				p1  = imsMstCreateModel(imFrame, y1);
				[bD1, bC1] = imsBDistance(p1, q);
			end

			% Calculate the distance between the previously calculated
			% position and the new position
			dist = norm(y1 - y0);
			
			% Remember some variables for the next itteration
			p0 = p1;
			y0 = y1;
			bC0 = bC1;

			% If the distance is small, the estimation is optimal
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
