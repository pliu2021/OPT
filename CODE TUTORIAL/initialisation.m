function initialisation()
x0 = [10,10] ;
lb = [-5,-10] ;
ub = [10,20] ;
options = optimset('Display','iter',...
                    'MaxFunEvals',200,...
                    'MaxIter',100,...
                    'TolFun',1.e-8,...
                    'TolX',1.e-8) ;
x = fmincon (@(x)objective(x),x0,[],[],[],[],...
            lb,ub,@(x)constraints(x),options)

end

function f = objective(x)
f = (x(1)-2)^2 + (x(2)-3)^2
end

function [g,h] = constraints(x)
g(1) = -x(1) ;
g(2) = -x(2) ;
h = [] ;
end
