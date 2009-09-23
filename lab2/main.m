% main - Run this function for a demonstration of Lab 2
%
%	INPUTS:
%	 - void
%
%	OUTPUTS:
%	 - void
%
%   See also 

%% Read image and mask

I = im2single(imread('../data/nemo2.jpg'));

M = rgb2gray(im2single(imread('../data/nemo2_mask.jpg')));

In = imsNormalizeRgb(I);

H = imsHistogram(In, M, 10);

imsFindObject(In, H, 101, 'result1.png');

I = im2single(imread('../data/nemo1.jpg'));

In = imsNormalizeRgb(I);

imsFindObject(In, H, 101, 'result2.png');

mesh(H);