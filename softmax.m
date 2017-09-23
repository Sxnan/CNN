function res = softmax(vec)
    alpha = max(vec);
    res = exp(vec - alpha)/sum(exp(vec - alpha));
end