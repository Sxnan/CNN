function accuracy = evaluate(imgs, trueclass, filterbanks, biasvectors)
    predictions = predict(imgs, filterbanks, biasvectors);
    correct_prediction = sum(predictions == trueclass);
    accuracy = correct_prediction / size(predictions, 2);
end