clc
close all
warning off all

%   LECTURA DE LA IMAGEN
Imagen = imread('peppers.png');
Imagen = rgb2gray(Imagen);

min=256;
max=0;

%   CLASIFICACIÓN Y PREDICCIÓN
[Filas, Columnas] = size(Imagen);
Imagen_Generada = zeros(Filas, Columnas, 'uint8'); % asegurarse de que la imagen generada tenga el mismo tipo de datos que la imagen original

for i = 1: Filas
    Imagen_Generada(i, 1) = Imagen(i, 1);
end

for j = 1: Columnas
    Imagen_Generada(1, j) = Imagen(1, j);
end

for i = 2: Filas-1
    for j = 2: Columnas-1
        if ((i < Filas) && (j < Columnas))
            b1 = double(double((Imagen_Generada(i - 1, j - 1)) + double(Imagen_Generada(i - 1, j)) + double(Imagen_Generada(i - 1, j + 1)) + double(Imagen_Generada(i, j - 1)) + double(Imagen_Generada(i + 1, j - 1))) / 5);
            b1=int64(b1);
            b2 = double((Imagen_Generada(i - 1, j) + Imagen_Generada(i - 1, j + 1) + double(b1)) / 3);  
            b2=int64(b2);
            b3 = double((Imagen_Generada(i, j - 1) + Imagen_Generada(i + 1, j - 1) + double(b1) + double(b2)) / 4); %[Imagen_Generada(i + 1, j - 1)]
            b3=int64(b3);
            b4 = double((int64(b1) + double(b2) + double(b3)) / 3);
            b4=int64(b4);
            Imagen_Generada(i, j) = b1;
            Imagen_Generada(i, j + 1) = b2;
            Imagen_Generada(i + 1, j) = b3;
            Imagen_Generada(i + 1, j + 1) = b4;
        end
        %j = j + 1;
    end
     %i = i + 1;
end

Imagen_Restada = (double(Imagen) - double(Imagen_Generada)); % convertir ambas imágenes a tipo de datos double para evitar problemas de truncamiento
Imagen_Res_visualizer = Imagen_Restada;
for i = 1: Filas
    for j = 1: Columnas
        if Imagen_Res_visualizer(i, j) < 0
           Imagen_Res_visualizer(i, j) = Imagen_Restada(i,j)+ 128;
        end
    end
end

%   GENERACIÓN DE LA MATRIZ DE ERROR CUANTIFICADA (MEQ)
Respuesta = input('Bits a reducir: ');

for i = 1: Filas
    for j = 1: Columnas
        if min > Imagen_Restada(i, j)
            min = Imagen_Restada(i, j);
        end
        if max < Imagen_Restada(i, j)
            max = Imagen_Restada(i, j); 
        end
    end
end

Intervalos = double(double(max - min) / power(2, Respuesta)); % [Respuesta]
aux = zeros(Intervalos * power(2, Respuesta), 1);

% for i = 1: Respuesta
%     aux(i) = double(double(Intervalos * double(i)) + double(min));
% end

for i = 1: power(2, Respuesta)
    aux(i) = double(double(i * Intervalos));
end


%   GENERACIÓN DE LA MATRIZ DE ERROR CUANTIFICADA INVERSA (MEQ e-1)
MEQ = zeros(Filas, Columnas);
MEQ_1 = zeros(Filas, Columnas);

for i = 1: Filas
    for j = 1: Columnas
        for a = 1: power(2, Respuesta)  %[--]
            if (Imagen_Restada(i, j) < aux(1))
                MEQ(i, j) = 1;
            elseif (Imagen_Restada(i, j) > aux(a)) && (Imagen_Restada(i, j) <= aux(a + 1))
                MEQ(i, j) = a + 1;
            end 
        end

        for a = 1: power(2, Respuesta)
            if MEQ(i, j) == 1
                MEQ_1(i, j) = double(aux(1) / 2);
            elseif (MEQ(i, j) == a && MEQ(i, j) ~= 1)
                MEQ_1(i, j) = double( (aux(a) + aux(a - 1)) / 2 );
            end  
        end
    end
end
MatRec = MEQ_1 + MEQ;
Imagen_Nueva = uint64(MEQ_1) + uint64(Imagen_Generada);

figure(1)
subplot(2,3,1)
imshow(Imagen);
title('Imagen en grises')
subplot(2,3,2)
imshow(uint8(Imagen_Generada));
title('Imagen generada (P)')
subplot(2,3,3)
imshow(Imagen_Restada);
title('Imagen original - Imagen P')
subplot(2,3,4)
imshow(uint8(MatRec));
title('MEQ_1 + MEQ')
subplot(2,3,6)
imshow(uint8(Imagen_Nueva));
title('MEQ_1 + Imagen P')