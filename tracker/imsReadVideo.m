% imsMstReadVideo
%	Read a video (folder) and store it in the global variable VIDEO_FILES.
%
% input:
%	sVideo		Path to the video.
%
function imsMstReadVideo(sVideo)

	global VIDEO_FILES VIDEO_FRAMES;

	aDir = dir(sVideo);
	
	VIDEO_FILES = {};
	VIDEO_FRAMES = 0;
	for i = 1:length(aDir);
		oFile = aDir(i);
		if (oFile.name(1) ~= '.')
			VIDEO_FRAMES = VIDEO_FRAMES + 1;
			VIDEO_FILES{VIDEO_FRAMES} = [sVideo, '/', oFile.name];
		end
	end
	
	imsDebug('IMAQ', [num2str(VIDEO_FRAMES) ' frames listed']);
	
end