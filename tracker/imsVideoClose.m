% imsVideoClose - Store the result video
%
function imsVideoClose()
	global RESULT_VIDEO;
	imsDebug('STAT', 'Saving result video (please wait)');
	RESULT_VIDEO = close(RESULT_VIDEO);
end