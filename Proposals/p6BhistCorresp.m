clc
clear all
close all
warning off all
%lectura de la imagen
img=imread('azul.jpg');
imgtwo=imread('fondo2.jpg');
[m,n]=size(rgb2gray(imgtwo));
imgR=img(:,:,1);
imgG=img(:,:,2);
imgB=img(:,:,3);

imgtwoR=imgtwo(:,:,1);
imgtwoG=imgtwo(:,:,2);
imgtwoB=imgtwo(:,:,3);

%trabajando imagen 1 
%Capa R
[C,iaR,icR]=unique(imgR);
MprobaR=accumarray(icR,1);
[filasR, col]=size(MprobaR);
ProbAcumR=MprobaR(1);
for i=2:filasR
    ProbAcumR(i)=ProbAcumR(i-1)+MprobaR(i);
end
ProbAcumR=ProbAcumR';
tablaR=int64([int64(imgR(iaR)),MprobaR,ProbAcumR]);


%trabajando imagen 2
[DR,ia2R,ic2R]=unique(imgtwoR);
Mproba2R=accumarray(ic2R,1);
[filas2R, col]=size(Mproba2R);
ProbAcum2R=Mproba2R(1);
for i=2:filas2R
    ProbAcum2R(i)=ProbAcum2R(i-1)+Mproba2R(i);
end
ProbAcum2R=ProbAcum2R';
tabla2R=int64([int64(imgtwoR(ia2R)),Mproba2R,ProbAcum2R]);

dis1=100000;
dis2=100000;
imgfinalR=zeros(m,n);
for i=1:m
    dis1=100000;
    dis2=100000;
  for j=1:n
    pixel=imgtwoR(i,j);
    [a,b]=find(tabla2R(:,1)==pixel);
    ProbBuscar=tabla2R(a,3);
    k=1;
    for k=1:filasR
        if tablaR(k,3) == ProbBuscar
            break;
        elseif  tablaR(k,3) < ProbBuscar
            dis1=abs(tablaR(k,3)-ProbBuscar);
            menor=k;
        else
            dis2=abs(tablaR(k,3)-ProbBuscar);
            mayor=k;
            break;
        end
    end
    if dis1 < dis2
    k=menor;
    else
       k=mayor;
    end
    imgfinalR(i,j)=k;
  end
end

%Capa G
[C,iaG,icG]=unique(imgG);
MprobaG=accumarray(icG,1);
[filasG, col]=size(MprobaG);
ProbAcumG=MprobaG(1);
for i=2:filasG
    ProbAcumG(i)=ProbAcumG(i-1)+MprobaG(i);
end
ProbAcumG=ProbAcumG';
tablaG=int64([int64(imgG(iaG)),MprobaG,ProbAcumG]);


%trabajando imagen 2
[DR,ia2G,ic2G]=unique(imgtwoG);
Mproba2G=accumarray(ic2G,1);
[filas2G, col]=size(Mproba2G);
ProbAcum2G=Mproba2G(1);
for i=2:filas2G
    ProbAcum2G(i)=ProbAcum2G(i-1)+Mproba2G(i);
end
ProbAcum2G=ProbAcum2G';
tabla2G=int64([int64(imgtwoG(ia2G)),Mproba2G,ProbAcum2G]);

dis1=100000;
dis2=100000;
imgfinalG=zeros(m,n);
for i=1:m
    dis1=100000;
    dis2=100000;
  for j=1:n
    pixel=imgtwoG(i,j);
    [a,b]=find(tabla2G(:,1)==pixel);
    ProbBuscar=tabla2G(a,3);
    k=1;
    for k=1:filasG
        if tablaG(k,3) == ProbBuscar
            break;
        elseif  tablaG(k,3) < ProbBuscar
            dis1=abs(tablaG(k,3)-ProbBuscar);
            menor=k;
        else
            dis2=abs(tablaG(k,3)-ProbBuscar);
            mayor=k;
            break;
        end
    end
    if dis1 < dis2
    k=menor;
    else
       k=mayor;
    end
    imgfinalG(i,j)=k;
  end
end

%Capa B
[C,iaB,icB]=unique(imgB);
MprobaB=accumarray(icB,1);
[filasB, col]=size(MprobaB);
ProbAcumB=MprobaB(1);
for i=2:filasB
    ProbAcumB(i)=ProbAcumB(i-1)+MprobaB(i);
end
ProbAcumB=ProbAcumB';
tablaB=int64([int64(imgB(iaB)),MprobaB,ProbAcumB]);


%trabajando imagen 2
[DB,ia2B,ic2B]=unique(imgtwoB);
Mproba2B=accumarray(ic2B,1);
[filas2B, col]=size(Mproba2B);
ProbAcum2B=Mproba2B(1);
for i=2:filas2B
    ProbAcum2B(i)=ProbAcum2B(i-1)+Mproba2B(i);
end
ProbAcum2B=ProbAcum2B';
tabla2B=int64([int64(imgtwoB(ia2B)),Mproba2B,ProbAcum2B]);

dis1=100000;
dis2=100000;
imgfinalB=zeros(m,n);
for i=1:m
    dis1=100000;
    dis2=100000;
  for j=1:n
    pixel=imgtwoB(i,j);
    [a,b]=find(tabla2B(:,1)==pixel);
    ProbBuscar=tabla2B(a,3);
    k=1;
    for k=1:filasB
        if tablaB(k,3) == ProbBuscar
            break;
        elseif  tablaB(k,3) < ProbBuscar
            dis1=abs(tablaB(k,3)-ProbBuscar);
            menor=k;
        else
            dis2=abs(tablaB(k,3)-ProbBuscar);
            mayor=k;
            break;
        end
    end
    if dis1 < dis2
    k=menor;
    else
       k=mayor;
    end
    imgfinalB(i,j)=k;
  end
end
imgfinal(:,:,1)=uint8(imgfinalR);
imgfinal(:,:,2)=uint8(imgfinalG);
imgfinal(:,:,3)=uint8(imgfinalB);
figure(1);

imshow(imgfinal);
figure(3);
subplot(2,2,1);
imshow(img);
title('Imagen')
subplot(2,2,2)
imhist(img(:,:,1))
title('Capa R')
subplot(2,2,3)
imhist(img(:,:,2))
title('Capa G')
subplot(2,2,4)
imhist(img(:,:,3))
title('Capa B')
figure(4);
subplot(2,2,1);
imshow(imgtwo);
title('Imagen')
subplot(2,2,2)
imhist(imgtwo(:,:,1))
title('Capa R')
subplot(2,2,3)
imhist(imgtwo(:,:,2))
title('Capa G')
subplot(2,2,4)
imhist(imgtwo(:,:,3))
title('Capa B')


figure(2)
subplot(1,3,1)
imhist(imgfinal(:,:,1))
subplot(1,3,2)
imhist(imgfinal(:,:,2))
subplot(1,3,3)
imhist(imgfinal(:,:,3))



