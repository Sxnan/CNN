function probVec = forwardPass(inImg, parameters, biasvectors)
    %inImg: 32 x 32 x 3
    %parameters: filterbanks 1 x 18 cell
    %biasvectors: 1 x 18 cell
    
    %nomalize input img
    img = imgNormalization(inImg);

    
    %layer 2 convolve
    filters = parameters{2};
    bias = biasvectors{2};
    img = convolve(img, filters, bias);
    
    
    %layer 3 ReLu
    img = relu(img);
    
    %layer 4 convolve
    filters = parameters{4};
    bias = biasvectors{4};
    img = convolve(img, filters, bias);
    
    %layer 5 ReLu
    img = relu(img);
    
    %layer 6 maxpooling
    img = maxPool(img);
    
    %layer 7 convolve
    filters = parameters{7};
    bias = biasvectors{7};
    img = convolve(img, filters, bias);
    
    %layer 8 ReLu
    img = relu(img);
    
    %layer 9 convolve
    filters = parameters{9};
    bias = biasvectors{9};
    img = convolve(img, filters, bias);
    
    %layer 10 ReLu
    img = relu(img);
    
    %layer 11 maxpool
    img = maxPool(img);
    
    %layer 12 convolve
    filters = parameters{12};
    bias = biasvectors{12};
    img = convolve(img, filters, bias);
    
    %layer 13 ReLu
    img = relu(img);

    %layer 14 convolve
    filters = parameters{14};
    bias = biasvectors{14};
    img = convolve(img, filters, bias);
    
    %layer 15 ReLu
    img = relu(img);
    
    %layer 16 maxpool
    img = maxPool(img);
      
    %layer 17 fullconnect
    filters = parameters{17};
    bias = biasvectors{17};
    img = fullyConnected(img, filters, bias);
    
    %layer 18 softmax
    probVec = softmax(img);
end