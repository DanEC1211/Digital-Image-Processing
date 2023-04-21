clc
clear all
close all
warning off all

%lectura de la imagen
 img=imread('banderaReal.png');
 dato=imref2d(size(img));
 puntos=input('¿Cuantos representantes por cada clase deseea?');
 num_clases = input('Ingrese el numero de clases:');
 puntos=puntos*num_clases;
 aux=img;
 %generando los números aleatorios
 matrix=[];
 [n,m] = size(img);
 cx=randi([1,(m/3)],1,puntos);
 cy=randi([1,n],1,puntos);
  %     graficando sobre la imagen:
  figure(1)
    imshow(img);  
 for a=1:puntos
    matx = impixel(img, cx(a), cy(a));
    matrix=cat(1,matrix,matx);
 end
 [idx, rep_clase] = kmeans(double(matrix), num_clases);
 colores=[0,0,0;0,0,1;0,1,0;0,1,1;1,0,0;1,0,1;1,1,0;1,1,1];
 hold on
 grid on
 for a=1:puntos
    switch idx(a)
        case 1
            colour=colores(1,:);
        case 2
            colour=colores(2,:);
        case 3
            colour=colores(3,:);
        case 4
            colour=colores(4,:);
        case 5
            colour=colores(5,:);
        case 6
            colour=colores(6,:);
    end
    plot(cx(a),cy(a),'o','Markersize',5,'Color',colour)
 end

for l = 1:num_clases
   Y = fprintf("Clase %i %f %f %f \n", l, rep_clase(l, 1), rep_clase(l, 2), rep_clase(l, 3));
end

while 1  
    disp('Punto de referencia')
    figure(2);
    Coordenada = impixel(aux)
    while(size(Coordenada, 1) ~= 1)
        disp('Ingrese un único punto')
        Coordenada = impixel(aux)
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
        auxi=[rep_clase; Coordenada];
    figure(3);
    hold on
    grid on
    etiquetas = cell(num_clases+1,1);
    for a = 1:(num_clases+1)
        plot3(auxi(a,1),auxi(a,2),auxi(a,3), 'o','Color',colores(a,:),'MarkerSize',10,'MarkerFaceColor','auto');
        if a == (num_clases+1)
            etiquetas{a} = sprintf('Punto');
        else
            etiquetas{a} = sprintf('Clase (%i)',a);
        end
    end
    legend(etiquetas);
    title('Practica 4');
    xlabel('Red');
    ylabel('Green');
    zlabel('Blue');

    res = input('¿Desea ingresar otro punto de referencia? [1: si, 0: no] ');
    
    if res == 0
        break
    end
    
    clc
end
disp("Fin del programa")