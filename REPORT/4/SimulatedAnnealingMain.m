clear all ;
close all ;

%% Set the boundary and initial point
UB = 2*pi ;
LB = 0 ;
seed = rand();
rng(seed);
x0 = LB + rand()*(UB-LB) ;

%% Algorithm turning
T = 100 ;
Tf = 5 ;
MaxIter = 1000000 ;
K = 1 ;
a = 0.9 ;

%% Loop
x = x0 ;
Iteration = 1 ;
xopt = x ;
Fopt = f1(xopt) ;
while T > Tf
    while Iteration < MaxIter
        Iteration = Iteration + 1 ;
        lb = max((x - T*(UB - LB)),LB) ;
        ub = min((x + T*(UB - LB)),UB) ;
        y = lb + rand(1, size(x0, 1)).*(ub - lb) ;
        DeltaE = f1(y) - f1(x) ;
        if DeltaE < 0
            x = y ;
            if f1(x) < f1(xopt)
                xopt = x ;
                Fopt = f1(x) ;
            end
        else
            p = rand() ;
            if p < exp(-DeltaE*K/T)
                x = y ;
            end
        end
    end
    T = a*T ;
end
xopt
Fopt

%% Plot
u = LB:0.1:UB ;
for i = 1:1:size(u,2) ;
    v(i) = f1(u(i)) ;
    
end
plot(u,v)
hold on
plot(xopt,Fopt,'*')



