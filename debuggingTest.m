load debuggingTest.mat
load cifar10testdata.mat

figure; imagesc(imrgb); truesize(gcf,[64, 64]);
for d = 1:length(layerResults)
    result = layerResults{d};
    fprintf('layer %d output is size %d x %d x %d\n', d, size(result, 1)...
        ,size(result, 2), size(result, 3));
end
classprobvec = squeeze(layerResults{end});
[maxprob, maxclass] = max(classprobvec);
fprintf('class is %s with prob %.4f\n', classlabels{maxclass}, maxprob);