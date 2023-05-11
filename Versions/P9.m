%   PARTE UNO: Funciones principales (ingresar imagen, generando variables importantes)
Imagen = imread('peppers.png');
Cuantificador = ...
[
    16 11 10 16 24  40  51  61;
    12 12 14 19 26  58  60  55;
    14 13 16 24 40  57  69  56;
    14 17 22 29 51  87  80  62;
    18 22 37 56 68  109 103 77;
    24 35 55 64 81  104 113 92;
    49 64 78 87 103 121 120 101;
    72 92 95 98 112 100 103 99
];

Tabla_Uno = table...
( ...
    [0; 1; 2; 3; 4; 5; 6; 7; 8; 9; 10; 11; 12; 13; 14], ... %15
    {'010'; '011'; '100'; '00'; '101';'110';'1110';'11110';'111110';'1111110';'11111110';'111111110';'1111111110';'11111111110';'111111111110'}, ...
    [3; 4; 5; 5; 7; 8; 10; 12; 14; 16; 18; 20; 22; 24; 26], ...
    'VariableNames', ...
    {'Categoria', 'Codigo base', 'Longitud'} ...
);

Categoria =...
[
    1; 2; 3; 4; 5; 6; 7; 8; 9; 10; 
    1; 2; 3; 4; 5; 6; 7; 8; 9; 10; 
    1; 2; 3; 4; 5; 6; 7; 8; 9; 10; 
    1; 2; 3; 4; 5; 6; 7; 8; 9; 10; 
    1; 2; 3; 4; 5; 6; 7; 8; 9; 10
    % 1; 2; 3; 4; 5; 6; 7; 8; 9; 10;
    % 1; 2; 3; 4; 5; 6; 7; 8; 9; 10;
    % 1; 2; 3; 4; 5; 6; 7; 8; 9; 10
];

Tabla_Dos = table...
( ...
    [ ...
        0; 0; 0; 0; 0; 0; 0; 0; 0; 0; ...
        1; 1; 1; 1; 1; 1; 1; 1; 1; 1; ...
        2; 2; 2; 2; 2; 2; 2; 2; 2; 2; ...
        3; 3; 3; 3; 3; 3; 3; 3; 3; 3; ...
        4; 4; 4; 4; 4; 4; 4; 4; 4; 4
        % 5; 5; 5; 5; 5; 5; 5; 5; 5; 5; ...
        % 6; 6; 6; 6; 6; 6; 6; 6; 6; 6; ...
        % 7; 7; 7; 7; 7; 7; 7; 7; 7; 7; 
    ], ...
    Categoria, ...
    { ...
        '00';'01';'100';'1011';'11010';'111000';'1111000';'1111110110';'1111111110000010';'1111111110000011'; ...
        '1100';'111001';'1111001';'111110110';'11111110110';'1111111110000100';'1111111110000101';'1111111110000110';'1111111110000111';'1111111110001000'; ...
        '11011';'11111000';'1111110111';'1111111110001001';'1111111110001010';'1111111110001011';'1111111110001100';'1111111110001101';'1111111110001110';'1111111110001111'; ...
        '111010';'111110111';'11111110111';'1111111110010000';'1111111110010001'; '1111111110010010';'1111111110010011';'1111111110010100';'1111111110010101';'1111111110010110'; ...
        '111011';'1111111000';'1111111110010111';'1111111110011000';'1111111110011001';'1111111110011010';'1111111110011011';'1111111110011100';'1111111110011101'; '1111111110011110';
        % '1111010'; '1111111001'; '1111111110011111'; '1111111110100000'; '1111111110100001'; '1111111110100010'; '1111111110100011'; '1111111110100100'; '1111111110100101'; '1111111110100110';...
        % '1111011'; '11111111000'; '1111111110100111'; '1111111110101000'; '1111111110101001'; '1111111110101010'; '1111111110101011'; '1111111110101100'; '1111111110101101'; '1111111110101110';...
        % '11111001'; '11111111001'; '1111111110101111'; '1111111110110000'; '1111111110110001'; '1111111110110010'; '1111111110110011'; '1111111110110100'; '1111111110110101'; '1111111110110110'; 
    }, ...
    [3; 4; 6; 8; 10; 12; 14; 18; 25; 26; ...
    5; 8; 10; 13; 16; 22; 23; 24; 25; 26; ...
    6; 10; 13; 20; 21; 22; 23; 24; 25; 26; ...
    7; 11; 14; 20; 21; 22; 23; 24; 25; 26; ...
    7; 12; 19; 20; 21; 22; 23; 24; 25; 26],...
    'VariableNames', ...
    {'Run', 'Categoria','Codigo base','Longitud'} ...
);


    % 8; 12; 19; 20; 21; 22; 23; 24; 25; 26; ...
    % 8; 13; 19; 20; 21; 22; 23; 24; 25; 26; ...
    % 9; 13; 19; 20; 21; 22; 23; 24; 25; 26], ...

Imagen_Gris = rgb2gray(Imagen);
[Filas, Columnas] = size(Imagen_Gris);
NumeroFilas = floor(Filas / 8);
NumeroColumnas = floor(Columnas / 8);

Imagen_Gris = Imagen_Gris - 128;


%   PARTE DOS: Aplicando DCT a la imagen
Imagen_DCT = dct2(Imagen_Gris);

figure()
imshow(Imagen_DCT);

%   PARTE TRES: Aplicación de la cuantificación
for i = 1: NumeroFilas
    for j = 1: NumeroColumnas
        Bloque_Imagen = Imagen_DCT( 8*(i - 1) + 1: 8*i, 8*(j - 1) + 1: 8*j);
        Imagen_DCT( 8*(i - 1) + 1: 8*i, 8*(j - 1) + 1: 8*j) = round(Bloque_Imagen ./ Cuantificador);
    end
end


%   PARTE CUATRO: Aplicamos la diagonalización
i = 1;
j = 2;
Diagonalizacion = zeros(1, 64);
Bloque_Imagen = Imagen_DCT(8*(i - 1) + 1: 8*i, 8*(j - 1) + 1: 8*j);
Diagonalizacion(1) = Bloque_Imagen(1,1);

k=2;
i=1;
j=1;
while k < (64)
    while i>=2 && j<8
        i=i - 1;
        j=j+1;
        Diagonalizacion(k) = Bloque_Imagen(i,j);
        k=1 + k;
    end
    if j<8
        j=1+j;
        Diagonalizacion(k) = Bloque_Imagen(i,j);
        k=1+k;
    elseif i<8
        i=1+i;
        Diagonalizacion(k) = Bloque_Imagen(i,j);
        k=1+k;
    end
    while i<8 && j>=2
        i=1+i;
        j=j-1;
        Diagonalizacion(k) = Bloque_Imagen(i,j);
        k=1+k;
    end
    if i<8
        i=1+i;
        Diagonalizacion(k) = Bloque_Imagen(i,j);
        k=1+k;
    elseif j<8
        j=1+j;
        Diagonalizacion(k) = Bloque_Imagen(i,j);
        k=1+k;
    end
end

Valores_Diagonalizacion = Diagonalizacion;

%   PARTE CINCO: Resta de DC
i = 1;
j = 2;
DC_Anterior = 0;

if i == 1
    if j > 1
        DC_Anterior = Imagen_DCT( 8*(i - 1) + 1, 8*(j - 2) + 1);
    end

else
    if j == 1
        DC_Anterior = Imagen_DCT( 8*(i - 2) + 1, 8*(NumeroColumnas - 1) + 1 );
    else
        DC_Anterior = Imagen_DCT( 8*(i - 1) + 1, 8*(j - 2) + 1);
    end
end

NumeroRestado = Diagonalizacion(1) - DC_Anterior;
Categoria = 0;

if NumeroRestado == 0 
    Categoria = 0;
elseif NumeroRestado == -1 || NumeroRestado == 1
    Categoria = 1;
elseif (NumeroRestado >= -3 && NumeroRestado <= -2) || (NumeroRestado >= 2 && NumeroRestado <= 3)
    Categoria = 2;
elseif (NumeroRestado >= -7 && NumeroRestado <= -4) || (NumeroRestado >= 4 && NumeroRestado <= 7)
    Categoria = 3;
elseif (NumeroRestado >= -15 && NumeroRestado <= -8) || (NumeroRestado >= 8 && NumeroRestado <= 15)
    Categoria = 4;
elseif (NumeroRestado >= -31 && NumeroRestado <= -16) || (NumeroRestado >= 16 && NumeroRestado <= 31)
    Categoria = 5;
elseif (NumeroRestado >= -63 && NumeroRestado <= -32) || (NumeroRestado >= 32 && NumeroRestado <= 63)
    Categoria = 6;
elseif (NumeroRestado >= -127 && NumeroRestado <= -64) || (NumeroRestado >= 64 && NumeroRestado <= 127)
    Categoria = 7;
elseif (NumeroRestado >= -255 && NumeroRestado <= -128) || (NumeroRestado >= 128 && NumeroRestado <= 255)
    Categoria = 8;
elseif (NumeroRestado >= -511 && NumeroRestado <= -256) || (NumeroRestado >= 256 && NumeroRestado <= 511)
    Categoria = 9;
elseif  (NumeroRestado >= -1023 && NumeroRestado <= -512) || (NumeroRestado >= 512 && NumeroRestado <= 1023)
    Categoria = 10;
elseif  (NumeroRestado >= -2047 && NumeroRestado <= -1024) || (NumeroRestado >= 1024 && NumeroRestado <= 2047)
    Categoria = 11;
elseif (NumeroRestado >= -4095 && NumeroRestado <= -2048) || (NumeroRestado >= 2048 && NumeroRestado <= 4095)
    Categoria = 12;
elseif (NumeroRestado >= -8191 && NumeroRestado <= -4096) || (NumeroRestado >= 4096 && NumeroRestado <= 8191)
    Categoria = 13;
elseif (NumeroRestado >= -16383 && NumeroRestado <= -8192) || (NumeroRestado >= 8192 && NumeroRestado <= 16383)
    Categoria = 14;
end


%   PARTE SEIS: Valor de DC
Iterador = 1;

for Tamanio = 1: 15
    TablaDC = Tabla_Uno{Tamanio, "Categoria"};

    if TablaDC == Categoria
        break;
    else
        Iterador = Iterador + 1;
    end
end

Longitud = Tabla_Uno{Iterador, "Longitud"};
Codigo_Base = Tabla_Uno{Iterador, "Codigo base"};
Binario_Diagonal = cell(1, 0);
Binario_Diagonal = cellfun(@(x) x, Binario_Diagonal, 'UniformOutput', false);

if NumeroRestado < 0
    Numero_Binario = dec2bin(abs(NumeroRestado));
    Numero_Binario = num2str(~(Numero_Binario-'0'));
    Numero_Binario = strcat('1', Numero_Binario);
    Complemento = bin2dec(Numero_Binario) + 1;

    Valor_DC = strcat(Codigo_Base, string(dec2bin(Complemento)));
    Binario_Diagonal{end + 1} = Valor_DC;

else
    Numero_Binario = dec2bin(NumeroRestado);

    Valor_DC = strcat(Codigo_Base, string(Complemento));
    Binario_Diagonal{end + 1} = Valor_DC;
end


%   PARTE SIETE: Valores de AC
Run = 0;

for i = 2: 63
    Valor = Diagonalizacion(1, i);

    if Valor == 0
        Binario_Diagonal{end + 1} = '1010';
        Run = Run + 1;
    else
        Categoria_AC = 0;
        Iterador = 1;

        if Valor == 0 
            Categoria_AC = 0;
        elseif Valor == -1 || Valor == 1
            Categoria_AC = 1;
        elseif (Valor >= -3 && Valor <= -2) || (Valor >= 2 && Valor <= 3)
            Categoria_AC = 2;
        elseif (Valor >= -7 && Valor <= -4) || (Valor >= 4 && Valor <= 7)
            Categoria_AC = 3;
        elseif (Valor >= -15 && Valor <= -8) || (Valor >= 8 && Valor <= 15)
            Categoria_AC = 4;
        elseif (Valor >= -31 && Valor <= -16) || (Valor >= 16 && Valor <= 31)
            Categoria_AC = 5;
        elseif (Valor >= -63 && Valor <= -32) || (Valor >= 32 && Valor <= 63)
            Categoria_AC = 6;
        elseif (Valor >= -127 && Valor <= -64) || (Valor >= 64 && Valor <= 127)
            Categoria_AC = 7;
        elseif (Valor >= -255 && Valor <= -128) || (Valor >= 128 && Valor <= 255)
            Categoria_AC = 8;
        elseif (Valor >= -511 && Valor <= -256) || (Valor >= 256 && Valor <= 511)
            Categoria_AC = 9;
        elseif  (Valor >= -1023 && Valor <= -512) || (Valor >= 512 && Valor <= 1023)
            Categoria_AC = 10;
        elseif  (Valor >= -2047 && Valor <= -1024) || (Valor >= 1024 && Valor <= 2047)
            Categoria_AC = 11;
        elseif (Valor >= -4095 && Valor <= -2048) || (Valor >= 2048 && Valor <= 4095)
            Categoria_AC = 12;
        elseif (Valor >= -8191 && Valor <= -4096) || (Valor >= 4096 && Valor <= 8191)
            Categoria_AC = 13;
        elseif (Valor >= -16383 && Valor <= -8192) || (Valor >= 8192 && Valor <= 16383)
            Categoria_AC = 14;
        end

        for Tamanio = 1: 50
            TablaAC = Tabla_Dos{Tamanio, "Categoria"};

            if TablaAC == Categoria_AC
                break;
            else
                Iterador = Iterador + 1;
            end
        end

        Codigo_Base_AC = Tabla_Dos{Iterador, "Codigo base"};
        Longitud_AC = Tabla_Dos{Iterador, "Longitud"};

        if NumeroRestado < 0
            Numero_Binario = dec2bin(abs(NumeroRestado));
            Numero_Binario = num2str(~(Numero_Binario-'0'));
            Numero_Binario = strcat('1', Numero_Binario);
            Complemento = bin2dec(Numero_Binario) + 1;
        
            Valor_DC = strcat(Codigo_Base, string(dec2bin(Complemento)));
            Binario_Diagonal{end + 1} = Valor_DC;
        
        else
            Numero_Binario = dec2bin(NumeroRestado);
        
            Valor_DC = strcat(Codigo_Base, string(Complemento));
            Binario_Diagonal{end + 1} = Valor_DC;
        end
    end
end

figure()
imshow(Imagen);

figure()
imshow(Imagen_Gris);

figure()
imshow(Imagen_DCT);


figure()
imshow(idct2(Imagen_DCT));