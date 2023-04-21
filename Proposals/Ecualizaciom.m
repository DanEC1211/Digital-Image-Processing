% Leer la imagen
imagen = imread('ABS.jpg');

% Extraer las componentes de la imagen RGB
rojo = imagen(:,:,1);
verde = imagen(:,:,2);
azul = imagen(:,:,3);

% Pedir al usuario los valores mínimo y máximo de píxel para la compresión/expansión
prompt = {'Ingrese el valor mínimo de píxel para la ecualización: ', ...
          'Ingrese el valor máximo de píxel para la ecualización: '};
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
%Sacando probabilidades

%Capa R
[C,iaR,icR]=unique(rojo);
MprobaR=accumarray(icR,1);
[filasR, col]=size(MprobaR);
ProbAcumR=MprobaR(1);
for i=2:filasR
    ProbAcumR(i)=ProbAcumR(i-1)+MprobaR(i);
end
ProbAcumR=ProbAcumR';






















