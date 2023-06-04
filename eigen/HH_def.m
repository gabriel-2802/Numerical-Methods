function [lambda, Q] = HH_def(A, tol, iter)
initial_A = A;
n = length(A);
lambda = zeros(n,1);
Q = zeros(n,n);

for i = 1 : n - 1
    dim = n - i + 1;
    [~, v] = mpd(A, ones(dim,1), iter, tol);
    
    v(1) = v(1) + sign(v(1)) * norm(v);
    H = eye(dim) - 2 * (v * v') / (v' * v);
    A = H * A * H';
    
    lambda(i) = A(1,1);

    [~, x] = mpid(initial_A, ones(n,1), iter, tol, lambda(i) + tol);
    Q(:,i) = x;

    A = A(2:end, 2:end);
end
lambda(end) = A(1,1);
[~, x] = mpid(initial_A, ones(n, 1), iter, tol, lambda(end) + tol);
Q(:,end) = x;
end