
function found = findProblem(A)
[m,n] = size(A);
found = 0;
for i = 1:m
    if found
        break;
    end     
    for j = 1:n
        if isnan(A(i,j))||isinf(A(i,j))
            found = 1;
            break;
        end
    end
end
end