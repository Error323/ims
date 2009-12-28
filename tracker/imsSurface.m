% imsSurface
%	Creates an image of h times w pixels containing the colors of the
%	user color space.
%
% input:
%	w	width
%	h	height
%
% output:
%	I	An image of size h times w
%
function I = imsSurface(w, h)

	global COLOR_SPACE;
	
	switch COLOR_SPACE
		case 'RGB'
			I = imsSurfRg(w, h);
		case 'rg'
			I = imsSurfNormalizedRg(w, h);
		case 'HSV'
			I = imsSurfHi(w, h);
		case 'HS'
			I = imsSurfHs(w, h);
		case 'XYZ'
			I = imsSurfXy(w, h);
		case 'xy'
			I = imsSurfNormalizedXy(w, h);
	end
end

function I = imsSurfRg(w, h)

	% Create the X and Y grid.
	[X, Y] = meshgrid(0:1/(w-1):1, 1:-1/(h-1):0);
	
	% Initialize an empty image I.
	I = zeros(h, w, 3);
	
	% The red channel ranges from 0 to 1 on the x axis.
	I(:,:,1) = X;

	% The green channel ranges from 0 to 1 on the y axis.
	I(:,:,2) = Y;
	
	% The value of the blue channel is unknown, so let's choose 0.
	I(:,:,3) = 0;
	
end

function I = imsSurfNormalizedRg(w, h)

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

function I = imsSurfHs(w, h)

	% Create the X and Y grid.
	[X, Y] = meshgrid(0:1/(w-1):1, 1:-1/(h-1):0);
	
	% Initialize an empty image I.
	I = zeros(h, w, 3);
	
	% The hue channel ranges from 0 to 1 on the x axis.
	I(:,:,1) = X;

	% The saturation channel ranges from 0 to 1 on the y axis.
	I(:,:,2) = Y;
	
	% The value/intensity is unknown, so let's choose 1.
	I(:,:,3) = 1;

	% Now convert the HSV values to RGB
	I = hsv2rgb(I);
end

function I = imsSurfHi(w, h)

	% Create the X and Y grid.
	[X, Y] = meshgrid(0:1/(w-1):1, 1:-1/(h-1):0);
	
	% Initialize an empty image I.
	I = zeros(h, w, 3);
	
	% The hue channel ranges from 0 to 1 on the x axis.
	I(:,:,1) = X;

	% The saturation is unknown, so let's choose 0.5.
	I(:,:,2) = 1;
	
	% The value/intensity channel ranges from 0 to 1 on the y axis.
	I(:,:,3) = Y;

	% Now convert the HSV values to RGB
	I = hsv2rgb(I);
end

function I = imsSurfXy(w, h)

	% Create the X and Y grid.
	[X, Y] = meshgrid(0:1/(w-1):1, 1:-1/(h-1):0);
	
	% Initialize an empty image I.
	I = zeros(h, w, 3);
	
	% The X channel ranges from 0 to 1 on the x axis.
	I(:,:,1) = X;

	% The Y channel ranges from 0 to 1 on the y axis.
	I(:,:,2) = Y;
	
	% The Z channel is unknown so let's choose 0.
	I(:,:,3) = 0;

	% Now convert the XYZ values to RGB
	I = xyz2rgb(I);
end

function I = imsSurfNormalizedXy(w, h)

	% Create the X and Y grid.
	[X, Y] = meshgrid(0:1/(w-1):1, 1:-1/(h-1):0);
	
	% Initialize an empty image I.
	I = zeros(h, w, 3);
	
	% The X channel ranges from 0 to 1 on the x axis.
	I(:,:,1) = X;

	% The Y channel ranges from 0 to 1 on the y axis.
	I(:,:,2) = Y;
	
	% In the normalized color space x + y + z = 1 so z = 1 - x - y.
	I(:,:,3) = 1 - I(:, :, 1) - I(:, :, 2);
	
	% Some colors do not exist. For example x = 0.6, y = 0.8. In this case
	% z = 1 - 0.6 - 0.8 = -0.4. By summing the absolute values we find all
	% pixels which rgb color don't realy exist.
	M = sum(abs(I), 3) > 1;
	
	% These pixels are colored white.
	I([M,M,M]) = 1;
	
	% Finally the reference point xyz = [1/3 1/3 1/3] is superimposed by
	% coloring it white.
	I(h - round(h/3) + 1, round(w/3), :) = 1;

	I = xyz2rgb(I);
end


function RGB = xyz2rgb(XYZ)
	RGB = zeros(size(XYZ));
	RGB(:,:,1) =  2.3646 * XYZ(:,:,1) - 0.8965 * XYZ(:,:,2) - 0.4681 * XYZ(:,:,3);
	RGB(:,:,2) = -0.5152 * XYZ(:,:,1) + 1.4264 * XYZ(:,:,2) + 0.0888 * XYZ(:,:,3);
	RGB(:,:,3) =  0.0052 * XYZ(:,:,1) - 0.0144 * XYZ(:,:,2) + 1.0092 * XYZ(:,:,3);
	RGB = min(max(RGB, 0), 1);
end