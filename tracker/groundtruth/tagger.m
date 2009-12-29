function tagger(sVideo, sRegion)

	addpath('..');
	
	globals;
	
	imsVideoLoad(sVideo);

	ROI_FILE = '../roi/soccer_orange.mat';

	sStatFile = 'stat.mat';
	
	if exist(sStatFile, 'file')
		load(sStatFile)
	else
		Y = [];
	end
	
	iStartFrame = max(size(Y, 1), 1);
	
	imshow(imsVideoGetFrame(iStartFrame));
	
	hold on;
	if (iStartFrame == 1)
		Y(iStartFrame, :) = imsGetRoi([])';
	end
	plot(Y(1:iStartFrame, 2), Y(1:iStartFrame, 1), 'r');
	plot(Y(iStartFrame, 2), Y(iStartFrame, 1), '.r');
	plot(Y(iStartFrame, 2), Y(iStartFrame, 1), 'or');
	plot(Y(iStartFrame, 2), Y(iStartFrame, 1), '+g');
	ginput(1);

	for i = iStartFrame:VIDEO_FRAMES
		imshow(imsVideoGetFrame(i));
		
		[x, y, btn] = ginput(1);
		
		if btn == 3
			break;
		end
		
		Y(i, :) = [y, x];
		save(sStatFile, 'Y');
		
		clf;
	end
	
	imshow(imsVideoGetFrame(1));
	hold on;
	plot(Y(1:iStartFrame, 2), Y(1:iStartFrame, 1), 'r');
	plot(Y(iStartFrame:end, 2), Y(iStartFrame:end, 1), 'g');
	
end
