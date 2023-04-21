img = imread("peppers.png" );
imshow(img);
display('Ingrese los puntos');
rgb = impixel(img);

% Utiliza la función kmeans() para separar las clases en grupos en función de su similitud en términos de R, G y B
num_clases = uint8(input('Ingrese el numero de clases:'));
[idx, rep_clase] = kmeans(double(rgb), num_clases);

for l = 1:num_clases
   Y = fprintf("Clase %i %f %f %f \n", l, rep_clase(l, 1), rep_clase(l, 2), rep_clase(l, 3));
end

while 1  
    disp('Punto de referencia')
    
    Coordenada = impixel(img)

    while(size(Coordenada, 1) ~= 1)
        disp('Ingrese un único punto')
        Coordenada = impixel(img)
    end
    
    %   Obteniendo la distancia entre la coordenada y el promedio de las clases
    Distancias = [];
    k = 1;
    while k ~= (num_clases + 1)
        Distancias(:, :, k) = sqrt(  power(Coordenada(:, 1) - rep_clase(k, 1), 2) + power(Coordenada(:, 2) - rep_clase(k, 2), 2) + power(Coordenada(:, 3) - rep_clase(k, 3), 2));
        k = k + 1;
    end
    
    for u = 1:num_clases
        Y = fprintf("Distancia %i %f", u, Distancias(:, :, u));
        disp(Y)
    end
    
    %   Escogiendo el punto más cercano
    [Valor_Minimo, Posicion] = min(Distancias);
    X = sprintf("El valor más cercano es %f, clase %i", Valor_Minimo, Posicion);
    disp(X)
    %
    
    
    auxi=[rep_clase; Coordenada];
    fh=figure(2);
    hold on
    grid on
    colors = [0,0,0;0,0,1;0,1,0;0,1,1;1,0,0;1,0,1;1,1,0;1,1,1]
    for a = 1:(num_clases+1)
        
    plot3(auxi(a,1),auxi(a,2),auxi(a,3), 'o','Color',colors(a,:),'MarkerSize',10,'MarkerFaceColor','auto');
    end
    xlabel('Red');
    ylabel('Green');
    zlabel('Blue');

    %
    res = input('¿Desea ingresar otro punto de referencia? [1: si, 0: no] ');
    
    if res == 0
        break
    end
  
end
disp("Fin del programa")
