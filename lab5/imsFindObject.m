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

function [x, y] = imsFindObject(I, Ho, d)
    e = Inf;
    ry = floor(d(1)/2);
    rx = floor(d(2)/2);
    [Y,X,Z_] = size(I);
    J = zeros(size(I,1), size(I,2));
	
	h = d(1);
	w = d(2);
	S = [(h/4)^2, 0; 0, (w/4)^2];
    Mask = imsGaussFilter(h, w, S);
	
	h = size(I, 1);
	w = size(I, 2);
	S = [(h/8)^2, 0; 0, (w/8)^2];
	W = imsGaussFilter(h, w, S);
	
    for i = 1:1:Y
        for j = 1:1:X
			Ymin = max(i-ry, 1);
			Ymax = min(i+ry, Y);
			Xmin = max(j-rx, 1);
			Xmax = min(j+rx, X);
            F = I(Ymin:Ymax, Xmin:Xmax, :);
			
			Ymin = Ymin + ry - i + 1;
			Ymax = Ymax + ry - i;
			Xmin = Xmin + rx - j + 1;
			Xmax = Xmax + rx - j;
			
			M = Mask(Ymin:Ymax, Xmin:Xmax);			
			
            H = imsHistogram(F, M, size(Ho,1));
            %J(i,j) = sum(sum((H - Ho).^2));
            J(i,j) = imsBDistance(H, Ho) / W(i, j);
%            J(i,j) = imsBDistance(H, Ho);
            if (J(i,j) < e)
                y = i;
                x = j;
                e = J(i,j);
            end
        end
    end
