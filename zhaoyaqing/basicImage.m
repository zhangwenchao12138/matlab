clear all; clc;

Image = imread('J069_089.tif');

imageR = Image(:,:,1); 
imageG = Image(:,:,2); 
imageB = Image(:,:,3);   %做3张RGB分图

Gray=rgb2gray(Image);       %转化为灰度图

diff_R=0; diff_G=20; diff_B=0;  % 设置红、绿、蓝三种颜色提取阈值

ImageGreen = Image;

GP_R = Image(:,:,1); 
GP_G = Image(:,:,2); 
GP_B = Image(:,:,3);

XYG = ~((imageG-imageR)>diff_G&(imageG-imageB)>diff_G);  % 提取绿色条件是G分量与R、B分量差值大于设定

MaskGray=Gray(XYG);  % 灰照片掩膜

GP_R(XYG)=MaskGray; 
GP_G(XYG)=MaskGray; 
GP_B(XYG)=MaskGray;  % 使得非绿色区域变为灰色

ImageGreen(:,:,1)=GP_R; 
ImageGreen(:,:,2)=GP_G; 
ImageGreen(:,:,3)=GP_B;


imshow(ImageGreen);

