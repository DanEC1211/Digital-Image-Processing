clc
clear all
img = imread("montaña324.jpg");
img = rgb2gray(img);
[filas, columnas] = size(img);

dct_matrix= dct2(img);

limX = (filas/9)-1;
limY = (columnas/9)-1;

matrix_9px = zeros(9,9);
DC = zeros(36,36);

for IteradorFilas = 0: limX
    for IteradorColumnas = 0:3
        DC(IteradorFilas+1,(IteradorColumnas*9)+1) = dct_matrix(((IteradorFilas*9)+1),((IteradorColumnas)*81)+1);
    end
end
for IteradorFilas = 0: 3
    for IteradorColumnas = 0:limY
        DC((IteradorFilas*9)+1,(IteradorColumnas)+1) = dct_matrix(((IteradorFilas*81)+1),((IteradorColumnas)*9)+1);
    end
end

DC = predecir(DC);

%Segundo predictor
P2 = zeros(36,324);

for IteradorFilas = 1:9:limX
        P2(IteradorFilas,:) = dct_matrix(((IteradorFilas)),:);
end
for IteradorColumnas = 1:9:columnas
    P2(:, IteradorColumnas) = dct_matrix(1:36,IteradorColumnas);
end
P2 = predecir(P2);

%tercer predictor
P3 = zeros(288,36);

for IteradorFilas = 1:9:limX
        P3(:,IteradorFilas) = dct_matrix(37:324, IteradorFilas);
end
for IteradorColumnas = 1:9:(filas-36)
    P3(IteradorColumnas,:) = dct_matrix(IteradorColumnas,1:36);
end
P3 = predecir(P3);
%Predictor cuatro
P4 = zeros(288,288);
Imagen_final = zeros(filas,columnas);
Imagen_final(1:36,:) = P2;
Imagen_final(37:filas, 1:36) = P3;
for IteradorFilas = 0: limX
    for IteradorColumnas = 0:3
         Imagen_final(((IteradorFilas*9)+1),((IteradorColumnas)*81)+1) = DC(IteradorFilas+1,(IteradorColumnas)+1);
    end
end
for IteradorFilas = 0: 3
    for IteradorColumnas = 0:limY
       Imagen_final(((IteradorFilas*81)+1),((IteradorColumnas)*9)+1)= DC((IteradorFilas)+1,(IteradorColumnas)+1);
    end
end
for IteradorFilas = 1:9:limX
        P3(:,IteradorFilas) = dct_matrix(37:324, IteradorFilas);
end
for IteradorColumnas = 1:9:(filas-36)
    P3(IteradorColumnas,:) = dct_matrix(IteradorColumnas,1:36);
end



% Imagen_final = idct2(Imagen_final);
% Imagen_final = rescale(Imagen_final);

figure()
imshow(Imagen_final);


function mat = predecir(Imagen_Generada)
    [Filas,Columnas]=size(Imagen_Generada);
    i = 2;
    j = 2;
    for Filas_Interior = 9: 9: Filas
        for Iterador_Columnas = 9: 9: Columnas
            i = 2 + Filas_Interior - 9 ;
            for i = i: 2: Filas_Interior
                j = 2 + Iterador_Columnas - 9;
                for j = j: 2: Iterador_Columnas
            
                    if ((i < Filas_Interior) && (j < Iterador_Columnas))
                        b1 = double(double((Imagen_Generada(i - 1, j - 1)) + double(Imagen_Generada(i - 1, j)) + double(Imagen_Generada(i - 1, j + 1)) + double(Imagen_Generada(i, j - 1)) + double(Imagen_Generada(i + 1, j - 1))) / 5);
                        b2 = double((Imagen_Generada(i - 1, j) + Imagen_Generada(i - 1, j + 1) + int64(b1)) / 3);   
                        b3 = double((Imagen_Generada(i, j - 1) + Imagen_Generada(i + 1, j - 1) + int64(b1) + int64(b2)) / 4); %[Imagen_Generada(i + 1, j - 1)]
                        b4 = double((int64(b1) + int64(b2) + int64(b3)) / 3);
                        
                        Imagen_Generada(i, j) = int64(b1);
                        Imagen_Generada(i, j + 1) = int64(b2);
                        Imagen_Generada(i + 1, j) = int64(b3);
                        Imagen_Generada(i + 1, j + 1) = int64(b4);
                    end
                end
            end
        end
    end
    mat = Imagen_Generada;
end
