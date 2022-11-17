clear all ;
close all ;

%% Set the boundary and initial point
UB = [5 5] ;
LB = [-5 -5] ;
x0 = [1 1] ;

%% Algorithm turning
T = 100 ;
Tf = 2 ;
MaxIter = 100000 ;
K = 1 ;
a = 0.99 ;

%% Loop

x = x0 ;
Iteration = 1 ;
xopt = x ;
Fopt = f2(xopt) ;
while T>Tf
    while Iteration < MaxIter
        Iteration = Iteration + 1 ;
        lb = max((x - T*(UB - LB)),LB) ;
        ub = min((x + T*(UB - LB)),UB) ;
        y = lb + rand(1, size(x0, 1)).*(ub - lb) ;
        DeltaE = f2(y) - f2(x) ;
        if DeltaE < 0
            x = y ;
            if f2(x) < f2(xopt)
                xopt = x ;
                Fopt = f2(x) ;
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

u = LB:0.5:UB ;
v = u ;
[U,V] = meshgrid(u,v) ;
    for i = 1:1:size(U,1)
        for j = 1:1:size(U,1)
            w = [U(1,i) V(j,1)] ;
            W(i,j) = f2(w);
        end    
    end
figure1 = figure ;
figure2 = figure ;
figure(figure1) ;
surf(U,V,W)
hold on
plot(xopt(1),xopt(2),'*','LineWidth',2)
figure(figure2) ;
contourf(U,V,W,'ShowText','on')
hold on
plot(xopt(1),xopt(2),'*','LineWidth',2)