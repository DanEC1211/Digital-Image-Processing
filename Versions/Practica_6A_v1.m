close all
clear all
clc

%   INGRESANDO DATOS INICIALES
Imagen = imread("sandia.jpg");
disp("PRACTICA 6")
Gmax = input('Valor máximo: ');
Gmin = input('Valor mínimo: ');

NgR = zeros(Gmax - Gmin, 1);
NgG = zeros(Gmax - Gmin, 1);
NgB = zeros(Gmax - Gmin, 1);

%   ECUALIZACIÓN DEL HISTOGRAMA
TamanioImagen = size(Imagen);
GuardarRGBTotal = zeros(3, 1);

y = 1;
for x = Gmin: Gmax - 1
        GuardarRGBTotal = sum(sum(eq(Imagen, x)));

        NgR(y) = GuardarRGBTotal(1, 1);
        NgG(y) = GuardarRGBTotal(1, 2);
        NgB(y) = GuardarRGBTotal(1, 3);
        y = y + 1;
end

TotalR = sum(NgR);
TotalG = sum(NgG);
TotalB = sum(NgB);

PR = zeros(Gmax - Gmin, 1);
PG = zeros(Gmax - Gmin, 1);
PB = zeros(Gmax - Gmin, 1);

y = 1;
for x = Gmin: Gmax - 1
        PR(y) = NgR(y) / TotalR;
        PG(y) = NgG(y) / TotalG;
        PB(y) = NgB(y) / TotalB;
        y = y + 1;
end

PacumR = zeros((Gmax - Gmin), 1);
PacumG = zeros((Gmax - Gmin), 1);
PacumB = zeros((Gmax - Gmin), 1);

y = 0;
for x = Gmin: Gmax - 1
        y = y + 1;
        if y == 1
            PacumR(y) = PacumR(y) + PR(y);
            PacumG(y) = PacumG(y) + PG(y);
            PacumB(y) = PacumB(y) + PB(y);
        else
            PacumR(y) = PacumR(y - 1) + PR(y);
            PacumG(y) = PacumG(y - 1) + PG(y);
            PacumB(y) = PacumB(y - 1) + PB(y);
        end

end

FR = zeros(Gmax - Gmin, 1);
FG = zeros(Gmax - Gmin, 1);
FB = zeros(Gmax - Gmin, 1);

y = 1;
for x = Gmin: Gmax - 1
        FR(y) = (Gmax - Gmin) * (PacumR(y)) + Gmin;
        FG(y) = (Gmax - Gmin) * (PacumG(y)) + Gmin;
        FB(y) = (Gmax - Gmin) * (PacumB(y)) + Gmin;
        y = y + 1;
end

%   REEMPLAZANDO LOS DATOS: GENERANDO LA ECUALIZACIÓN
a = 1;
FR = ceil(FR);
FG = ceil(FG);
FB = ceil(FB);
NuevaImagen = Imagen;
for x = Gmin: Gmax - 1
    for y = 1: TamanioImagen(1, 1)
        for z = 1: TamanioImagen(1, 2)
            if Imagen(y, z, 1) == x
                NuevaImagen(y, z, 1) = FR(a);
                % Texto = fprintf("%i, %i, %i", y, z, Imagen(y, z, 1));
                % disp(Texto)
            end

            if Imagen(y, z, 2) == x
                NuevaImagen(y, z, 2) = FG(a);
                % Texto = fprintf("%i, %i, %i", y, z, Imagen(y, z, 2));
                % disp(Texto)
            end

            if Imagen(y, z, 3) == x
                NuevaImagen(y, z, 3) = FB(a);
                % Texto = fprintf("%i, %i, %i", y, z, Imagen(y, z, 3));
                % disp(Texto)
            end
        end
    end
    a = a + 1;
end

figure(1)
subplot(2,2,1)
imshow(Imagen)
title('Imagen normal')
subplot(2,2,2)
imhist(Imagen(:,:,1))
title('Capa R')
subplot(2,2,3)
imhist(Imagen(:,:,2))
title('Capa G')
subplot(2,2,4)
imhist(Imagen(:,:,3))
title('Capa B')

figure(2)
subplot(1,2,1)
imshow(Imagen)
title('Imagen normal')
subplot(1,2,2)
imshow(NuevaImagen)
title('Imagen ecualizada')


figure(3)
subplot(2,2,1)
imshow(NuevaImagen)
title('Imagen ecualizada')
subplot(2,2,2)
imhist(NuevaImagen(:,:,1))
title('Capa R')
subplot(2,2,3)
imhist(NuevaImagen(:,:,2))
title('Capa G')
subplot(2,2,4)
imhist(NuevaImagen(:,:,3))
title('Capa B')
