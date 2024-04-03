
%%
%default Bot
clear all, clc, close all

% X1(end,4:5)

sigma = 10;
beta = 8/3;
rho = 28;
nu=1;
tspan=0:.1:1000;
X0_1 = [0 1 0  4 4];

lorenz = @(t, X) [ -1*beta * X(1)+ X(2).*X(3);
 -1*sigma*(X(2)-X(3));
-1*X(1).*X(2)+rho.*X(2)-X(3);
nu*cos(X(1));
nu*sin(X(1))
    ];

[t1, X1] = ode45(lorenz, tspan, X0_1);

c1 = X1(:,4) ;
c2 = X1(:,5) ;

c1(end+1) = NaN ;
c2(end+1) = NaN;
%c=1:length(c1);
c=ones(length(c1),1);

figure
%patch(c1,c2,c,'EdgeColor','interp','Marker','.','MarkerFaceColor','flat','MarkerSize', 15);
patch(c1,c2,c,'EdgeColor','interp','Marker','.','MarkerSize', 15);
     xlabel('X', 'fontsize', 14)
    ylabel('Y', 'fontsize', 14)
   %xlim([xmin,xmax])
   %ylim([ymin,ymax])
    title('Bounded Path Planning of Rho=28 (Double Attractor), Y+Z,Y+Z', 'fontsize', 14)
   % grid on;

%%
figure

for k = 1:length(t1)
    hold on;
   plot(X1(k,4), X1(k,5), '.','MarkerSize', 15,'Color', [0 0 0], 'LineWidth', 1);

    xlabel('X')
    ylabel('Y')
  xlim([0,5])
   ylim([0,5])

    title('Unbounded Path Planning of Rho=28 (Double Attractor)')
    grid on;
    %pause(.0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001)
end



%%
% Unbounded Bot Running for 1000 seconds at velocity of 10.
%

clear all, clc, close all
count=0;
xmax=5;
xmin=0;
ymax=5;
ymin=0;
sigma = 10;
beta = 8/3;
rho = 28;
%tspan=0:1:50;
tspan=0:.1:50;
nu=1;
X0_1 = [0 1 0 4 4 ];

lorenz = @(t, X) [ -1*beta * X(1)+ X(2).*X(3);
 -1*sigma*(X(2)-X(3));
-1*X(1).*X(2)+rho.*X(2)-X(3);
nu*cos(X(1));
nu*sin(X(1))
    ];


[t1, X1] = ode45(lorenz, tspan, X0_1);

figure
        for k = 1:length(t1)
            hold on;

           plot(X1(k,4), X1(k,5), '.','MarkerSize', 15,'Color', [0 0 0], 'LineWidth', 1);

            xlabel('X')
            ylabel('Y')
           xlim([xmin,xmax])
           ylim([xmin,xmax])

           %xlim([-10,10])
           %ylim([-10,10])

            title('X-Y bot, unbounded')
            %grid on;
            pause(1*10^-1000001)
            count=count+1
        end

%TimeSpan
%         figure;
%         plot(tspan, X1(:,1))
%         figure
%         plot(tspan, X1(:,2))
%         figure;
%         plot(tspan, X1(:,3))
%         figure;
%         plot(tspan, X1(:,4))
%         figure
%         plot(tspan, X1(:,5))

%lyaExp1=lyapunovExponent(X1(:,1), 10)
%lyaExp2=lyapunovExponent(X1(:,5), 10)

% lyaExp1=lyapunovExponent(X1(:,1), 10)
% lyaExp2=lyapunovExponent(X1(:,2), 10)
% lyaExp3=lyapunovExponent(X1(:,3), 10)

