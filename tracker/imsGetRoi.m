% imsGetRoi
%	Select the ROI (i.e. target object) by user input, or by loading the
%	data from a saved file in the cahe folder.
%
% input:
%	imImage		An image (typically the first frame of a video stream)
%
% output:
%	imRoi		An image containing the target object
%	y0			The coordinates (the center of the target object)
%
function [imRoi, y0] = imsGetRoi(imImage)
	
	global CACHE

	% Load the data from the cache (if possible) and show a debug message
	if CACHE && exist('cache/imsGetRoi.mat', 'file')
		load('cache/imsGetRoi.mat');
		imsDebug('TGSL', ['Target loaded from file x=', num2str(y0(2)), ', y=', num2str(y0(1)),', width=', num2str(size(imRoi, 2)), ', height=', num2str(size(imRoi, 1))]);
		return
	end

	% Start a new figure and show the image
	f = figure;
	imshow(imImage);

	% Select the region of interest
	[x, y, w, h] = imsSelectRoi();

	% Extract the ROI as a small image
	imRoi = imImage(y:y+h, x:x+w, :);

	% Close the figure
	close(f);
	
	% Construct 
	y0 = [y+h/2; x+w/2];

	% Save the data in the cache
	if CACHE save('cache/imsGetRoi.mat', 'imRoi', 'y0');

	% Show a debug message
	imsDebug('TGSL', ['Target selected by user x=', num2str(y0(2)), ', y=', num2str(y0(1)),', width=', num2str(size(imRoi, 2)), ', height=', num2str(size(imRoi, 1))]);

end	    