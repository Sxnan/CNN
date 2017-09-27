function [accuracy, confusionMatrix, contigencyTable] = evaluate(imgs, trueclass, filterbanks, biasvectors)
    numOfImg = size(imgs, 4);
    prediction = zeros(1, numOfImg);
    for i = 1:numOfImg
        probvect = forwardPass(imgs(:,:,:,i), filterbanks, biasvectors);
        [~, maxClass] = max(probvect);
        prediction(1, i) = maxClass;
        if mod(i, (numOfImg/100)) == 0
            fprintf("%d\%\n", mod(i, (numOfImg/100)));
        end
    end
    correct_prediction = sum(prediction == trueclass);
    accuracy = correct_prediction / numOfImg;
    fprintf("accuracy: %.4f\n", accuracy);
end