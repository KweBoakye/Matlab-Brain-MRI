B2 = imread('Brain2.png');

B2g = rgb2gray(B2);
B2g = imfill(B2g);
safdf=imhist(B2g);

B2T2 = B2g <= 140 & B2g>= 137;

B2T2fill = imfill(B2T2,'holes');
ha = fspecial('average',[7 7]);
hd = fspecial('disk',4);
i2a = imfilter(B2T2fill,ha);
i2d = imfilter(B2T2fill,hd);


[B2ia8,L2ia8]=bwboundaries(i2a,8,'noholes');
[B2ia4,L2ia4]=bwboundaries(i2a,4,'noholes');
[B2id8,L2id8]=bwboundaries(i2d,8,'noholes');
[B2id4,L2id4]=bwboundaries(i2d,4,'noholes');

stats2ia8 = regionprops(L2ia8,'Area');
stats2ia4 = regionprops(L2ia4,'Area');
stats2id8 = regionprops(L2id8,'Area');
stats2id4 = regionprops(L2id4,'Area');

pixelarea2ia8 = stats2ia8.Area;
pixelarea2ia4= stats2ia4.Area;
pixelarea2id8 = stats2id8.Area;
pixelarea2id4 = stats2id4.Area;

realarea2ia8 = 0.75*0.75*pixelarea2ia8
realarea2ia4 = 0.75*0.75*pixelarea2ia4
realarea2id8 = 0.75*0.75*pixelarea2id8
realarea2id4 = 0.75*0.75*pixelarea2id4


figure

subplot(2,1,1)
imshow(B2);

subplot(2,1,2)
imshow(B2g);

figure

subplot(2,1,1)
imshow(B2T2);

subplot(2,1,2)
imshow(B2T2fill);

figure
subplot(2,1,1)
imshow(label2rgb(L2ia8, @jet, [.5 .5 .5]))
hold on
for k = 1:length(B2ia8)
   boundary = B2ia8{k};
   plot(boundary(:,2), boundary(:,1), 'w', 'LineWidth', 2)
end

subplot(2,1,2)
imshow(label2rgb(L2id8, @jet, [.5 .5 .5]))
hold on
for k = 1:length(B2id8)
   boundary = B2id8{k};
   plot(boundary(:,2), boundary(:,1), 'w', 'LineWidth', 2)
end

