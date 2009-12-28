% imsColorspace
%	Converts RGB to another colorspace (See also globals.m)
%
% input:
%  I	Original image.
%
% output:
%  I	onverted image.
%
function I = imsColorspace(I)

	global COLOR_SPACE;
	
	switch COLOR_SPACE
		case 'RG'
			I = I(:,:,1:2);
		case 'rg'
			I = imsCsNormalize(I);
			I = I(:,:,1:2);
		case 'HS'
			I = imsCsHsv(I);
			I = I(:,:,1:2);
		case 'HI'
			I = imsCsHsv(I);
			I = I(:,:,[1,3]);
		case 'XY'
			I = imsCsXyz(I);
			I = I(:,:,1:2);
		case 'xy'
			I = imsCsXyz(I);
			I = imsCsNormalize(I);
			I = I(:,:,1:2);
	end
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
