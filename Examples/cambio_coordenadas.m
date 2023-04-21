clc
clear all
close all
warning off all

%lectura de la imagen
 h=imread('obj1_1.jpg');

 figure(1)
 [m,n]=size(h);
 imshow(h)

 figure(2)
 dato=imref2d(size(h));
 imshow(h,dato)

 %generando las clases con los números aleatorios

 c1x=randi([1,710],1,100);
 c1y=randi([1,150],1,100);

 c2x=randi([150,710],1,100);
 c2y=randi([300,450],1,100);

 c3x=randi([200,600],1,100);
 c3y=randi([200,300],1,100);
 
 px=input('dame la coord del punto a clasificar en x=')
 py=input('dame la coord del punto a clasificar en y=')
 vx=[px;py]
 


 

% guardando información  sobre el plano de la plano
z1=impixel(h,c1x(1,:),c1y(1,:));
z2=impixel(h,c2x(1,:),c2y(1,:));
z3=impixel(h,c3x(1,:),c3y(1,:));
z4=impixel(h,vx(1,1),vx(2,1));



%graficando sobre la imagen:
hold on
grid on
plot(c1x(1,:),c1y(1,:),'ob','Markersize',10,'MarkerFaceColor','b')
plot(c2x(1,:),c2y(1,:),'or','Markersize',10,'MarkerFaceColor','k')
plot(c3x(1,:),c3y(1,:),'oy','Markersize',10,'MarkerFaceColor','k')
plot(vx(1,1),vx(2,1),'og','Markersize',10,'MarkerFaceColor','g')
legend('cielo','agua','roca','punto')

disp('fin de proceso...')

















