% imsMstReadVideo
%	Read a video (folder) and store it in the global variable VIDEO_FILES.
%
% input:
%	sVideo		Path to the video.
%
function imsMstReadVideo(sVideo)

	global VIDEO_FILES;

	aDir = dir(sVideo);
	
	VIDEO_FILES = {};
	for i = 1:length(aDir);
		oFile = aDir(i);
		if (oFile.name(1) ~= '.')
			j = length(VIDEO_FILES) + 1;
			VIDEO_FILES{j} = [sVideo, '/', oFile.name];
		end
	end
	
	imsDebug('IMAQ', [num2str(length(VIDEO_FILES)) ' frames listed']);
	
end