% imsLoadFrame
%	Loads frame i from the global 'video stream' VIDEO_FILES.
%
% input:
%	i			Frame number
%
% output
%	imFrame		The i-th frame of the 'video stream'
%
function imFrame = imsLoadFrame(i)

	global VIDEO_FILES;

	% Extract the path of the i-th frame.
	sFrame = VIDEO_FILES{i};

	% Load the frame and convert it to doubles.
	imFrame = imread(sFrame);	
	imFrame = im2double(imFrame);

	% Show a debug message.
	imsDebug('IMAQ', ['Frame "', sFrame, '" loaded']);

end