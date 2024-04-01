 %%
clear all, clc, close all

% Lorenz System Parameters
sigma = 10;
beta = 8/3;
rho = 20;

 % Lorenz System Equations    
             lorenz = @(t, X) [ -1*beta * X(1)+ X(2).*X(3);
                  -1*sigma*(X(2)-X(3));
                  -1*X(1).*X(2)+rho.*X(2)-X(3)
                 ];

% Time Span and Initial Conditions
tspan=0:.001:50;
X0_1 = [0 1 0];


% Solving the Lorenz System for two initial conditions
[t1, X1] = ode45(lorenz, tspan, X0_1);


% Plotting the time series
figure 
subplot(3,1,1)
plot(t1,X1(:,1))
title('Lorenz System Time Series, rho=20', 'FontSize', 14)
    xlabel('t', 'Fontsize', 14)
    ylabel('x(t)', 'Fontsize', 14)
subplot(3,1,2)
plot(t1,X1(:,2))
    xlabel('t', 'Fontsize', 14)
    ylabel('y(t)', 'Fontsize', 14)
subplot(3,1,3)
plot(t1,X1(:,3))
    xlabel('t', 'Fontsize', 14)
    ylabel('z(t)', 'Fontsize', 14)
