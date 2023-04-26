clc
clear all
img = imread("montaña324.jpg");
img = rgb2gray(img);
[filas, columnas] = size(img);
limX = (filas/9)-1;
limY = (columnas/9)-1;
% 1,9
dct_matrix = zeros(filas, columnas);
matrix_9px = zeros(9,9);
DC = zeros(36,36);

n = 0;
while n < 36
    for i = 1:9
        for j = 1:9
            matrix_9px(i,j) = img(((i*n)+1),((j*n)+1) );
        end
    end
    matrix_aux= double(dct2(double(matrix_9px)));
    for i = 1:9
        for j = 1:9
             dct_matrix(((i*n)+1),((j*n)+1)) =  matrix_aux(i,j);             
        end
    end
    n = n + 1;
end
n=0;
%copiar pixeles cada bloquesito
for IteradorFilas = 0: limX
    for IteradorColumnas = 0:3
        DC(IteradorFilas+1,(IteradorColumnas*9)+1) = img(((IteradorFilas*9)+1),((IteradorColumnas)*81)+1);
    end
end
for IteradorFilas = 0: 3
    for IteradorColumnas = 0:limY
        DC((IteradorFilas*9)+1,(IteradorColumnas)+1) = img(((IteradorFilas*81)+1),((IteradorColumnas)*9)+1);
    end
end
DC = predecir(DC);
% Predictor 2
Matrix_P2 = zeros(36,288);
for IteradorFilas = 0: limX
    for IteradorColumnas = 0:limY
        Matrix_P2(IteradorFilas+1,(IteradorColumnas*9)+1) = img(((IteradorFilas*9)+1),((IteradorColumnas)*9)+1);
    end
end
for IteradorFilas = 0: 8
    for IteradorColumnas = 0:limY
        Matrix_P2((IteradorFilas*9)+1,(IteradorColumnas)+1) = img(((IteradorFilas*9)+1),((IteradorColumnas)*9)+1);
    end
end
%Matrix_P2 = predecir(Matrix_P2);

figure()
imshow(uint8(Matrix_P2));
figure()
imshow(uint8(img));


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


