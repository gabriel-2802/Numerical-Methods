function [lambda] = shifted_qr_alg(A, tol, iter)
    steps = 0;
    n = length(A);

    for i = 1 : n - 2
        z = A(i + 1 : n, i);
        v = [zeros(i, 1); z];
        v(i + 1) = v(i + 1) + sign(z(1)) * norm(z);

        H = eye(n) - 2 * (v * v') / (v' * v);
        A = H * A * H';
    end

    while 1
        E = A(n - 1 : n, n - 1 : n);
        lmb= eig(E);
        [~, index] = min(abs(lmb - E(2,2)));
        sigma = lmb(index);


        [Q R] = HouseHolder(A - eye(n) * sigma);
        A = R * Q + eye(n) * sigma;

        err = norm(A - diag(diag(A)));
        steps = steps + 1;

        if err < tol || steps == iter
            lambda = diag(A);
            return
        end

    end
end

% in order to not use eig at line 16, we can calcute the values:
%delta =(E(1,1) + E(2,2))^2 - 4 * (-E(1,2) * E(2,1) + E(1,1) * E(2,2));
%lmb = zeros(1,2)
%lmb(1) = (-(E(1,1) + E(2,2)) + sqrt(delta)) / 2;
%lmb(2) = (-(E(1,1) + E(2,2)) - sqrt(delta)) / 2;