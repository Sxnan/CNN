function res = softmax(vec)
    alpha = max(vec);   %the max value of input vector
    res = exp(vec - alpha)/sum(exp(vec - alpha));
end