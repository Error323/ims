% imsRgbToOpponent() - Converts RGB to Opponent color space
%
%	INPUTS:
%	 - I, source image
%
%	OUTPUTS:
%	 - I, result image
%

function I = imsRgbToOpponent(I)

R = I(:, :, 1);
G = I(:, :, 2);
B = I(:, :, 3);

I(:, :, 1) = (R - G) / sqrt(2);
I(:, :, 2) = (R + G - 2*B) / sqrt(6);
I(:, :, 3) = (R + G + B) / sqrt(3);
