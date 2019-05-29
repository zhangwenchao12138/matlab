clear all; clc;
Image = imread('J069_089.tif');
R=Image(:,:,1); G=Image(:,:,2); B=Image(:,:,3);

Gray=rgb2gray(Image);

R=Image(:,:,1); G=Image(:,:,2); B=Image(:,:,3);

diff_R=0; diff_G=20; diff_B=0;  % 设置红、绿、蓝三种颜色提取阈值（越大越严格）

Image_G=Image;

GP_R=Image(:,:,1); GP_G=Image(:,:,2); GP_B=Image(:,:,3);

XYG=~((G-R)>diff_G&(G-B)>diff_G);  % 提取绿色条件是G分量与R、B分量差值大于设定

Mask=Gray(XYG);  % 灰照片掩膜

GP_R(XYG)=Mask; GP_G(XYG)=Mask; GP_B(XYG)=Mask;  % 使得非绿色区域变为灰色

Image_G(:,:,1)=GP_R; Image_G(:,:,2)=GP_G; Image_G(:,:,3)=GP_B;


imshow(Image_G(:,:,1) );

