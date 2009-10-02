% imsGaussFilter(d) - Computes normal distribution of a 2D grid
%
% INPUTS:
%  - d, the dimensions of the filter
%
% OUTPUTS:
%  - G, the 2d gaussian grid

function G = imsGaussFilter(d)

    r = floor(d/2);
    s = floor(r/2);
    
    G = zeros(2*r+1);
    
    for x = -r:r
        G(r+x+1) = imsGauss(x, 0, s);
    end
    
    G = G * G';

    G = G ./ G(r+1, r+1);
    
    G = G .* imsCircleFilter(2*r+1);
