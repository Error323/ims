%% 1. Read and Display an Image
clear;
close all;

I = imread('../lab2/img/nemo1_bp.png');
%I = imread('rice.png');
figure;
imshow(I);

%% 2. Estimate the Value of Background Pixels
background = imopen(I,strel('disk',40));
figure;
imshow(background);

%% 3. View the Background Approximation as a Surface
figure;
surf(double(background(1:8:end,1:8:end))),zlim([0 255]);
set(gca,'ydir','reverse');

%% 4. Create an Image with a Uniform Background
I2 = imsubtract(I,background); 
figure;
imshow(I2);

%% 5. Adjust the Contrast in the Processed Image
I3 = imadjust(I2);
figure;
imshow(I3);

%% 6. Create a Binary Version of the Image
level = graythresh(I3);
level = 0.95;
bw = im2bw(I3,level); 
figure;
imshow(bw);

%% 7. Determine the Number of Objects in the Image
[labeled, numObjects] = bwlabel(bw,4);

numObjects

%% 8. Examine the Label Matrix
figure;
imshow(labeled, []);

%% 9. Display the Label Matrix as a Pseudocolor Indexed Image
pseudo_color = label2rgb(labeled, @spring, 'c', 'shuffle');
figure;
imshow(pseudo_color); 

%% 10. Measure Object Properties in the Image
graindata = regionprops(labeled,'basic')

%% 11. Compute Statistical Properties of Objects in the Image
maxarea = max([graindata.Area])

biggrain = find([graindata.Area]==maxarea)

mean([graindata.Area])

figure;
hist([graindata.Area],20)

%% Wait and close after
waitforbuttonpress;
close all;
