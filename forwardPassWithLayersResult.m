function probVec = forwardPassWithLayersResult(inImg, parameters, biasvectors, root)

    %inImg: 32 x 32 x 3
    %parameters: filterbanks 1 x 18 cell
    %biasvectors: 1 x 18 cell
    
    if ~exist('root', 'var')
        root = '.';
    end
    load debuggingTest.mat;
    
    %nomalize input img
    img = imgNormalization(inImg);

    
    %layer 2 convolve
    filters = parameters{2};
    bias = biasvectors{2};
    img = convolve(img, filters, bias);
    save_result(img, 'layers_result/layer2', root)
    
    
    %layer 3 ReLu
    img = relu(img);
    save_result(img, 'layers_result/layer3', root)
    
    %layer 4 convolve
    filters = parameters{4};
    bias = biasvectors{4};
    img = convolve(img, filters, bias);
    save_result(img, 'layers_result/layer4', root)  
    
    %layer 5 ReLu
    img = relu(img);
    save_result(img, 'layers_result/layer5', root) 
    
    
    %layer 6 maxpooling
    img = maxPool(img);
    save_result(img, 'layers_result/layer6', root) 

    
    %layer 7 convolve
    filters = parameters{7};
    bias = biasvectors{7};
    img = convolve(img, filters, bias);
    save_result(img, 'layers_result/layer7', root) 
    
    %layer 8 ReLu
    img = relu(img);
    save_result(img, 'layers_result/layer8', root) 
    
    %layer 9 convolve
    filters = parameters{9};
    bias = biasvectors{9};
    img = convolve(img, filters, bias);
    save_result(img, 'layers_result/layer9', root) 
    
    %layer 10 ReLu
    img = relu(img);
    save_result(img, 'layers_result/layer10', root) 
    
    %layer 11 maxpool
    img = maxPool(img);
    save_result(img, 'layers_result/layer11', root) 
    
    %layer 12 convolve
    filters = parameters{12};
    bias = biasvectors{12};
    img = convolve(img, filters, bias);
    save_result(img, 'layers_result/layer12', root) 
    
    %layer 13 ReLu
    img = relu(img);
    save_result(img, 'layers_result/layer13', root) 
    
    %layer 14 convolve
    filters = parameters{14};
    bias = biasvectors{14};
    img = convolve(img, filters, bias);
    save_result(img, 'layers_result/layer14',root) 
    
    %layer 15 ReLu
    img = relu(img);
    save_result(img, 'layers_result/layer15',root) 
    
    %layer 16 maxpool
    img = maxPool(img);
    save_result(img, 'layers_result/layer16',root) 
    
    
    %layer 17 fullconnect
    filters = parameters{17};
    bias = biasvectors{17};
    img = fullyConnected(img, filters, bias);
    
    %layer 18 softmax
    probVec = softmax(img);
end

function save_result(imgs, path, root)
    if ~exist([root, '/', path], 'dir')
        mkdir([root,'/', path])
    end
    for i=1:size(imgs, 3)
        img = enlargeImg(imgs(:,:,i), 16);
        imwrite(img,[root,'/', path,'/',num2str(i),'.jpg'])
    end
end

function newImg = enlargeImg(img, scale)
    new_size = size(img, 1) * scale;
    newImg = zeros(new_size);
    for i=1:new_size
        for j=1:new_size
            newImg(i, j) = img(int32(ceil(i/scale)), int32(ceil(j/scale)));
        end
    end
end
