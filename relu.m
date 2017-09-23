function outMat = relu(inMat)
    outMat = (inMat > 0) .* inMat;
end

