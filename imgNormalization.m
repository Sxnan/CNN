function outMat = imgNormalization(inMat)
    %normalize input image
    outMat = double(inMat)/255.0 - 0.5;
end
