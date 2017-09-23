function outMat = fullyConnected(inMat, filters, bias)
    outMat = zeros(1,1,size(filters,4));
    for l = 1:size(filters, 4)
        for k = 1:size(inMat, 3)
            outMat(1,1,l) = outMat(1,1,l) + sum(sum(inMat(:, :, k) .* filters(:, :, k, l)));
        end
        outMat(1,1,l) = outMat(1,1,l) + bias(l);
    end
end