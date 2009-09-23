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
    e = 1;
    r = floor(d/2);
    [Y,X,Z_] = size(I);
    J = zeros(size(I,1), size(I,2));
    M = imsGaussFilter(d);
    for i = r+1:2:(Y-r-1)
        for j = r+1:2:(X-r-1)
            F = I((i-r:i+r), (j-r:j+r), :);
            H = imsHistogram(F, M, size(Ho,1));
            J(i,j) = sum(sum((H - Ho).^2));
            if (J(i,j) < e)
                y = i;
                x = j;
                e = J(i,j);
            end
        end
    end
    J = -J;
    J = (J - min(J(:))) ./ (max(J(:)) - min(J(:)));
    figure;imshow(J);
    imwrite(J, filename);
    imwrite(J, filename);
