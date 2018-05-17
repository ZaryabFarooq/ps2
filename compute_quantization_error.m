function [error] = compute_quantization_error(origImg,quantizedImg)
    origImg = double(uint8(imread('fish.jpg')));
    [quantizedImg, ~] = quantize_RGB(origImg, 5)
    
    diff = origImg - double(quantizedImg);
    error = sum(diff(:).^2);
    
end

