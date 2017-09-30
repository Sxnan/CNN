function outMat = convolve(inMat,filters,bias)
    outMat = zeros(size(inMat,1),size(inMat,2),size(filters,4));
    for k = 1:size(filters, 4)
        %iterate through all the filter
        for channel = 1:size(inMat,3)
            %convolution for each channel
            outMat(:,:,k)=outMat(:,:,k)+conv2(inMat(:,:,channel), filters(:,:,channel,k), 'same');
        end
        %add bias
        outMat(:,:,k) = outMat(:,:,k) + bias(k);
    end
end

