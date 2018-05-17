function [outputImg, meanHues] = quantize_HSV(origImg, k)
    hsvImg = rgb2hsv(origImg);
    hsvImg = hsvImg(:,:,1);
   [rows, cols] = size(hsvImg);
    
    numpixels = rows * cols;
    newImg = reshape(hsvImg, numpixels, 1);
    
    % idx is the vector with each pixel's cluster value
    % meanColors has the actual rgb value for each cluster
    [idx, meanHues] = kmeans(newImg, k);
    NewImg = reshape(idx, rows, cols);
    
    for i=1:rows 
       for j=1:cols
           % changing the rgb values
           origImg(i,j,1) = meanHues(NewImg(i,j), 1);
       end
    end
   
   outputImg = hsv2rgb(origImg);
   outputImg = uint8(outputImg);