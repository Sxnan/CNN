function f = maxPool(im)
   
   getRowSize = size(im,1);
   getColSize = size(im,2);
   getChanSize = size(im,3);
   half = getRowSize / 2;
   final = zeros(half,half,getChanSize);
   
   for i = 1:getChanSize
       s = im(:,:,i);
       iniRow = 1;
       iniCol = 1;
       outputRow = 1;
       outputCol = 1;
       outPut = zeros(half,half);
       while iniRow < getRowSize
           while iniCol < getColSize
               outPut(outputRow,outputCol) = max(max(s(iniRow:iniRow+1, iniCol:iniCol+1)));
               outputCol = outputCol + 1;
               iniCol = iniCol+2;
           end
           outputRow = outputRow + 1;
           iniRow = iniRow + 2;
           iniCol = 1;
           outputCol = 1;
       end
       
       final(:,:,i) = outPut;
      
   end        

       
     f = final;

end
