function x = SIT(A, b)
n = numel(b);
x = zeros(n, 1);

for k = 1 : n
    sum = 0;
    for i = 1 : (k - 1)
        sum = sum + A(k,i) * x(i);
    end
x(k) = (b(k) - sum) / A(k,k);
end