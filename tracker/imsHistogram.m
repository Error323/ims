% imsHistogram
%	Construct a histogram for the r and g channel of a NORMALIZED rgb of
%	xyz image.
%
% input:
%	I	NORMALIZED (!!!) image
%	M	mask (gray values representing weights)
%	n	the histogram will contain n*n bins
%
% output
%	H	Histogram, a matrix of n*n values wich sum up to 1
%

function H = imsHistogram(I, M, n)

	% Extract the red and green channels
    R = I(:,:,1);
    G = I(:,:,2);

	% Convert the channels to vectors containing only the pixels described
	% by the mask
    R = R(M > 0);
    G = G(M > 0);
    M = M(M > 0);

	% Initialize an empty histogram
    H = zeros(n^2, 1);

	% Convert the values of R and G (0, 1) to indexes {0, ..., n}
    R = max(ceil(R .* n), 1);
    G = max(ceil(G .* n), 1);

	% Convert the twodimensional index <R,G> into a one dimensional index
	% X {0, ..., n^2}
	X = (R - 1) .* n + G;

	% Calculate the number of pixels (histogram value) for each bin
	% weighted by the weights of the mask M.
    for g = 1:n
        for r = 1:n
			
			% Skip the values in a normalized space that do not exist.
			if (r + g) > n + 1
				continue
			end
			
			% Construct the one dimensional x index from r and g 
			x = (r - 1) .* n + g;
			
			% Select each index in X that equals x.
			S = (X == x);
			
			% Create a weight matrix containing the pixels of the mask
			% where X equals x.
            W = M(S);
			
			% Sum the values of W to form the histogram value for the
			% current bin <r,g>
            H(x) = sum(W);
		end
	end
end

