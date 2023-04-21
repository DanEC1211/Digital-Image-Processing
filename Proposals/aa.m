foto = imread ("jacaranda.jpg");
imshow(foto)
rojo = foto;
verde = foto;
azul = foto;


rbn = foto(:,:,1);
vbn = foto(:,:,2);
abn = foto(:,:,3);

figure()
subplot(1,3,1)
imshow(rbn)
title("Red")
subplot(1,3,2)
imshow(vbn)
title("Green")
subplot(1,3,3)
imshow(abn)
title("Blue")

rojo(:,:,2:3)=0;
verde(:,:,1)=0;
verde(:,:,3)=0;
azul(:,:,1:2)=0;

figure()
subplot(1,3,1)
imshow(rojo)
title("Red")
subplot(1,3,2)
imshow(verde)
title("Green")
subplot(1,3,3)
imshow(azul)
title("Blue")

figure()
imhist(foto)

[m,n]=size(rbn);
