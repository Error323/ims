% main - Run this function for a demonstration of Lab 1
%
%	INPUTS:
%	 - void
%
%	OUTPUTS:
%	 - void
%
%   See also imsNormalizeRgb imsRgbToOpponent imsRgbToHsv imsNormalizeValues


%% Read an image (I) and show all channels

image = 'data/nemo2.jpg';

I = im2single(imread(image));
img = imsNormalizeValues(img);
img = [I(:,:,1); I(:,:,2); I(:,:,3)];

%% RGB to normalized rgb conversion

rgb = imsNormalizeRgb(I);
rgb = imsNormalizeValues(rgb);
img = [img, [rgb(:, :, 1); rgb(:, :, 2); rgb(:, :, 3)]];


%% RGB to Opponent Color Space conversion

opp = imsRgbToOpponent(I);
opp = imsNormalizeValues(opp);
img = [img, [opp(:, :, 1); opp(:, :, 2); opp(:, :, 3)]];


%% RGB to HSV conversion

hsi = imsRgbToHsv(I);
hsi = imsNormalizeValues(hsi);
img = [img, [hsi(:, :, 1); hsi(:, :, 2); hsi(:, :, 3)]];


%% Show the results as one image
result = zeros(size(img,1), size(img,2), 3);
result(:,:,1) = img;
result(:,:,2) = img;
result(:,:,3) = img;

result = [[I,rgb,opp,hsi];result];
imshow(result);
