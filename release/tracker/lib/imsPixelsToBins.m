% imsPixelsToBins - Return the a vector of bin indexes
%
% INPUTS:
%  - I, image
%  - M, mask (gray values representing weights)
%
% OUTPUT:
%  - X, Bin indexes
%
function [X, bins] = imsPixelsToBins(I, M)
	
	% convert to another colors pace
	I = imsColorSpace(I);

	[bins, d] = imsGetBins();
	n = round(bins^(1/d));
	
	if exist('M', 'var')
		% Create a multi dimensional mask
		M = repmat(M, [1 1 d]);

		% Convert the channels to vectors containing only the pixels described
		% by the mask
		I = I(M > 0);
	end

	% reshape the image
	I = reshape(I, [], d);
			
	% Convert the values (0, 1) to indexes {0, ..., n}
    X = min(floor(I .* n), n-1);
	
	% Convert the d-dimensional index <C1,...,Cd> into a one dimensional index
	D = n.^(d-1:-1:0);
	X = X * D';

	X = X + 1;
	
end