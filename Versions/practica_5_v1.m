% Leer la imagen
imagen = imread('fondo2.jpg');

% Extraer las componentes de la imagen RGB
rojo = imagen(:,:,1);
verde = imagen(:,:,2);
azul = imagen(:,:,3);

% Pedir al usuario los valores mínimo y máximo de píxel para la compresión/expansión
prompt = {'Ingrese el valor mínimo de píxel para la compresión/expansión: ', ...
          'Ingrese el valor máximo de píxel para la compresión/expansión: '};
dlgtitle = 'Valores de compresión/expansión';
dims = [1 35];
valores = inputdlg(prompt,dlgtitle,dims)

min_pixel = uint8(str2double(valores{1}));
max_pixel = uint8(str2double(valores{2}));
%Sacando minimos y maximos por capa
maxorR=0;
minorR=255;
maxorG=0;
minorG=255;
maxorB=0;
minorB=255;

for i = 1:size(imagen,1)
    for j = 1:size(imagen,2)
        if rojo(i,j)< minorR
            minorR= rojo(i,j);
        end
        if verde(i,j)< minorG
            minorG= verde(i,j);
        end
        if azul(i,j)< minorB
            minorB= azul(i,j);
        end

        if rojo(i,j)> maxorR
            maxorR= rojo(i,j);
        end

        if verde(i,j)> maxorG
            maxorG= verde(i,j);
        end

        if azul(i,j)> maxorB
            maxorB= azul(i,j);
        end

    end
end

imgR=zeros(size(imagen,1), size(imagen,2));
imgG=zeros(size(imagen,1), size(imagen,2));
imgB=zeros(size(imagen,1), size(imagen,2));
% Comprimir o expandir el histograma de cada componente
denR=double(double(maxorR)-double(minorR));
denG=double(double(maxorG)-double(minorG));
denB=double(double(maxorB)-double(minorB));
k=double(double(max_pixel)-double(min_pixel));
for i = 1:size(imagen,1)
    for j = 1:size(imagen,2)
        a=double(rojo(i,j));
        imgR(i,j) = (((a-double(minorR))/denR)*(k))+double(min_pixel);
        b=double(verde(i,j));
        imgG(i,j) = (((b-double(minorG))/denG)*(k))+double(min_pixel);
        c=double(azul(i,j));
        imgB(i,j) = (((c-double(minorB))/denB)*(k))+double(min_pixel);
    end
end

% Unir las componentes de la imagen RGB
imagen_comp_exp = cat(3, uint8(imgR), uint8(imgG), uint8(imgB));

% Mostrar la imagen original y la imagen con el histograma comprimido/expandido
subplot(2,1,1)
imshow(imagen)
title('Imagen original')
subplot(2,1,2)
imshow(imagen_comp_exp)
title(sprintf('Imagen con histograma comprimido/expandido de %d a %d', min_pixel, max_pixel))

% Mostrar los histogramas de cada componente de la imagen original y la imagen con el histograma comprimido/expandido
figure
subplot(2,3,1)
imhist(imagen(:,:,1))
title('Histograma del canal rojo (original)')
subplot(2,3,2)
imhist(imagen(:,:,2))
title('Histograma del canal verde (original)')
subplot(2,3,3)
imhist(imagen(:,:,3))
title('Histograma del canal azul (original)')
subplot(2,3,4)
imhist(imagen_comp_exp(:,:,1))
title(sprintf('Histograma del canal rojo\ncon histograma comprimido/expandido de %d a %d', min_pixel, max_pixel))
subplot(2,3,5)
imhist(imagen_comp_exp(:,:,2))
title(sprintf('Histograma del canal verde\ncon histograma comprimido/expandido de %d a %d', min_pixel, max_pixel))
subplot(2,3,6)
imhist(imagen_comp_exp(:,:,3))
title(sprintf('Histograma del canal azul\ncon histograma comprimido/expandido de %d a %d', min_pixel, max_pixel))