function cnnWithImg(imgPath)
    load('CNNparameters.mat');
    load('classlabels.mat');
    im = imread(imgPath);
    im = imresize(im, [32, 32]);
    [~, name, ~] = fileparts(imgPath);

    probvec = forwardPassWithLayersResult(im, filterbanks, biasvectors, ['result/', name]);
    [prob, maxIdx] = max(probvec);
    fprintf('The result is %s with prob %.4f\n', classlabels{maxIdx}, prob);
end