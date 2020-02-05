B1 = imread('Brain1.png');

B1g= rgb2gray(B1);
B1g = imfill(B1g);
dgsd = imhist(B1g);

figure

B1T2 = B1g <= 112 & B1g>= 108;

B1T2fill = imfill(B1T2,'holes');
ha = fspecial('average',[7 7]);
hd = fspecial('disk',4);
ia = imfilter(B1T2fill,ha);
id = imfilter(B1T2fill,hd);

[Bia8,Lia8]=bwboundaries(ia,8,'noholes');
[Bia4,Lia4]=bwboundaries(ia,4,'noholes');
[Bid8,Lid8]=bwboundaries(id,8,'noholes');
[Bid4,Lid4]=bwboundaries(id,4,'noholes');

statsia8 = regionprops(Lia8,'Area');
statsia4 = regionprops(Lia4,'Area');
statsid8 = regionprops(Lid8,'Area');
statsid4 = regionprops(Lid4,'Area');

pixelareaia8 = statsia8.Area;
pixelareaia4= statsia4.Area;
pixelareaid8 = statsid8.Area;
pixelareaid4 = statsid4.Area;

realareaia8 = 0.75*0.75*pixelareaia8;
realareaia4 = 0.75*0.75*pixelareaia4;
realareaid8 = 0.75*0.75*pixelareaid8;
realareaid4 = 0.75*0.75*pixelareaid4;

figure
imshow(B1g)

figure
subplot(2,1,1)
imshow(B1T2);

subplot(2,1,2)
imshow(B1T2fill);

figure
subplot(2,1,1)
imshow(label2rgb(Lia8, @jet, [.5 .5 .5]))
hold on
for k = 1:length(Bia8)
   boundary = Bia8{k};
   plot(boundary(:,2), boundary(:,1), 'w', 'LineWidth', 2)
end

subplot(2,1,2)
imshow(label2rgb(Lid8, @jet, [.5 .5 .5]))
hold on
for k = 1:length(Bid8)
   boundary = Bid8{k};
   plot(boundary(:,2), boundary(:,1), 'w', 'LineWidth', 2)
end
