function [Q, R] = Givens(A)
[m, n] = size(A);
Q = eye(m);

for p = 1 : min(m - 1 ,n)
    for i = p + 1 : m
        r = sqrt(A(p,p)^2 + A(i,p)^2);
        c = A(p,p) / r;
        s = -A(i,p) / r;
        
        aux = [c -s; s c] * [A(p, p :end); A(i, p:end)];
        A(p, p:end) = aux(1,:);
        A(i, p:end) = aux(2,:);

        aux = [c -s; s c] * [Q(p, 1: end); Q(i, 1 : end)];
        Q(p, 1:m) = aux(1, :);
        Q(i, 1:m) = aux(2, :);
    end
end
Q = Q';
R = A;
end
