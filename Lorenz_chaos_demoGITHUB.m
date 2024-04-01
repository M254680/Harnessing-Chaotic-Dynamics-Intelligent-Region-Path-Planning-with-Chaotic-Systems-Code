clear all, clc, close all

% Lorenz System Parameters
sigma = 10;
beta = 8/3;
rho = 28;

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

% Plotting the trajectory
 hold on;
  plot3(X1(1,1), X1(1,2), X1(1,3), '*','MarkerSize', 15, 'LineWidth', 2, 'Color', 'Green');
    plot3(X1(end,1), X1(end,2), X1(end,3), '*','MarkerSize', 15, 'LineWidth', 2, 'Color', 'Red');
for k = 1:length(t1)
    plot3(X1(k,1), X1(k,2), X1(k,3), '.','MarkerSize', 15, 'LineWidth', 2);
end

    xlabel('x', 'Fontsize', 14)
    ylabel('y', 'Fontsize', 14)
    zlabel('z', 'Fontsize', 14)
    title('Lorenz System, r=28', 'Fontsize', 14)
    grid on;
    view([-45 30])
    legend('Start', 'End')




