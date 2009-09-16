% main - Run this function for a demonstration of Lab 1
%
%	INPUTS:
%	 - void
%
%	OUTPUTS:
%	 - void
%
%   See also imsNormalizeRgb imsRgbToOpponent imsRgbToHsv


%% Read an image (I) and show it

image = 'data/nemo2.jpg';

I = im2single(imread(image));

figure('Name', 'Source image');

imshow(I);


%% RGB to normalized rgb conversion

figure('Name', 'RGB to normalized rgb');

imshow(imsNormalizeRgb(I));


%% RGB to Opponent Color Space conversion

figure('Name', 'RGB to Opponent Color Space');

imshow(imsRgbToOpponent(I));


%% RGB to HSV conversion

figure('Name', 'RGB to HSV conversion');

imshow(imsRgbToHsv(I));
