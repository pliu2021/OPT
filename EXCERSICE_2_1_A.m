%% Exercise 2.1.a.1
clear all
close all

x0 = [8 2] ;
lb = [0,0] ;
ub = [10,10] ;
options = optimset('Display','iter',...
                    'MaxFunEvals',200,...
                    'MaxIter',100,...
                    'TolFun',1.e-8,...
                    'TolX',1.e-8) ;
x = fmincon (@(x)objective(x),x0,[],[],[],[],...
            lb,ub,@(x)constraints(x),options)
%% Plot
plot(1,5,'*')
hold on
plot(9,5,'*')
hold on

for i = 1:1:360
    ox(i) = 5+2*cos(i*pi/180) ;
    oy(i) = 5+2*sin(i*pi/180) ;

end
    plot(ox,oy)
    hold on

Seg1x = [1 x(1)];
Seg1y = [5 x(2)];
plot(Seg1x,Seg1y)
Seg2x = [x(1) 9];
Seg2y = [x(2) 5];
plot(Seg2x,Seg2y)
rectangle('Position',[0,0,10,10])


%% 
function f = objective(x)
f = sqrt((x(1)-1)^2+(x(2)-5)^2) + sqrt((x(1)-9)^2+(x(2)-5)^2) ;
end

function [g,h] = constraints(x)

A = [1 5];
B = [9 5];
C = [5 5];
D = [x(1) x(2)];
AD = [A-D 0];
AC = [A-C 0];
CD = [C-D 0];
BD = [B-D 0];
CB = [C-B 0];
CROSSNORM_ACCD = norm(cross(AC,CD),2);
H1 = CROSSNORM_ACCD/norm(AD,2);
CROSSNORM_CBCD = norm(cross(CB,CD),2);
H2 = CROSSNORM_CBCD/norm(BD,2);

g(1) = 2 - H1 ;
g(2) = 2 - H2 ;
h = [] ;
end