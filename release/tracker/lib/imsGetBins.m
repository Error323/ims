% imsGetBins - Calculate the exact number of bins and dimension
%
% OUTPUTS:
%  - bins, the exact number of bins
%  - d, dimensions
%
function [bins, d] = imsGetBins()

	global BINS COLOR_SPACE;

	% We asume that the length of the name on the color space represents
	% the number of dimensions because it is always an abbreviate.
	d = length(COLOR_SPACE);

	% Calculate the lower and upperbounds
	n1 = floor(BINS^(1/d));
	n2 = ceil(BINS^(1/d));
	
	% Choose the best approximation
	if BINS - n1^d < n2^d - BINS
		n = n1;
	else
		n = n2;
	end

	% The exact number of bins
	bins = round(n^d);

end
