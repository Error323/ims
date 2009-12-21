% imsHistogram() - construct a histogram for the r and g channel
%
% INPUTS:
%  - I, NORMALIZED (!!!) image
%  - M, mask (gray values)
%  - n, the histogram will contain n*n bins
%
% OUTPUTS:
%  - H, Histogram, a matrix of n*n values wich sum up to 1
%

function H = imsHistogram(I, M, n)

    R = I(:,:,1);
    G = I(:,:,2);
    
    R = R(M > 0);
    G = G(M > 0);
    M = M(M > 0);
    
    H = zeros(n);
    
    R = ceil(R .* n);
    G = ceil(G .* n);

	X = (G - 1) .* n + R;
	
    for g = 1:n
        for r = 1:n
			if (r + g) > n + 1
				continue
			end
			x = (g - 1) .* n + r;
			S = (X == x);
            W = M(S);
            H(g, r) = sum(W);
        end
	end
 
%    H = H / sum(H(:));
