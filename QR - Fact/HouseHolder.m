function [Q, R] = HouseHolder(A)
[m, n] = size(A);
Q = eye(m);

for p = 1 : min(m - 1,n)
    v = zeros(m, 1);
    v(p:end) = A(p:end, p);
   
    if (v(p) == 0)
        sig = 1;
    else
        sig = sign(v(p));
    end

    v(p) = v(p) + sig * norm(v);
    H = eye(m) - 2 *( v * v') / (v'  * v);
    A = H * A;
    Q = H * Q;
end
R = A;
Q = Q';
end