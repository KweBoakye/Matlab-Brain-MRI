B1 = imread('Brain1.png');

B1g = rgb2gray(B1);
B1g = imfill(B1g);
za = imhist(B1g);



B1T2 = B1g <= 112 & B1g>= 108;

B1T2i =imcomplement(B1T2);
B1T2fill = imfill(B1T2,'holes');
sdf =  immultiply(B1T2i,B1T2fill);
[sdfB,ldfB]=bwboundaries(sdf,8,'holes');

figure
subplot(2,3,1)
imshow(B1)
title('B1')

hold on 
for k=1:length(sdfB)
b=sdfB{k};
plot(b(:,2),b(:,1),'r','LineWidth',3);
end

subplot(2,3,2)
imshow(B1T2i)
title('B1T2i')

subplot(2,3,3)
imshow(B1T2)
title('B1T2')

subplot(2,3,4)
imshow(B1T2fill)
title('B1T2fill')

subplot(2,3,5)
imshow(sdf)
title('sdf')

