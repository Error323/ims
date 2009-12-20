function H = graph(image, n)

	I = im2double(imread(image));
	I = imsNormalize(I);
	M = ones(size(I, 1), size(I, 2), 1);
	H = imsHistogram(I, M, n);

end
