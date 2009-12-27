% imgNormalizedRgb
%	Creates an image of h times w pixels containing the colors of the
%	normalized rgb spaces.
%
% input:
%	w	width
%	h	height
%
% output:
%	I	An image of size h times w
%
function I = imgNormalizedRgb(w, h)

	% Create the X and Y grid.
	[X, Y] = meshgrid(0:1/(w-1):1, 1:-1/(h-1):0);
	
	% Initialize an empty image I.
	I = zeros(h, w, 3);
	
	% The red channel ranges from 0 to 1 on the x axis.
	I(:,:,1) = X;

	% The green channel ranges from 0 to 1 on the y axis.
	I(:,:,2) = Y;
	
	% In the normalized color space r + g + b = 1 so b = 1 - r - g.
	I(:,:,3) = 1 - I(:, :, 1) - I(:, :, 2);
	
	% Some colors do not exist. For example r = 0.6, g = 0.8. In this case
	% b = 1 - 0.6 - 0.8 = -0.4. By summing the absolute values we find all
	% pixels which rgb color don't realy exist.
	M = sum(abs(I), 3) > 1;
	
	% These pixels are colored white.
	I([M,M,M]) = 1;
	
	% Finally the reference point rgb = [1/3 1/3 1/3] is superimposed by
	% coloring it white.
	I(h - round(h/3) + 1, round(w/3), :) = 1;

end