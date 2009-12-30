% imsVideoLoad - Read a video and store it in the global variable VIDEO
%
% INPUT:
%  - sVideo, Path to the video.
%
function imsVideoLoad(sVideo)

	global VIDEO VIDEO_FRAMES;

	if ~exist(sVideo, 'file')
		error(['Video file or folder ' sVideo ' does not exist!']);
	end

	VIDEO = {};
	VIDEO_FRAMES = 0;

	if exist(sVideo, 'dir')

		aDir = dir(sVideo);

		for i = 1:length(aDir);
			oFile = aDir(i);
			if ~oFile.isdir
				VIDEO_FRAMES = VIDEO_FRAMES + 1;
				VIDEO{VIDEO_FRAMES} = [sVideo, '/', oFile.name];
			end
		end
		
		if VIDEO_FRAMES == 0
			imsDebug('IMAQ', ['Video folder ' sVideo ' contains no frames!']);
		end
		
		imsDebug('IMAQ', ['Video folder ' sVideo ' found, ' num2str(VIDEO_FRAMES) ' frames listed']);
	else
		
		try
			imsDebug('IMAQ', ['Reading video file ' sVideo]);
			VIDEO = mmreader(sVideo);
		catch
			error(['Unsupported video file: ' sVideo]);
		end
		
		VIDEO_FRAMES = VIDEO.NumberOfFrames;
		
		imsDebug('IMAQ', ['Video file ' sVideo ' loaded, ' num2str(VIDEO_FRAMES) ' frames listed']);
		disp(VIDEO);
	end
end