%%
% Lorenz System Parameters
sigma=10;
beta=8/3;
rho=28;
 % Lorenz System Equations   
lorenz = @(t, X) [ -1*beta * X(1)+ X(2).*X(3);
 -1*sigma*(X(2)-X(3));
-1*X(1).*X(2)+rho.*X(2)-X(3)
    ];
% Time Span and Initial Conditions
tspan = linspace(0, 150, 10000); 
X0_1 = [0 1 0  ];
[t1, X1] = ode45(lorenz, tspan, X0_1);

%%Lyapunov Exponent Calculation
xdata = X1(:, 1);
dim = 3;
[~, lag] = phaseSpaceReconstruction(xdata, [], dim);
fs = 1 / mean(diff(t1));
eRange = 25;
lyapunovExponent(xdata, fs, lag, dim, 'ExpansionRange', eRange);