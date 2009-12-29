function [bins, d] = imsGetBins()

	global BINS COLOR_SPACE;
	
	d = length(COLOR_SPACE);

	% Calculate the exact number of bins
	n1 = floor(BINS^(1/d));
	n2 = ceil(BINS^(1/d));
	
	if BINS - n1^d < n2^d - BINS
		n = n1;
	else
		n = n2;
	end
	
	bins = n^d;

end
