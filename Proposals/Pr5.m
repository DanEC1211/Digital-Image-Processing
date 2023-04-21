M=imread("azul.jpg");
sizeM=size(M);
maxorR=0;
minorR=255;
maxorG=0;
minorG=255;
maxorB=0;
minorB=255;
max=225;
min=20;

for i=1:sizeM(1,1)
    for j=1:sizeM(1,2)
        if M(i,j,1)< minorR
            minorR= M(i,j,1);
        end

        if M(i,j,2)< minorG
            minorG= M(i,j,2);
        end

        if M(i,j,3)< minorB
            minorB= M(i,j,3);
        end

        if M(i,j,1)> maxorR
            maxorR= M(i,j,1);
        end

        if M(i,j,2)> maxorG
            maxorG= M(i,j,2);
        end

        if M(i,j,3)> maxorB
            maxorB= M(i,j,3);
        end

    end
end

Compres=M;
for i=1:sizeM(1,1)
   for j=1:sizeM(1,2)
      Compres(i,j,1)=double(double(((M(i,j,1)-minorR)/(maxorR-minorR))*(max-min)+min));
      Compres(i,j,2)=double(double((M(i,j,2)-minorG)/(maxorG-minorG))*(max-min)+min);
      Compres(i,j,3)=double(double((M(i,j,3)-minorB)/(maxorB-minorB))*(max-min)+min); 
   end
   double(Compres);
end
figure(1);
imshow(M);
figure(2);
subplot(2,2,1);
imshow(Compres);
subplot(2,2,2);
imshow(Compres(:,:,1));
subplot(2,2,3);
imshow(Compres(:,:,2));
subplot(2,2,4);
imshow(Compres(:,:,3));

figure(3)
subplot(1,3,1)
imhist(M(:,:,1))
subplot(1,3,2)
imhist(M(:,:,2))
subplot(1,3,3)
imhist(M(:,:,3))

figure(4)
subplot(1,3,1)
imhist(Compres(:,:,1))
subplot(1,3,2)
imhist(Compres(:,:,2))
subplot(1,3,3)
imhist(Compres(:,:,3))

