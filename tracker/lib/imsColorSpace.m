% imsColorSpace - Converts RGB to another colorspace (See also globals.m)
%
% INPUT:
%  - I, original image
%
% output:
%  - I, converted image
%
function I = imsColorSpace(I)

	global COLOR_SPACE;
	
	switch COLOR_SPACE
		case 'RGB'
			I = I;
		case 'rg'
			I = imsCsNormalize(I);
			I = I(:,:,1:2);
		case 'HSV'
			I = imsCsHsv(I);
		case 'HS'
			I = imsCsHsv(I);
			I = I(:,:,1:2);
		case 'XYZ'
			I = imsCsXyz(I);
		case 'xy'
			I = imsCsXyz(I);
			I = imsCsNormalize(I);
			I = I(:,:,1:2);
	end
	I = min(max(I, 0), 1); 
end

function I = imsCsNormalize(I)
    V = sum(I, 3);
    V = V + (V == 0);
	for i = 1:size(I, 3)
		I(:,:,i) = I(:,:,i) ./ V;
	end
end

function I = imsCsHsv(I)
	I = rgb2hsv(I);
end

function XYZ = imsCsXyz(RGB)
	XYZ = zeros(size(RGB));
	XYZ(:,:,1) = 0.49000 * RGB(:,:,1) + 0.31000 * RGB(:,:,2) + 0.20000 * RGB(:,:,3);
	XYZ(:,:,2) = 0.17697 * RGB(:,:,1) + 0.81240 * RGB(:,:,2) + 0.01063 * RGB(:,:,3);
	XYZ(:,:,3) = 0.00000 * RGB(:,:,1) + 0.01000 * RGB(:,:,2) + 0.99000 * RGB(:,:,3);
end
