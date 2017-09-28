function cnnWithImg(imgPath)
    load('CNNparameters.mat');
    load('classlabels.mat');
    im = imread(imgPath);
    im = imresize(im, [32, 32]);
    [~, name, ~] = fileparts(imgPath);

    probvec = forwardPassWithLayersResult(im, filterbanks, biasvectors, ['result/', name]);
    [prob, maxIdx] = max(probvec);
    fprintf('The prediction is %s with prob %.4f\n', classlabels{maxIdx}, prob);
    [~, idx] = sort(probvec);
    idx = squeeze(idx);
    idx = flipud(idx);
    fprintf('Top Three prediciton\n');
    for i = 1:3
        fprintf('%d %s %.4f\n', i, classlabels{idx(i)}, probvec(idx(i)))
    end
end