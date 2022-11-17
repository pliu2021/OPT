function beam()
d0 = 0.1 ;
lb = 0 ;
ub = 1 ;
options = optimset('Display','iter',...
                    'MaxFunEvals',200,...
                    'MaxIter',100,...
                    'TolFun',1.e-8,...
                    'TolX',1.e-8) ;
L = 2 ;
E = 2e11 ;
ro = 7800 ;
sigma = 2e8 ;
F = 20000 ;
delta = 0.01 ;

x = fmincon (@(d)objective(d,L,ro),d0,[],[],[],[],...
            lb,ub,@(d)constraints(d,L,F,E,delta,sigma),options)

end

function f = objective(d)
f = ro*L*pi*(d/2)^2 ;
end

function [g,h] = constraints(d)
g(1) = (32 * F * L) / (pi * d^3) - sigma ;
g(2) = (64 * F * L^3) / (3 * E * pi * d^4) - delta ;
h = [] ;
end
