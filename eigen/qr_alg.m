function [lambda] = qr_alg(A, tol, iter)
steps = 0;

while 1
 [Q R] = HouseHolder(A);
 A = R * Q;
 steps = steps + 1;

 err = norm(A - diag(diag(A)));
 if err < tol || steps == iter
     lambda = diag(A);
     return
 end
end
end