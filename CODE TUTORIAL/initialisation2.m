function initialisation2()
x0 = [1  1] ;
lb = [0  0] ;
ub = [500 500] ;
options = optimset('Display','iter',...
                    'MaxFunEvals',200,...
                    'MaxIter',100,...
                    'TolFun',1.e-8,...
                    'TolX',1.e-8) ;
x = fmincon (@(x)objective(x),x0,[],[],[],[],...
            lb,ub,@(x)constraints(x),options)

end

function f = objective(x)
f = -(50*x(1)+100*x(2))
end

function [g,h] = constraints(x)
g(1) = 10*x(1)+5*x(2)-2500 ;
g(2) = 4*x(1)+10*x(2)-2000 ;
g(3) = x(1)+1.5*x(2)-450;
g(4) = -x(1) ;
g(5) = -x(2) ;
h = [] ;
end
