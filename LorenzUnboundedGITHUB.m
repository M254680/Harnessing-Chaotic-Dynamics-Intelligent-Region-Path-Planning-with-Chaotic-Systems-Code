%%
clear all, clc, close all



%Parameters
sigma = 10;
beta = 8/3;
rho = 20;
%rho=28;
nu=1;
tspan=0:.001:50;
X0_1 = [1 1 1 2.5 2.5];

% Lorenz System and Mapping Method
lorenz = @(t, X) [ -1*beta * X(1)+ X(2).*X(3);
 -1*sigma*(X(2)-X(3));
-1*X(1).*X(2)+rho.*X(2)-X(3);
nu*cos(X(1) );
nu*sin(X(1) )
    ];

%Solving System
[t1, X1] = ode45(lorenz, tspan, X0_1);

%Plotting
c1 = X1(:,4) ;
c2 = X1(:,5) ;

c1(end+1) = NaN ;
c2(end+1) = NaN;
c=ones(length(c1),1);
% 
figure
patch(c1,c2,c,'EdgeColor','interp','Marker','.')
     xlabel('X', 'fontsize', 14)
    ylabel('Y', 'fontsize', 14)
    title('Bounded Path Planning of Rho=20', 'fontsize', 14)
     title('Bounded Path Planning of Rho=28', 'fontsize', 14)
   grid on;
   
