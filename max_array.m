%%returns the row and column of the maximum value of the array
%%for ensc 180 under dr. tsang
%%this code is written by me and me alone, no plagiarism
%%signed, devon burnham 301394066


function max_array(arr, rows, cols)

maxVal = 0; %would be $minvalue if bounds weren't specified
row=NaN;
col=NaN;

for i = 1 : rows
    for j = 1:cols
        if arr(i,j) >= maxVal
            maxVal = arr(i,j);  %updates the max value when a higher one is found
            row=i;
            col=j;
        end
    end
end        

fprintf("%d | %d\n", row, col)  %displays 

end