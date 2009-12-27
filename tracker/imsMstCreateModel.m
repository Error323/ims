% imsMstCreateModel
%	Create a model (i.e. a histogram) of an imaga containing an object.
%
% input:
%  imObject		The image containing the object.
%
% output:
%  q			The model/histogram.
%
function q = imsMstCreateModel(imObject)

	global BINS;

	% Calculate the size of the current image
	aSize = size(imObject);
	
	% Create the kernel
	imKernel = imsKernel(aSize);

	% Normalize the object image
	imObject = imsNormalize(imObject);
	
	% Create the histogram
	q = imsHistogram(imObject, imKernel, BINS);

end