function x = SST(A,b)
n = numel(b);
x = zeros(n, 1);

for k = n : -1 : 1
    sum = 0;
    for i = k + 1 : n
        sum = sum + A(k,i) * x(i);
    end
    x(k) = (b(k) - sum) / A(k,k);
end