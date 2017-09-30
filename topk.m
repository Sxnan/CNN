load('cifar10testdata.mat')
load('CNNparameters.mat')

numOfImg = size(imageset, 4);
probvectors = zeros(10, 1, numOfImg);
for i=1:numOfImg
    probvectors(:,:,i) = squeeze(forwardPass(imageset(:,:,:,i), filterbanks, biasvectors));
    if mod(i, (numOfImg/100)) == 0
        fprintf("%d%%\n", i/(numOfImg/100));
    end
end

for i=1:10
    correct_prediction = zeros(1,numOfImg);
    for j=1:numOfImg
        correct_prediction(1,j) = top_k(i, probvectors(:,:,j), trueclass(:,j));
    end
    fprintf("k = %d accuracy = %.4f\n", i, sum(correct_prediction) / numOfImg);
end

function ret = top_k(k, probvec, trueclass)
    %determine if trueclass in the top k of probvec
    [~, idx] = sort(probvec);
    idx = flipud(idx);
    if ismember(trueclass, idx(1:k))
        ret = 1;
    else
        ret = 0;
    end
end