% imsRgbToHsi() - Converts RGB to HSI
%
%	INPUTS:
%	 - I, source image
%
%	OUTPUTS:
%	 - I = [H, S, I], result image
%

function I = imsRgbToHsi(I)
	% Extract the R,G,B channels
	R = I(:,:,1); G = I(:,:,2); B = I(:,:,3);
	
	% Calculate intensity or value
	I(:,:,3) = sum(I,3) ./ 3;

	% Calculate hue and normalize
	I(:,:,1) = atan( (sqrt(3).*(G-B)) ./ ((R-G)+(R-B)) ) / pi + 0.5;

	% Calculate saturation
    i = imsNormalizeRgb(I);
	r = i(:,:,1); g = i(:,:,2); b = i(:,:,3);    
	I(:,:,2) = 1 - 3 * min(r, min(g, b));
