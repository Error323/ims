% imsNormalizeRgb() - Converts RGB to normalized rgb (Lab 1)
%
% INPUTS:
%  - I, RGB image
%
% OUTPUTS:
%  - I, normalized rgb image
%

function I = imsNormalizeRgb(I)

    % V, the sum of the R, G and B channel for each pixel
    V = sum(I, 3);

    % An alternative:
    % V, the length of the RGB vector for each pixel
    % V = sqrt(sum(I.^2, 3));
    
    % Each RGB channel is divided by v, so v may never be 0.
    % v = 0 iff r=g=b=0. So we can change v to 1 in this case, because
    % r/v = g/v = b/v = 0/1 = 0
    V = V + (V == 0);

    % Divide each color channel by the length of the RGB vector
    I(:,:,1) = I(:,:,1) ./ V;
    I(:,:,2) = I(:,:,2) ./ V;
    I(:,:,3) = I(:,:,3) ./ V;
    
