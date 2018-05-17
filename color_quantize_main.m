% Kiranpreet Kaur
% Zaryab Farooq

origImg = double(imread('fish.jpg'));
subplot(3,2,1);
imshow(uint8(origImg));

[quantizedImg, ~] = quantize_RGB(origImg, 5);
subplot(3,2,3);
imshow(quantizedImg);
title('quantized RGB: k=5');

[quantizedImg, ~] = quantize_RGB(origImg, 25);
subplot(3,2,4);
imshow(quantizedImg);
title('quantized RGB: k=25');

[quantizedHImg, ~] = quantize_HSV(origImg, 5);
subplot(3,2,5);
imshow(quantizedHImg);
title('quantized HSV: k=5');

[quantizedH2Img, ~] = quantize_HSV(origImg, 25);
subplot(3,2,6);
imshow(quantizedH2Img);
title('quantized HSV: k=25');