% imsRgbToXyz() - Converts RGB to XYZ color space
%
%	INPUTS:
%	 - I, source image
%
%	OUTPUTS:
%	 - I, result image
%

function I = imsRgbToXyz(I)

	R = I(:, :, 1);
	G = I(:, :, 2);
	B = I(:, :, 3);
	
	% 1/0.17697 * [0.49, 0.31, 0.20; 0.17697, 0.81240, 0.01063; 0, 0.01, 0.99];
	X = (0.49 * R + 0.31 * G + 0.20 * B);
	Y = (0.17697 * R + 0.81240 * G + 0.01063 * B);
	Z = (0 * R + 0.01 * G + 0.99 * B);

	I(:, :, 1) = min(max(X, 0), 1);
	I(:, :, 2) = min(max(Y, 0), 1);
	I(:, :, 3) = min(max(Z, 0), 1);
