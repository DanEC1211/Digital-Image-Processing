%   Inicio del programa
clc
warning off all

%   Ingresando datos
Imagen = imread("playa.jpg");
NumeroClases = input('Ingresa el número de clases: ');
NumeroRepresentantes = input('Ingresa el número de representantes por clase: ');
Matriz = [];
i = 1;

disp("Creación de clases")
while i ~= (NumeroClases + 1)
    v = sprintf("Clase %d", i);
    disp(v)

    Clase = impixel(Imagen);

    RepresentantesPorClase = size(Clase, 1);

    if RepresentantesPorClase == NumeroRepresentantes
        if i == 1
            Matriz = Clase;
        else
            Matriz = cat(3, Matriz, Clase);
        end

        i = i + 1;
    else
        u = sprintf("Número de representantes distinto de %i", NumeroRepresentantes);
        disp(u)
        
    end
end
res=1;

while 1  
    disp('Punto de referencia')
    
    Coordenada = impixel(Imagen)

    while(size(Coordenada, 1) ~= 1)
        disp('Ingrese un único punto')
        Coordenada = impixel(Imagen)
    end

    
    %   Promediando las clases en un vector
    Matriz_Promedio = [];
    for j = 1:NumeroClases
    
        if size(Matriz(:, :, j), 1) ~= 1
            Matriz_Promedio(:,: , j) = mean(Matriz(:,: , j));
        
        else
            Matriz_Promedio(:, :, j) = Matriz(:, :, j);
        end
    end
    
    %   Obteniendo la distancia entre la coordenada y el promedio de las clases
    Distancias = [];
    k = 1;
    while k ~= (NumeroClases + 1)
        Distancias(:, :, k) = sqrt(  power(Coordenada(:, 1:1) - Matriz_Promedio(:, 1:1, k), 2) + power(Coordenada(:, 2:2) - Matriz_Promedio(:, 2:2, k), 2) + power(Coordenada(:, 3:3) - Matriz_Promedio(:, 3:3, k), 2));
        k = k + 1;
    end
    
    for u = 1:NumeroClases
        Y = fprintf("Distancia %i %f", u, Distancias(:, :, u));
        disp(Y)
    end
    
    %   Escogiendo el punto más cercano
    [Valor_Minimo, Posicion] = min(Distancias);
    X = sprintf("El valor más cercano es %f, clase %i", Valor_Minimo, Posicion);
    disp(X)
    
    res = input('¿Desea ingresar otro punto de referencia? [1: si, 2: no] ');
    
    if res == 0
        break
    end
    
    clc
    
    
end

disp("Fin del programa")
