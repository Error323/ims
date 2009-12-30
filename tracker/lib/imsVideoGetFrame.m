% imsVideoGetFrame - Loads frame i from the global 'video stream' VIDEO.
%
% INPUT:
%  - i, Frame number
%
% OUTPUT:
%  - imFrame, The i-th frame of the 'video stream'
%
function imFrame = imsVideoGetFrame(i)

	global VIDEO_FRAMES VIDEO;

	if (i < 0 || i > VIDEO_FRAMES)
		error(['Invalid video frame number ' num2str(i)]);
	end

	
	if isa(VIDEO, 'mmreader')
		
		% Extract the i-th frame of the video.
		imFrame = read(VIDEO, i);
		imFrame = im2double(imFrame);
		
		% Show a debug message.
		imsDebug('IMAQ', ['Frame ' num2str(i) '/' num2str(VIDEO_FRAMES) ' loaded']);
	elseif isa(VIDEO, 'cell')

		% Extract the path of the i-th frame.
		sFrame = VIDEO{i};

		% Load the frame and convert it to doubles.
		imFrame = imread(sFrame);	
		imFrame = im2double(imFrame);

		% Show a debug message.
		imsDebug('IMAQ', ['Frame "' sFrame '" loaded']);
	else
		error('Unsupported video type');
	end
	
end