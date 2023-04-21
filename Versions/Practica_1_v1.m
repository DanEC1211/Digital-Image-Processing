%inciso a

foto = imread ("jacaranda.jpg");
copy=foto;
copy2=foto;
r = foto;
g = foto;
b = foto;

r(:,:,2:3)=0;
g(:,:,[1,3])=0;
b(:,:,1:2)=0;
arr=[foto,r;g,b];

figure()
imshow(arr,"Border","tight")

%inciso b
[m,n]=size(foto);
n=n/3;
b=n/3;
copy(:, 1:round(b-1), 2:3)=0;
copy(:, b:round(2*b), 1)=0;
copy(:, b:round(2*b), 3)=0;
copy(:, round(2*b):n, 1:2)=0;
figure()
imshow(copy,"Border","tight")

%inciso c
b=m/3;
copy2(1:(b-1), :, 2:3)=0;
copy2(b:round(2*b-1), :, 1)=0;
copy2(b:(2*b-1), :, 3)=0;
copy2(round(2*b):m, :, 1:2)=0;
figure()
imshow(copy2,"Border","tight")

% inciso d
m = 384;
n = 512;
A= zeros(m,n,3);
for i = 1:m
    for j = 1:n  
        if i == 200 && j>160 &&j<350
            for z = 1:40
                A(i+z,j,2) = 255;
            end
        end
        if i<353 && i>31 && j<385 && j>257
            k = round(0.4*i)+272;
            for z = 1:50
                A(i,k-z,2) = 255;
            end
        elseif i<353 && i>31 && j<257 && j>129
            k = round(-0.4*i)+292;
            for z = 1:50
                A(i,k-z,2) = 255;
            end
        end
    end
end
for i = 1:m
    for j = 1:n 
        if j > n/2 && A(i,j,2) == 0
            A(i,j,3) = 255;
        end
        if (j <= n/2) &&  A(i,j,2) == 0
             A(i,j,1) = 255;
        end
     end
 end
figure()
imshow(A, "Border","tight")