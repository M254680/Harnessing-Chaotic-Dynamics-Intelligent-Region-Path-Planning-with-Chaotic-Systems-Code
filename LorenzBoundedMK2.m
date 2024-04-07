%%
% Bounded Bot Running for 1000 seconds with 2 pings per second at velocity of 1

%
clear all, clc, close all

%Defining Variables
xmax=5;
xmin=0;
ymax=5;
ymin=0;

sigma = 10;
beta = 8/3;
rho = 28;
nu=2;

%tspan=0:5:100;
tspan=0:1:5;

%Lorenz System 
X0_1 = [1 1 1 2.5 2.5];


lorenz = @(t, X) [ -1*beta * X(1)+ X(2).*X(3);
 -1*sigma*(X(2)-X(3));
-1*X(1).*X(2)+rho.*X(2)-X(3);
nu*cos(X(1) );
nu*sin(X(1) )
    ];


[t1, X1] = ode45(lorenz, tspan, X0_1);

for k = 1:length(t1)
   
   % Bounding Method
if rem(X1(k,4),2*xmax) >= 0 
            if rem(X1(k,4),2*xmax) >xmax
                X1(k,4) = xmax-rem(X1(k,4),xmax);
            
            else
                if rem(X1(k,4),xmax)==0
                    if rem(X1(k,4),2*xmax)==0
                        X1(k,4)=xmin;
                    else 
                        X1(k,4)=xmax;    
                    end
                else
                    X1(k,4) = rem(X1(k,4),xmax);
                end
              
            end
else
            if rem(X1(k,4),2*xmax) >-xmax
                X1(k,4) = -rem(X1(k,4),xmax);
            else
                X1(k,4) = xmax+rem(X1(k,4),xmax);
            end
end
    
  
  

if rem(X1(k,5),2*ymax) >= 0 
            if rem(X1(k,5),2*ymax) >ymax
                X1(k,5) = ymax-rem(X1(k,5),ymax);
            
            else
                if rem(X1(k,5),ymax)==0
                    if rem(X1(k,5),2*ymax)==0
                        X1(k,5)=ymin;
                    else 
                        X1(k,5)=ymax; 
                    end
                else
                    X1(k,5) = rem(X1(k,5),ymax);
                end
              
            end
else
            if rem(X1(k,5),2*ymax) >-ymax
                X1(k,5) = -rem(X1(k,5),ymax);
            else
                X1(k,5) = ymax+rem(X1(k,5),ymax);
            end
end
end

c1 = X1(:,4) ;
c2 = X1(:,5) ;

c1(end+1) = NaN ;
c2(end+1) = NaN;
%c=1:length(c1);
c=ones(length(c1),1);
% 
figure
%patch(c1,c2,c,'EdgeColor','interp','Marker','.','MarkerFaceColor','flat','MarkerSize', 15);
%patch(c1,c2,c,'EdgeColor','interp','Marker','.','MarkerSize', 15);
patch(c1,c2,c,'EdgeColor','interp','Marker','.')
     xlabel('X', 'fontsize', 14)
    ylabel('Y', 'fontsize', 14)
%    xlim([xmin,xmax])
%    ylim([ymin,ymax])
    title('Bounded Path Planning of Rho=28', 'fontsize', 14)
   % grid on;
   
   XYcord=X1(:,4:5);
   
   
save("TESTLorenzBounded.mat",'XYcord')
