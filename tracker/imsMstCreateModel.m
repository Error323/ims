function q = imsMstCreateModel(imObject, h)

	global BINS TARGET_SIZE;

	aSize = size(imObject);

	if (TARGET_SIZE == 0)
		TARGET_SIZE = aSize;
	end
	
	h = max(aSize(1), aSize(2)) / max(TARGET_SIZE(1), TARGET_SIZE(2));
	
	imKernel = imsKernel(h, aSize);
	
	imObject = imsNormalize(imObject);
	
	q = imsHistogram(imObject, imKernel, BINS);

end