function outMat = convolve(inMat,filters,bias)
    outMat = zeros(size(inMat,1),size(inMat,2),size(filters,4));
    for k = 1:size(filters, 4)
        for channel = 1:size(inMat,3)
            outMat(:,:,k)=outMat(:,:,k)+conv2(inMat(:,:,channel), filters(:,:,channel,k), 'same');
        end
        outMat(:,:,k) = outMat(:,:,k) + bias(k);
    end
end

