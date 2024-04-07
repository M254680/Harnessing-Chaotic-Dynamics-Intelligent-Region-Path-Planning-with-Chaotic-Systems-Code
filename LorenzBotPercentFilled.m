%%
clc, close all, clear all

img = imread('ImageAnalysis_BoundedBot1000Sat10pingat1nuRHO28_X&Y.png');
img_gray = rgb2gray(img);
threshold = graythresh(img_gray);
img_bw = imbinarize(img_gray, threshold);

imshow(img_bw);

NotAreaFilled = sum(img_bw(:));
TotPix=size(img_bw,1) * size(img_bw,2);

fprintf('Percent Filled: %4.2f %% \n' , 100*(TotPix-NotAreaFilled)/TotPix);
