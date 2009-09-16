% imsRgbToHsv() - Converts RGB to HSV
%
%	INPUTS:
%	 - I, source image
%
%	OUTPUTS:
%	 - I = [H, S, V], result image
%

function I = imsRgbToHsv(I)
	% HSV = rgb2hsv(I);

	% Extract the R,G,B channels
	R = I(:,:,1);
	G = I(:,:,2);
	B = I(:,:,3);
	
	% Calculate intensity or value
	I(:,:,3) = sum(I,3) ./ 3;

	% Calculate hue
	I(:,:,1) = atan( (sqrt(3).*(G-B)) ./ ((R-G)+(R-B)) );

	% Calculate saturation
	I(:,:,2) = 1 - 3 * min(R, min(G, B));

	% F-NOTE:
	% HSV computed by matlabs rgb2hsv is not equal to this one...
	% Also the wiki shows a different method for computing rgb2hsv:
	% http://en.wikipedia.org/wiki/HSL_and_HSV#Conversion_from_RGB_to_HSL_or_HSV

	% imshow(HSV);
	% figure;
