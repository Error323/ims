% imsVideoInit - Create an empty video file to store the result video
%
function imsVideoInit()
	global RESULT_VIDEO;
	RESULT_VIDEO = avifile(RESULT_VIDEO);
end