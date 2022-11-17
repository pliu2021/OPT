clear all

P(1) = 3 ;
P(2) = 2 ;
l1 = 3 ;
l2 = 2 ;
theta1 = -pi:0.1:pi ;
theta2 = theta1 ;
[theta1,theta2] = meshgrid(theta1,theta2) ;
Q1 = l1 * cos(theta1) + l2 * cos(theta2) ;
Q2 = l1 * sin(theta1) + l2 * sin(theta2) ;

f = sqrt((3-Q1).^2 + (2-Q2).^2) ;


surf(theta1,theta2,f)
hold on
contourf(theta1,theta2,f)

