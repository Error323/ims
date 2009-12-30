% imsGetRoi - Select the ROI (i.e. target object) by user input, or by
% loading the data from a saved file in the cahe folder.
%
% INPUT:
%  - imImage, An image (typically the first frame of a video stream)
%
% OUTPUT:
%  - y0, The coordinates (the center of the target object)
%
function y0 = imsGetRoi(imImage)
	
	global CACHE TARGET_SIZE ROI_FILE;

	% Load the data from the cache (if possible) and show a debug message
	if CACHE && exist(ROI_FILE, 'file')
		load(ROI_FILE);
		imsDebug('TGSL', ['Target loaded from "' ROI_FILE '" x=', num2str(y0(2)), ', y=', num2str(y0(1)),', width=', num2str(TARGET_SIZE(2)), ', height=', num2str(TARGET_SIZE(1))]);
		return
	end

	% Start a new figure and show the image
	f = figure;
	imshow(imImage);

	% Select the region of interest
	[x, y, w, h] = imsSelectRoi();

	% Close the figure
	close(f);
	
	% Construct y0
	y0 = [y+h/2; x+w/2];
	
	TARGET_SIZE = [h, w];

	% Save the data in the cache
	if CACHE && ~isempty(ROI_FILE)
		save(ROI_FILE, 'y0', 'TARGET_SIZE');
	end
	
	% Show a debug message
	imsDebug('TGSL', ['Target selected by user x=', num2str(y0(2)), ', y=', num2str(y0(1)),', width=', num2str(TARGET_SIZE(2)), ', height=', num2str(TARGET_SIZE(1))]);

end	    