B2 = imread('Brain2.png');

B2g = rgb2gray(B2);
B2g = imfill(B2g);
za = imhist(B2g);

B2T2 = B2g <= 140 & B2g>= 137;

B2T2i =imcomplement(B2T2);
B2T2fill = imfill(B2T2,'holes');
sdf =  immultiply(B2T2i,B2T2fill);
[sdfB,ldfB]=bwboundaries(sdf,8,'holes');

figure
subplot(2,3,1)
imshow(B2)
title('B2')

hold on 
for k=1:length(sdfB)
b=sdfB{k};
plot(b(:,2),b(:,1),'r','LineWidth',3);
end

subplot(2,3,2)
imshow(B2T2i)
title('B2T2i')

subplot(2,3,3)
imshow(B2T2)
title('B2T2')

subplot(2,3,4)
imshow(B2T2fill)
title('B2T2fill')

subplot(2,3,5)
imshow(sdf)
title('sdf')



%{
figure
subplot(2,3,1)
imshow(T1)
title(1)

subplot(2,3,2)
imshow(T2)
title(2)

subplot(2,3,3)
imshow(T3)
title(3)

subplot(2,3,4)
imshow(T4)
title(4)

subplot(2,3,5)
imshow(T5)
title(5)

subplot(2,3,6)
imshow(T6)
title(6)



CC = bwconncomp(B2V2);

numPixels = cellfun(@numel,CC.PixelIdxList);
[biggest,idx] = max(numPixels);
B2V2(CC.PixelIdxList{idx}) = 0;



SE = strel(i2ai);
B2VC =  imopen(B2V,SE);
i2ai = imcomplement(i2a);
B2Vi = imcomplement(B2V);
B2Vfill = imfill(B2V,'holes');
Back = imsubtract(B2V,i2a);


subplot(1,2,1)
imshow(B2Vi);

subplot(1,2,2)
imshow(Back);

ve= imsubtract(B2V,Back);
[B2V8,L2V8,N,A]=bwboundaries(B2V,8,'holes');

stats2V8 = regionprops(L2V8,'Area');
%}