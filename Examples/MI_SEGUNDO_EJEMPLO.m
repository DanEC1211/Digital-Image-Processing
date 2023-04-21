clc
clear all
close all
warning off all

%procesando imagenes con su histograma


a=imread('C:\Users\JFST\OneDrive\Escritorio\codecs_matlab\obj1_1.jpg');
figure(1)
imshow(a)

roja=a;
roja(:,:,1);
roja(:,:,2)=0;
roja(:,:,3)=0;

verde=a;
verde(:,:,1)=0;
verde(:,:,2);
verde(:,:,3)=0;

azul=a;
azul(:,:,1)=0;
azul(:,:,2)=0;
azul(:,:,3);

yy=verde+azul;
figure(2)
subplot(2,3,1)
imshow(roja(:,:,1))
subplot(2,3,2)
imshow(verde(:,:,2))
subplot(2,3,3)
imshow(azul(:,:,3))
subplot(2,3,4)
imshow(yy)

figure(3)
b=rgb2gray(a);
imshow(a)
figure(4)
impixel(a)




disp('fin de PROCESO.....')