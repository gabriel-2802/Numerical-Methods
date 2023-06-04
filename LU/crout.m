function [L, U] = crout(A)
n = sqrt(numel(A));
L = zeros(n,n);
U = eye(n,n);

for p = 1 : n
    for i = p : n
        sum = 0;
        for k = 1 : p - 1
            sum = sum + L(i,k) * U(k,p);
        end
        L(i,p) = A(i,p) - sum;
    end
    for j = p + 1 : n
        sum = 0;
        for k = 1 : p - 1
            sum = sum + L(p,k) * U(k, j);
        end
        U(p,j) = (A(p,j) - sum) / L(p,p);
    end
end
end