% imsCircle - Creates a black image containing a white circle
%
% INPUTS:
%  - aSize, vector containing width and height
%  - z, border size / thickness
%
% output:
%  - I, converted image
%
function C = imsCircle(aSize, z)

	% Outer circle
	h = aSize(1);
	w = aSize(2);
	s = (w + h) / 4;
	
	[X, Y] = meshgrid(-s:s/(w-1)*2:s, -s:s/(h-1)*2:s);

	Cout = min(max(s - (X.^2 + Y.^2).^(1/2) + 1, 0), 1);
	
	% Inner circle
	w = w - 2 * z;
	h = h - 2 * z;

	s = (w + h) / 4;
	
	[X, Y] = meshgrid(-s:s/(w-1)*2:s, -s:s/(h-1)*2:s);

	Cin = min(max(s - (X.^2 + Y.^2).^(1/2), 0), 1);

	% Combine both circles
	C = Cout;
	C(z+1:z+h, z+1:z+w) = C(z+1:z+h, z+1:z+w) - Cin;
	
end