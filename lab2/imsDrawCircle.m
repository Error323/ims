% imsDrawCircle(I, x, y, r, thickness) - Draws a circle at (x,y) with radius r
%
% INPUTS:
%  - I, image
%  - x, horizontal coordinate
%  - y, vertical coordinate
%  - r, radius
%  - thickness, thickness of the circle
%
% OUTPUTS:
%  - I, image containing a circle

function I = imsDrawCircle(I, x, y, r, thickness)

	range = floor(-r-thickness/2):ceil(r+thickness/2);
	for i = range
		for j = range
			Cout = max(min(r - sqrt(i^2+j^2) + thickness/2, 1), 0);
			Cin = 1 - max(min(r - sqrt(i^2+j^2) - thickness/2, 1), 0);
			C = min(Cout, Cin);
			if (y+i > 0 && x+j > 0 && y+i <= size(I,1) && x+j <= size(I,2))
				I(y+i, x+j, :)   = (1-C) .* I(y+i, x+j, :) + C;
			end
		end
	end
