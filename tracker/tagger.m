% tagger - Manually tag the position of an object in each frame of a video
%	Note that a roi file for the specified video object is required
%
% INPUTS:
%  - sVideo, path to a video file or folder
%  - sObject, the name of the object regio
%
function tagger(sVideo, sObject)
	
	globals;
	
	imsVideoLoad(sVideo);

	sStatFile = imsStatsFile(sVideo, sObject);

	ROI_FILE = ['roi/' imsStatsFile(sVideo, sObject)];
	
	if exist(sStatFile, 'file')
		load(sStatFile)
	elsesStatFile
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
		
		Y(i, :) = round([y, x]);
		save(sStatFile, 'Y');
		
		clf;
	end
	
	imshow(imsVideoGetFrame(1));
	hold on;
	plot(Y(1:iStartFrame, 2), Y(1:iStartFrame, 1), 'r');
	plot(Y(iStartFrame:end, 2), Y(iStartFrame:end, 1), 'g');
	
end
