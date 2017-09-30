function f = maxPool(im)
   
   getRowSize = size(im,1);
   getColSize = size(im,2);
   getChanSize = size(im,3);
   half = getRowSize / 2;        %get the half size of the original matrix.
   final = zeros(half,half,getChanSize);
   
   for i = 1:getChanSize   %from 1 to final channel
       s = im(:,:,i);   %input channel
       iniRow = 1;
       iniCol = 1;
       outputRow = 1;
       outputCol = 1;
       outPut = zeros(half,half);
       while iniRow < getRowSize   %start from first two rows.
           while iniCol < getColSize  %start from first two columns.
               %find max value in 2*2 matrix and put it in the output matrix
               outPut(outputRow,outputCol) = max(max(s(iniRow:iniRow+1, iniCol:iniCol+1)));
               outputCol = outputCol + 1;   %increase output matrix column by 1. 
               iniCol = iniCol+2;         %increase input matrix column by 2.  
           end
           outputRow = outputRow + 1; %increase output matrix row by 1. 
           iniRow = iniRow + 2; %increase input matrix row by 2. 
           iniCol = 1;     %reset input matrix column to 1.
           outputCol = 1;  %reset output matrix column to 1.
       end
       
       final(:,:,i) = outPut; %get output matrix
      
   end        

       
     f = final;

end
