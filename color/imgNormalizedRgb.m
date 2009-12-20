function I = imgNormalizedRgb(w, h)

	[X, Y] = meshgrid(0:1/(w-1):1, 0:1/(h-1):1);
	I = zeros(h, w, 3);
	I(:,:,1) = X;
	I(:,:,2) = 1-Y;
	I(:,:,3) = 1 - I(:, :, 1) - I(:, :, 2);
	M = sum(abs(I), 3) > 1;
	I([M,M,M]) = 1;
	I(h - round(h/3), round(w/3), :) = 1;
	imshow(I);

end