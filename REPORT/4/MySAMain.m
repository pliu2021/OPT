function MySAMain()
seed=2324 ; rng(seed)
x0=[-30 25] ; lb=[-40 -40]; ub=[40 40]; 
x= [lb(1):0.1:ub(1)]; y= [lb(2):0.1:ub(2)]; 
figure(1) ;clf;figure(1) ; hold on
[X Y]= meshgrid(x,y) ;
f = MySAfunc2(X,Y) ;
contourf(X,Y,f) ; drawnow
options = saoptimset('Display','iter',... 
 'OutputFcns',@MyOutFunsa, ...
 'InitialTemperature', 200,...
 'TolFun',1.e-10,...
 'MaxIter',1000,...
 'MaxFunEvals',5000,...
 'StallIterLimit',200);
[x f ]=simulannealbnd(@MySAfunction,x0,lb,ub,options)
end

function [stop ,optnew , changed]=MyOutFunsa(options,state, flag) 
stop=false; optnew=options; changed=0 ; 
x=state.x ;fval=state.fval;
bestx=state.bestx; bestfval= state.bestfval ; 
funccount= state.funccount; 
switch flag
 case 'init'
 disp('intial Value ')
 plot(x(1),x(2),'b*')
case 'iter'
 plot(x(1),x(2),'g+')
 case 'interrupte'
 case 'done'
 plot( x(1),x(2),'r+') 
 disp('final population') 
 stop=true;
 otherwise 
end
drawnow
%[funccount bestx bestfval x fval ] 
end
 
function f=MySAfunction(x)
f = (x(1)-2).^2 +(x(2)-2).^2; 
end
function f=MySAfunc2(X,Y) 
f = (X-2).^2 +(Y-2).^2;
end