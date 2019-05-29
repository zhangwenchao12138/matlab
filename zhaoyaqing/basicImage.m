clear all; clc;

Image = imread('J069_089.tif');

imageR = Image(:,:,1); 
imageG = Image(:,:,2); 
imageB = Image(:,:,3);   %��3��RGB��ͼ

Gray=rgb2gray(Image);       %ת��Ϊ�Ҷ�ͼ

diff_R=0; diff_G=20; diff_B=0;  % ���ú졢�̡���������ɫ��ȡ��ֵ

ImageGreen = Image;

GP_R = Image(:,:,1); 
GP_G = Image(:,:,2); 
GP_B = Image(:,:,3);

XYG = ~((imageG-imageR)>diff_G&(imageG-imageB)>diff_G);  % ��ȡ��ɫ������G������R��B������ֵ�����趨

MaskGray=Gray(XYG);  % ����Ƭ��Ĥ

GP_R(XYG)=MaskGray; 
GP_G(XYG)=MaskGray; 
GP_B(XYG)=MaskGray;  % ʹ�÷���ɫ�����Ϊ��ɫ

ImageGreen(:,:,1)=GP_R; 
ImageGreen(:,:,2)=GP_G; 
ImageGreen(:,:,3)=GP_B;


imshow(ImageGreen);

