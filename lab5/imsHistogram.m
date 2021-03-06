% imsHistogram() - construct a histogram for the r and g channel
%
% INPUTS:
%  - I, NORMALIZED RGB image
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
    
    R = int8(ceil(R .* n));
    G = int8(ceil(G .* n));
    
    for r = 1:n
        for g = 1:n
            Sr = (R == r);
            Sg = (G == g);
            S = Sr & Sg;
            W = M(S);
            H(r,g) = sum(W);
        end
    end
    
    H = H / sum(H(:));
