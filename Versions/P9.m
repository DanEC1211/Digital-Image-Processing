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
    {'010'; '011'; '100'; '00'; '101'; '110'; '1110'; '11110'; '111110'; '1111110'; '11111110'; '111111110'; '1111111110'; '11111111110'; '111111111110'}, ...
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
    1; 2; 3; 4; 5; 6; 7; 8; 9; 10;
    1; 2; 3; 4; 5; 6; 7; 8; 9; 10;
    1; 2; 3; 4; 5; 6; 7; 8; 9; 10;
    1; 2; 3; 4; 5; 6; 7; 8; 9; 10;
    1; 2; 3; 4; 5; 6; 7; 8; 9; 10;
    1; 2; 3; 4; 5; 6; 7; 8; 9; 10;
    1; 2; 3; 4; 5; 6; 7; 8; 9; 10;
    1; 2; 3; 4; 5; 6; 7; 8; 9; 10;
    1; 2; 3; 4; 5; 6; 7; 8; 9; 10;
    % 1; 2; 3; 4; 5; 6; 7; 8; 9; 10;
    % 1; 2; 3; 4; 5; 6; 7; 8; 9; 10;
    % 0; 1; 2; 3; 4; 5; 6; 7; 8; 9; 10;
];

Tabla_Dos = table...
( ...
    [ ...
        0; 0; 0; 0; 0; 0; 0; 0; 0; 0; ...
        1; 1; 1; 1; 1; 1; 1; 1; 1; 1; ...
        2; 2; 2; 2; 2; 2; 2; 2; 2; 2; ...
        3; 3; 3; 3; 3; 3; 3; 3; 3; 3; ...
        4; 4; 4; 4; 4; 4; 4; 4; 4; 4; ...
        5; 5; 5; 5; 5; 5; 5; 5; 5; 5; ...
        6; 6; 6; 6; 6; 6; 6; 6; 6; 6; ...
        7; 7; 7; 7; 7; 7; 7; 7; 7; 7; ...
        8; 8; 8; 8; 8; 8; 8; 8; 8; 8; ...
        9; 9; 9; 9; 9; 9; 9; 9; 9; 9; ...
        10; 10; 10; 10; 10; 10; 10; 10; 10; 10; ...
        11; 11; 11; 11; 11; 11; 11; 11; 11; 11; ...
        12; 12; 12; 12; 12; 12; 12; 12; 12; 12; ...
        % 13; 13; 13; 13; 13; 13; 13; 13; 13; 13; ...
        % 14; 14; 14; 14; 14; 14; 14; 14; 14; 14; ...
        % 15; 15; 15; 15; 15; 15; 15; 15; 15; 15; 15; ...
    ], ...
    Categoria, ...
    { ...
        '00';'01';'100';'1011';'11010';'111000';'1111000';'1111110110';'1111111110000010';'1111111110000011'; ...
        '1100';'111001';'1111001';'111110110';'11111110110';'1111111110000100';'1111111110000101';'1111111110000110';'1111111110000111';'1111111110001000'; ...
        '11011';'11111000';'1111110111';'1111111110001001';'1111111110001010';'1111111110001011';'1111111110001100';'1111111110001101';'1111111110001110';'1111111110001111'; ...
        '111010';'111110111';'11111110111';'1111111110010000';'1111111110010001'; '1111111110010010';'1111111110010011';'1111111110010100';'1111111110010101';'1111111110010110'; ...
        '111011';'1111111000';'1111111110010111';'1111111110011000';'1111111110011001';'1111111110011010';'1111111110011011';'1111111110011100';'1111111110011101'; '1111111110011110';
        '1111010'; '1111111001'; '1111111110011111'; '1111111110100000'; '1111111110100001'; '1111111110100010'; '1111111110100011'; '1111111110100100'; '1111111110100101'; '1111111110100110';...
        '1111011'; '11111111000'; '1111111110100111'; '1111111110101000'; '1111111110101001'; '1111111110101010'; '1111111110101011'; '1111111110101100'; '1111111110101101'; '1111111110101110';...
        '11111001'; '11111111001'; '1111111110101111'; '1111111110110000'; '1111111110110001'; '1111111110110010'; '1111111110110011'; '1111111110110100'; '1111111110110101'; '1111111110110110';...
        '11111010'; '111111111000000'; '1111111110110111'; '1111111110111000'; '1111111110111001'; '1111111110111010'; '1111111110111011'; '1111111110111100'; '1111111110111101'; '1111111110111110'; ...
        '111111000'; '1111111110111111'; '1111111111000000'; '1111111111000001'; '1111111111000010'; '1111111111000011'; '1111111111000100'; '1111111111000101'; '1111111111000110'; '1111111111000111'; ...
        '111111001'; '1111111111001000'; '1111111111001001'; '1111111111001010'; '1111111111001011'; '1111111111001100'; '1111111111001101'; '1111111111001110'; '1111111111001111'; '1111111111010000'; ...
        '111111010'; '1111111111010001'; '1111111111010010'; '1111111111010011'; '1111111111010100'; '1111111111010101'; '1111111111010110'; '1111111111010111'; '1111111111011000'; '1111111111011001'; ...
        '1111111010'; '1111111111011010'; '1111111111011011'; '1111111111011100'; '1111111111011101'; '1111111111011110'; '1111111111011111'; '1111111111100000'; '1111111111100001'; '1111111111100010' ...
        %'11111111010'; '1111111111100011'; '1111111111100100'; '1111111111100101'; '1111111111100110'; '1111111111100111'; '1111111111101000'; '1111111111101001'; '1111111111101010'; '1111111111101011'; ...
        %'111111110110'; '1111111111101100'; '1111111111101101'; '1111111111101110'; '1111111111101111'; '1111111111110000'; '1111111111110001'; '1111111111110010'; '1111111111110011'; '1111111111110100'; ...
        %'111111110111'; '1111111111110101'; '1111111111110110'; '1111111111110111'; '1111111111111000'; '1111111111111001'; '1111111111111010'; '1111111111111011'; '1111111111111100'; '1111111111111101'; '1111111111111110' ...
    }, ...
    [ ...
        3; 4; 6; 8; 10; 12; 14; 18; 25; 26; ...
        5; 8; 10; 13; 16; 22; 23; 24; 25; 26; ...
        6; 10; 13; 20; 21; 22; 23; 24; 25; 26; ...
        7; 11; 14; 20; 21; 22; 23; 24; 25; 26; ...
        7; 12; 19; 20; 21; 22; 23; 24; 25; 26; ...
        8; 12; 19; 20; 21; 22; 23; 24; 25; 26; ...
        8; 13; 19; 20; 21; 22; 23; 24; 25; 26; ...
        9; 13; 19; 20; 21; 22; 23; 24; 25; 26; ...
        9; 17; 19; 20; 21; 22; 23; 24; 25; 26; ...
        10; 18; 19; 20; 21; 22; 23; 24; 25; 26; ...
        10; 18; 19; 20; 21; 22; 23; 24; 25; 26; ...
        10; 18; 19; 20; 21; 22; 23; 24; 25; 26; ...
        11; 18; 19; 20; 21; 22; 23; 24; 25; 26; ...    
    ],...
    'VariableNames', ...
    {'Run', 'Categoria','Codigo base','Longitud'} ...
);


    % 8; 12; 19; 20; 21; 22; 23; 24; 25; 26; ...
    % 8; 13; 19; 20; 21; 22; 23; 24; 25; 26; ...
    % 9; 13; 19; 20; 21; 22; 23; 24; 25; 26], ...

Imagen_Gris = rgb2gray(Imagen);
[Filas, Columnas] = size(Imagen_Gris);

Imagen_Gris = Imagen_Gris - 128;


%   PARTE DOS: Aplicando DCT a la imagen
Imagen_DCT = dct2(Imagen_Gris);

figure()
imshow(Imagen_DCT);

%   PARTE TRES: Aplicación de la cuantificación
for i = 1: floor(Filas / 8)
    for j = 1: floor(Columnas / 8)
        Bloque_Imagen = Imagen_DCT( 8*(i - 1) + 1: 8*i, 8*(j - 1) + 1: 8*j);
        Imagen_DCT( 8*(i - 1) + 1: 8*i, 8*(j - 1) + 1: 8*j) = round(Bloque_Imagen ./ Cuantificador);
    end
end


%   PARTE CUATRO: Aplicamos la diagonalización
prompt =... 
{
    'Valor de i: ', ...
    'Valor de j: '
};
dlgtitle = 'Practica 3';

dims = [1 35];
valores = inputdlg(prompt,dlgtitle,dims);

i = 0;
j = 0;
i = uint8((valores{1})) - 48;
j = uint8((valores{2})) - 48;

Diagonalizacion = zeros(1, 64);
Bloque_Imagen = Imagen_DCT(8*(i - 1) + 1: 8*i, 8*(j - 1) + 1: 8*j);
Diagonalizacion(1) = Bloque_Imagen(1,1);

k = 2;
m = 1;
n = 1;
u = 1;
for u = 1: 7
    if u <= 4
        n = n + 1;
        Diagonalizacion(k) = Bloque_Imagen(m, n);
        k = k + 1;

        for x = 1: (u - 1)*2 + 1
            m = m + 1;
            n = n - 1;
            Diagonalizacion(k) = Bloque_Imagen(m, n);
            k = k + 1;
        end

        if u ~= 4
            m = m + 1;
        else
            n = n + 1;
        end

        Diagonalizacion(k) = Bloque_Imagen(m, n);
        k = k + 1;

        if u == 4
             for y = 1: (u - 2)*2 + 2
    
                m = m - 1;
                n = n + 1;
                Diagonalizacion(k) = Bloque_Imagen(m, n);
                k = k + 1;
            end
        else
            for y = 1: (u - 1)*2 + 2
    
                m = m - 1;
                n = n + 1;
                
                Diagonalizacion(k) = Bloque_Imagen(m, n);
                k = k + 1;
            end
        end
    elseif u > 4
        m = m + 1;
        Diagonalizacion(k) = Bloque_Imagen(m, n);
        k = k + 1;

        for x = 1: 5 - 2*(u - 5)
            m = m + 1;
            n = n - 1;
            Diagonalizacion(k) = Bloque_Imagen(m, n);
            k = k + 1;
        end

        n = n + 1;
        Diagonalizacion(k) = Bloque_Imagen(m, n);
        k = k + 1;

        for y = 1: 4 - 2*(u - 5)
            m = m - 1;
            n = n + 1;
            Diagonalizacion(k) = Bloque_Imagen(m, n);
            k = k + 1;
        end
    end
end

Valores_Diagonalizacion = Diagonalizacion;

%   PARTE CINCO: Resta de DC
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

NumeroRestado = Valores_Diagonalizacion(1, 1) - DC_Anterior;
Tipo_Categoria = 0;
Tipo_Categoria = Categorizar(Tipo_Categoria, NumeroRestado);

%   PARTE SEIS: Valor de DC
Iterador = 1;

for Tamanio = 1: 15
    TablaDC = Tabla_Uno{Tamanio, "Categoria"};

    if TablaDC == Tipo_Categoria
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
    % Numero_Binario = dec2bin(abs(NumeroRestado));
    % Numero_Binario = num2str(~(Numero_Binario-'0'));
    % Numero_Binario = strcat('1', Numero_Binario);
    % Complemento = bin2dec(Numero_Binario) + 1;

    % Numero_Binario = dec2bin(abs(NumeroRestado));
    % Numero_Binario = strcat('0', Numero_Binario);
    % Numero_Binario = num2str(~(Numero_Binario-'0'));
    % Numero_Binario = str2dec(Numero_Binario);
    % Numero_Binario = str2num(Numero_Binario) + dec2bin(1);
    % Complemento = bin2dec(Numero_Binario);


    Tam = size(dec2bin(abs(NumeroRestado)), 2);
    Numero_Binario = dec2bin(NumeroRestado);

    for i = 1: size(Numero_Binario, 2) - Tam - 1
        Numero_Binario(1) = [];
    end

    Numero_Binario = bin2dec(Numero_Binario) + 1;
    Numero_Binario = dec2bin(Numero_Binario);
    Complemento = Numero_Binario;

    Valor_DC = strcat(Codigo_Base, string((Complemento)));
    Binario_Diagonal{end + 1} = Valor_DC;

else
    Numero_Binario = dec2bin(NumeroRestado);

    Valor_DC = strcat(Codigo_Base, string(Numero_Binario));
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
        Tipo_Categoria_AC = 0;
        Tipo_Categoria_AC = Categorizar(Tipo_Categoria_AC, Valor);
        Iterador = 1;

        for Tamanio = 1: 50
            TablaAC = Tabla_Dos{Tamanio, "Categoria"};

            if TablaAC == Tipo_Categoria_AC
                break;
            else
                Iterador = Iterador + 1;
            end
        end

        Codigo_Base_AC = Tabla_Dos{Iterador, "Codigo base"};
        Longitud_AC = Tabla_Dos{Iterador, "Longitud"};

        if NumeroRestado < 0
            % Numero_Binario = dec2bin(abs(NumeroRestado));
            % Numero_Binario = num2str(~(Numero_Binario-'0'));
            % Numero_Binario = strcat('1', Numero_Binario);
            % Complemento = bin2dec(string(Numero_Binario)) + 1;
            % 
            % Valor_DC = strcat(Codigo_Base, string(dec2bin(Complemento)));
            % Binario_Diagonal{end + 1} = Valor_DC;
            
            Tam = size(dec2bin(abs(NumeroRestado)), 2);
            Numero_Binario = dec2bin(NumeroRestado);
        
            for i = 1: size(Numero_Binario, 2) - Tam - 1
                Numero_Binario(1) = [];
            end
        
            Numero_Binario = bin2dec(Numero_Binario) + 1;
            Numero_Binario = dec2bin(Numero_Binario);
            Complemento = Numero_Binario;
        
            Valor_DC = strcat(Codigo_Base, string((Complemento)));
            Binario_Diagonal{end + 1} = Valor_DC;
            
        else
            Numero_Binario = dec2bin(Valor);
        
            Valor_DC = strcat(Codigo_Base, string(Numero_Binario));
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