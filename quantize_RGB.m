function [outputImg, meanColors] = quantize_RGB(origImg, k)
    [rows, cols, ~] = size(origImg);
    numpixels = rows * cols;
    newImg = reshape(origImg, numpixels, 3);
    
    % idx is the vector with each pixel's cluster value
    % meanColors has the actual rgb value for each cluster
    [idx, meanColors] = kmeans(newImg, k);
    NewImg = reshape(idx, rows, cols);
   
   for i=1:rows 
       for j=1:cols
           % changing the rgb values
           origImg(i,j,1) = meanColors(NewImg(i,j), 1);
           origImg(i,j,2) = meanColors(NewImg(i,j), 2);
           origImg(i,j,3) = meanColors(NewImg(i,j), 3);
       end
   end
  
   outputImg = uint8(origImg);