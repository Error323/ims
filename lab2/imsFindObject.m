% imsFindObject(I, H, d) - find the 2D coordinate of an object
%
% INPUTS:
%  - I, normalized rgb image
%  - H, the object histogram 
%  - d, the dimensions
% 
% OUTPUTS:
%  - x, coordinate of located object
%  - y, coordinate of located object
%  - r, radius of the object located
%  - e, error

function [x, y, r, e] = imsFindObject(I, Ho, d)
    e = 1;
    r = floor(d/2);
    [Y,X,Z_] = size(I);
    J = zeros(size(I,1), size(I,2));
    Mask = imsGaussFilter(d);
    for i = 1:1:Y
        for j = 1:1:X
			Ymin = max(i-r, 1);
			Ymax = min(i+r, Y);
			Xmin = max(j-r, 1);
			Xmax = min(j+r, X);
            F = I(Ymin:Ymax, Xmin:Xmax, :);
			
			Ymin = Ymin + r - i + 1;
			Ymax = Ymax + r - i + 1;
			Xmin = Xmin + r - j + 1;
			Xmax = Xmax + r - j + 1;
			
			M = Mask(Ymin:Ymax, Xmin:Xmax);			
			
            H = imsHistogram(F, M, size(Ho,1));
            J(i,j) = sum(sum((H - Ho).^2));
            if (J(i,j) < e)
                y = i;
                x = j;
                e = J(i,j);
            end
        end
    end

    imwrite(1-J, 'img/nemo1_bp.png');