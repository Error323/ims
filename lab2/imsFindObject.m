% imsFindObject(I, H, d) - find the 2D coordinate of an object
%
%	INPUTS:
%	 - I, normalized rgb image
%	 - H, the object histogram 
%	 - d, the dimensions
%
%	OUTPUTS:
%	 - x, coordinate of located object
%    - y, coordinate of located object
%    - r, radius of the object located
%    - e, error

function [x, y, r, e] = imsFindObject(I, Ho, d, filename)
    r = floor(d/2);
    [Y,X,Z] = size(I);
    J = zeros(size(I,1), size(I,2));
    M = imsGaussFilter(d);
    for y = r+1:2:(Y-r-1)
        for x = r+1:2:(X-r-1)
            F = I((y-r:y+r), (x-r:x+r), :);
            H = imsHistogram(F, M, size(Ho,1));
            J(y,x) = sum(sum((H - Ho).^2));
        end
    end
    J = -J;
    J = (J - min(J(:))) ./ (max(J(:)) - min(J(:)));
    imshow(J);figure;
    imwrite(J, filename);