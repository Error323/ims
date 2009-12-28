% imsMstCreateModel
%	Create a model (i.e. a histogram) of an imaga containing an object.
%
% input:
%	imFrame
%	y
%
% output:
%	q		The model/histogram.
%
function q = imsMstCreateModel(imFrame, y)

	global TARGET_SIZE;

	% Extract object from frame
	xRange = round(y(2) - TARGET_SIZE(2) / 2:y(2) + TARGET_SIZE(2) / 2);
	yRange = round(y(1) - TARGET_SIZE(1) / 2:y(1) + TARGET_SIZE(1) / 2);
	imObject = imFrame(yRange, xRange, :);
	
	% Calculate the size of the current image
	aSize = size(imObject);
	
	% Create the kernel
	imKernel = imsKernel(aSize);

	% Create the histogram
	q = imsHistogram(imObject, imKernel);

end