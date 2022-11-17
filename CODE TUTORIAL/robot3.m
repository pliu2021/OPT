clear all
x1 = -10:0.1:10 ;
x2 = x1 ;
[X1,X2] = meshgrid(x1,x2) ;
F = (X1-2).^2+(X2-3).^2 ;
surf(X1,X2,F)