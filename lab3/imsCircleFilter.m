% imsCircleFilter(d) - Creates a circular filter
%
% INPUTS:
%  - d, the dimensions of the filter
%
% OUTPUTS:
%  - C, the circular filter

function C = imsCircleFilter(d)
    C = zeros(d);
    r = floor(d/2);
    for i = -r:r
        for j = -r:r
            C(i+r+1,j+r+1) = max(min(r - sqrt(i^2+j^2), 1), 0);
        end
    end
    
