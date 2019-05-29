clear all; clc;
Image = imread('J069_089.tif');
R=Image(:,:,1); G=Image(:,:,2); B=Image(:,:,3);

Gray=rgb2gray(Image);

R=Image(:,:,1); G=Image(:,:,2); B=Image(:,:,3);

diff_R=0; diff_G=20; diff_B=0;  % ���ú졢�̡���������ɫ��ȡ��ֵ��Խ��Խ�ϸ�

Image_G=Image;

GP_R=Image(:,:,1); GP_G=Image(:,:,2); GP_B=Image(:,:,3);

XYG=~((G-R)>diff_G&(G-B)>diff_G);  % ��ȡ��ɫ������G������R��B������ֵ�����趨

Mask=Gray(XYG);  % ����Ƭ��Ĥ

GP_R(XYG)=Mask; GP_G(XYG)=Mask; GP_B(XYG)=Mask;  % ʹ�÷���ɫ�����Ϊ��ɫ

Image_G(:,:,1)=GP_R; Image_G(:,:,2)=GP_G; Image_G(:,:,3)=GP_B;


imshow(Image_G(:,:,1) );

