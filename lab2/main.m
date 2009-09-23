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

H = imsHistogram(In, M, 5);

I = im2single(imread('../data/nemo1.jpg'));

In = imsNormalizeRgb(I);

[x,y,r,e] = imsFindObject(In, H, 75, 'img/result2.png');
I = imsDrawCircle(I,x,y,r,5);
figure;imshow(I);
%mesh(H);