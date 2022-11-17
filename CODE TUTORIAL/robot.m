clear all


theta1 = 0:0.1:6 ;
theta2 = theta1 ;
[THETA1,THETA2] = meshgrid(theta1,theta2) ;
P(1) = 3 ;
P(2) = 2 ;
l1 = 3 ;
l2 = 2 ;
Q(1) = l1 * cos(THETA1) + l2 * cos(THETA2) ;
Q(2) = l1 * sin(THETA1) + l2 * sin(THETA2) ;
f = norm(P_Q) ;
surf(THETA1,THETA2,f)

