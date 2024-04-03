%%
%default Bot
clear all, clc, close all


sigma = 10;
beta = 8/3;
rho = 28;
nu=1;
tspan=0:.01:50;
X0_1 = [0 1 0];

lorenz = @(t, X) [ -1*beta * X(1)+ X(2).*X(3);
 -1*sigma*(X(2)-X(3));
-1*X(1).*X(2)+rho.*X(2)-X(3);
    ];

[t1, X1] = ode45(lorenz, tspan, X0_1);

x=zeros(length(t1),1);
y=zeros(length(t1),1);
z=zeros(length(t1),1);
X=zeros(length(t1),1);
Y=zeros(length(t1),1);

x(1)=0;
y(1)=1;
z(1)=0;
X(1)=2.5;
Y(1)=2.5;

for k = 2:(length(t1)-1)
    x(k)=x(k-1)+(.01/6)*X1(k-1,1);
    y(k)=y(k-1)+(.01/6)*X1(k-1,2);
     z(k)=z(k-1)+(.01/6)*X1(k-1,3);
    X(k)=X(k-1)+nu*cos(x(k));
    Y(k)=Y(k-1)+nu*sin(x(k));

end

figure

for k = 1:(length(t1)-1)
    hold on;
   plot(X(k),Y(k), '.','MarkerSize', 15,'Color', [0 0 0], 'LineWidth', 1);

    xlabel('X')
    ylabel('Y')
  xlim([0,5])
   ylim([0,5])

    title('Unbounded Path Planning of Rho=28 (Double Attractor)')
    grid on;
    pause(.0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001)
end



