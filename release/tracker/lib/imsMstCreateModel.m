% imsMstCreateModel - Create a model (i.e. a histogram) of an image
% containing an object
%
% INPUTS:
%  - I, frame
%  - y, location
%
% OUTPUT:
%	q, The model/histogram
%
function q = imsMstCreateModel(I, y)

	global TARGET_SIZE COLOR_SPACE BINS;

	% Extract object from frame
	xRange = round(y(2) - (TARGET_SIZE(2)-1) / 2:y(2) + (TARGET_SIZE(2)-1) / 2);
	yRange = round(y(1) - (TARGET_SIZE(1)-1) / 2:y(1) + (TARGET_SIZE(1)-1) / 2);
	if (min(xRange) > 0 && max(xRange) <= size(I, 2) && min(yRange) > 0 && max(yRange) <= size(I, 1)) 
		imObject = I(yRange, xRange, :);
	else
		q = zeros(BINS^length(COLOR_SPACE), 1);
		return;
	end
	
	% Calculate the size of the current image
	aSize = size(imObject);
	
	% Create the kernel
	imKernel = imsKernel(aSize);

	% Create the histogram
	q = imsHistogram(imObject, imKernel);

end