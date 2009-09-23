% main - Run this function for a demonstration of Lab 1
%
%	INPUTS:
%	 - void
%
%	OUTPUTS:
%	 - void
%
%   See also imsNormalizeRgb imsRgbToOpponent imsRgbToHsi


%% Read an image (I) and show all channels

image = '../data/nemo2.jpg';

I = im2single(imread(image));
img = [I(:,:,1); I(:,:,2); I(:,:,3)];

%% RGB to normalized rgb conversion

rgb = imsNormalizeRgb(I);
img = [img, [rgb(:, :, 1); rgb(:, :, 2); rgb(:, :, 3)]];


%% RGB to Opponent Color Space conversion

opp = imsRgbToOpponent(I);
img = [img, [opp(:, :, 1); opp(:, :, 2); opp(:, :, 3)]];


%% RGB to HSI conversion

hsi = imsRgbToHsi(I);
img = [img, [hsi(:, :, 1); hsi(:, :, 2); hsi(:, :, 3)]];


%% Show the results as one image
result = zeros(size(img,1), size(img,2), 3);
result(:,:,1) = img;
result(:,:,2) = img;
result(:,:,3) = img;

result = [[I,rgb,opp,hsi];result];
imshow(result);
