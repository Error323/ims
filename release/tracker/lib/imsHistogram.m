% imsHistogram - Construct a histogram for an image
%
% INPUTS:
%  - I, image
%  - M, mask (gray values representing weights)
%
% OUTPUT:
%  - H, histogram, a vector with +/- [bins] values which sum up to 1
%
function H = imsHistogram(I, M)

	[X, bins] = imsPixelsToBins(I, M);

	% Convert the mask to a vector where it's values are larger than zero.
	M = M(M > 0);

	% Initialize an empty histogram
    H = zeros(bins, 1);

	% Calculate the number of pixels (histogram value) for each bin
	% weighted by the weights of the mask M.
	for x = 1:bins
		% Create a weight matrix containing the pixels of the mask
		% where X equals x.
		W = M(X == x);

		% Sum the values of W to form the histogram value for the
		% current bin
		H(x) = sum(W);
	end
	
end
