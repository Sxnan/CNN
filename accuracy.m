load("CNNparameters.mat")
load("cifar10testdata.mat")
fprintf("Running evaluation on cifar10 test data")
acc = evaluate(imageset, trueclass, filterbanks, biasvectors);
fprintf("Accuracy %.4f\n", acc);

function accuracy = evaluate(imgs, trueclass, filterbanks, biasvectors)
    predictions = predict(imgs, filterbanks, biasvectors);
    correct_prediction = sum(predictions == trueclass);
    accuracy = correct_prediction / size(predictions, 2);
end