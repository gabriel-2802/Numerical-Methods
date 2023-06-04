function [lambda, x] = mpid(A, x0, iter, tol, alpha)
n = length(A);
[lambda, x] = mpi(A - alpha * eye(n), x0, iter, tol);
lambda = lambda + alpha;
end