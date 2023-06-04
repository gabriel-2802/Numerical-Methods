function [lambda, Q] = W_def(A, tol, iter)
inital_A = A;
n = length(A);
lambda = zeros(n,1);
Q = zeros(n,n);

for i = 1 : n
    [lmb,v] = mpd(A, ones(n,1), iter, tol);
    
    [~, index] = max(abs(v));
    x_t = 1 / lmb / v(index) * A(index,:);
    A = A - lmb * v * x_t;
    lambda(i) = lmb;

    [~, v] = mpid(inital_A, ones(n, 1), iter, tol, lambda(i) + tol);
    Q(:,i) = v;
end
end