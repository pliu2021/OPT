%% Exercise 2.1.a.2
clear all
close all

x0 = [0.5 0.5] ;
lb = [0,0] ;
ub = [10,10] ;
options = optimset('Display','iter',...
                    'MaxFunEvals',200,...
                    'MaxIter',100,...
                    'TolFun',1.e-8,...
                    'TolX',1.e-8) ;
x = fmincon (@(x)objective(x),x0,[],[],[],[],...
            lb,ub,@(x)constraints(x),options)



function f = objective(x)
f = sqrt((x(1)-1)^2+(x(2)-5)^2) + sqrt((x(1)-9)^2+(x(2)-5)^2) ;
end

function [g,h] = constraints(x)

A = [1 5];
B = [9 5];
C = [5 5];

n = 100 ;
for i = 0:n 
    M = A+(i/n)*(x-A);
    d(i+1) = norm(M-C);
end
D1 = min(d) ;
for i = 0:n 
    M = B+(i/n)*(x-B);
    d(i+1) = norm(M-C);
end
D2 = min(d) ;


g(1) = 2 - D1 ;
g(2) = 2 - D2 ;
h = [] ;
end