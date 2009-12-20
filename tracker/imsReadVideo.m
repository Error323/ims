function imsMstReadVideo(sVideo)

	global VIDEO_FILES;

	aDir = dir(sVideo);
	
	VIDEO_FILES = {};
	for i = 1:length(aDir);
		oFile = aDir(i);
		if (oFile.bytes > 0)
			j = length(VIDEO_FILES) + 1;
			VIDEO_FILES{j} = [sVideo, '/', oFile.name];
		end
	end
	
	imsDebug('aquisition', [num2str(length(VIDEO_FILES)) ' frames listed']);
	
end