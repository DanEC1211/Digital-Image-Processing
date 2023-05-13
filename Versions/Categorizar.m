function Tipo_Categoria = Categorizar(Tipo_Categoria, Valor_Obtenido)
    if Valor_Obtenido == 0 
        Tipo_Categoria = 0;

    elseif Valor_Obtenido == -1 || Valor_Obtenido == 1
        Tipo_Categoria = 1;

    elseif (Valor_Obtenido >= -3 && Valor_Obtenido <= -2) || (Valor_Obtenido >= 2 && Valor_Obtenido <= 3)
        Tipo_Categoria = 2;

    elseif (Valor_Obtenido >= -7 && Valor_Obtenido <= -4) || (Valor_Obtenido >= 4 && Valor_Obtenido <= 7)
        Tipo_Categoria = 3;

    elseif (Valor_Obtenido >= -15 && Valor_Obtenido <= -8) || (Valor_Obtenido >= 8 && Valor_Obtenido <= 15)
        Tipo_Categoria = 4;

    elseif (Valor_Obtenido >= -31 && Valor_Obtenido <= -16) || (Valor_Obtenido >= 16 && Valor_Obtenido <= 31)
        Tipo_Categoria = 5;

    elseif (Valor_Obtenido >= -63 && Valor_Obtenido <= -32) || (Valor_Obtenido >= 32 && Valor_Obtenido <= 63)
        Tipo_Categoria = 6;

    elseif (Valor_Obtenido >= -127 && Valor_Obtenido <= -64) || (Valor_Obtenido >= 64 && Valor_Obtenido <= 127)
        Tipo_Categoria = 7;

    elseif (Valor_Obtenido >= -255 && Valor_Obtenido <= -128) || (Valor_Obtenido >= 128 && Valor_Obtenido <= 255)
        Tipo_Categoria = 8;

    elseif (Valor_Obtenido >= -511 && Valor_Obtenido <= -256) || (Valor_Obtenido >= 256 && Valor_Obtenido <= 511)
        Tipo_Categoria = 9;

    elseif  (Valor_Obtenido >= -1023 && Valor_Obtenido <= -512) || (Valor_Obtenido >= 512 && Valor_Obtenido <= 1023)
        Tipo_Categoria = 10;

    elseif  (Valor_Obtenido >= -2047 && Valor_Obtenido <= -1024) || (Valor_Obtenido >= 1024 && Valor_Obtenido <= 2047)
        Tipo_Categoria = 11;

    elseif (Valor_Obtenido >= -4095 && Valor_Obtenido <= -2048) || (Valor_Obtenido >= 2048 && Valor_Obtenido <= 4095)
        Tipo_Categoria = 12;

    elseif (Valor_Obtenido >= -8191 && Valor_Obtenido <= -4096) || (Valor_Obtenido >= 4096 && Valor_Obtenido <= 8191)
        Tipo_Categoria = 13;

    elseif (Valor_Obtenido >= -16383 && Valor_Obtenido <= -8192) || (Valor_Obtenido >= 8192 && Valor_Obtenido <= 16383)
        Tipo_Categoria = 14;
    end

    % switch Valor_Obtenido
    %     case 0
    %         Tipo_Categoria = 0;
    % 
    %     case [(-1), (1)]
    %         Tipo_Categoria = 1;
    % 
    %     case [(-3: -2), (2: 3)]
    %         Tipo_Categoria = 2;
    % 
    %     case [(-7: -4), (4: 7)]
    %         Tipo_Categoria = 3;
    % 
    %     case [(-15: -8), (8: 15)]
    %         Tipo_Categoria = 4;
    % 
    %     case [(-31: -16), (16: 31)]
    %         Tipo_Categoria = 5;
    % 
    %     case [(-63: -32), (32: 63)]
    %         Tipo_Categoria = 6;
    % 
    %     case [(-127: -64), (64: 127)]
    %         Tipo_Categoria = 7;
    % 
    %     case [(-255: -128), (128: 255)]
    %         Tipo_Categoria = 8;
    % 
    %     case [(-511: -256), (256: 511)]
    %         Tipo_Categoria = 9;
    % 
    %     case [(-1023: -512), (512: 1023)]
    %         Tipo_Categoria = 10;
    % 
    %     case [(-2047: -1024), (1024: 2047)]
    %         Tipo_Categoria = 11;
    % 
    %     case [(-4095: -2048), (2048: 4095)]
    %         Tipo_Categoria = 12;
    % 
    %     case [(-8191: -4096), (4096: 8191)]
    %         Tipo_Categoria = 13;
    % 
    %     case [(-16383: -9192), (8192: 16383)]
    %         Tipo_Categoria = 14;
    % end
end