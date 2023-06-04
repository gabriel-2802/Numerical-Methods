function w = Runge_Kutta4 (a , b , n , alpha , f)
h = ( b - a) / n;
t = a ;

w = zeros (n + 1, 1) ;
w (1) = alpha ;

for i = 1 : n
    K1 = h * f (t , w(i) );
    K2 = h * f (t + h /2 , w(i) + K1 /2) ;
    K3 = h * f (t + h /2 , w(i) + K2 /2) ;
    K4 = h * f (t + h , w(i) + K3 );
    w(i + 1) = w(i) + ( K1 + 2* K2 + 2* K3 + K4 ) / 6;
    t = a + i*h ;
end
end
