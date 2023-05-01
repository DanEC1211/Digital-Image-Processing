close all
warning off all

while(1)
    clc
    clear all
    disp("PRACTICA 7");
    %   LECTURA DE LA IMAGEN
    Imagen = imread('Imagen_sandia_3.jpg');
    Imagen = rgb2gray(Imagen);
    %Imagen=[1,2,3;4,5,6;7,8,9];
    % figure(1)
    % imshow(Imagen);
    % title('Imagen en grises')
    min=256;
    max=0;
    
    %   CLASIFICACIÓN Y PREDICCIÓN
    [Filas, Columnas] = size(Imagen);
    Imagen_Generada = zeros(Filas, Columnas);
    
    for IteradorFilas = 1: 9: Filas
        Imagen_Generada(IteradorFilas, :) = Imagen(IteradorFilas, :);
    end
    
    for IteradorColumnas = 1: 9: Columnas
        Imagen_Generada(:, IteradorColumnas) = Imagen(:, IteradorColumnas);
    end
    
    i = 2;
    j = 2;
    for Filas_Interior = 9: 9: Filas
        for Iterador_Columnas = 9: 9: Columnas
            i = 2 + Filas_Interior - 9;
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
    
    % figure(2)
    % imshow(uint8(Imagen_Generada));
    % title('Imagen generada (P)')
    Imagen_Restada = (double(Imagen) - Imagen_Generada);
    Imagen_Mostrar = Imagen_Restada;
    
    for i = 1: Filas
        for j = 1: Columnas
            if Imagen_Mostrar(i, j) < 0
               Imagen_Mostrar(i, j) = 128;
            end
        end
    end
    
    % figure(3)
    % imshow(Imagen_Mostrar);
    % title('Imagen original - Imagen P')
    
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
    
    Imagen_Nueva = uint64(MEQ_1) + uint64(Imagen_Generada);
    % figure(4)
    % imshow(uint8(Imagen_Nueva));
    % title('MEQ_1 + Imagen P')
    
    SumaImagen = sum(double(Imagen));
    SumaImagen_Restada = sum(double(Imagen) - Imagen_Generada);
    
    SN = double(10 * log10( power(SumaImagen, 2) / power(SumaImagen_Restada, 2) ));
    
    x = sprintf("Valor de S / N: %f", SN);
    disp(x);
    
    figure(1)
    subplot(2,2,1)
    imshow(Imagen)
    title('Imagen original en grises')
    subplot(2,2,2)
    imshow(uint8(Imagen_Generada));
    title('Imagen generada: P')
    subplot(2,2,3)
    imshow(Imagen_Mostrar);
    title('Imagen restada: Imagen original - Imagen P')
    subplot(2,2,4)
    imshow(uint8(Imagen_Nueva));
    title('Imagen final: MEQ_1 + Imagen P')

    disp("Terminar");
    disp("[1]: Si, cerrar todo");
    disp("[0]: No, repetir");
    Terminar = input('Respuesta: ');

    if Terminar == 1
        break
    end
end

