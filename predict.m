function prediction = predict(imgs, filterbanks, biasvectors)
    numOfImg = size(imgs, 4);
    prediction = zeros(1, numOfImg);
    prediction = uint8(prediction);
    for i = 1:numOfImg
        probvect = forwardPass(imgs(:,:,:,i), filterbanks, biasvectors);
        [~, maxClass] = max(probvect);
        prediction(1, i) = uint8(maxClass);
        if mod(i, (numOfImg/100)) == 0
            fprintf("%d%%\n", i/(numOfImg/100));
        end
    end
end