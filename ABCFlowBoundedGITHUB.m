%%
clear all, clc, close all

%Defining Limits
 xmax=5;
 xmin=0;
 ymax=5;
ymin=0;

%defining parameters
A=1;
B=0.5;
C=.5;
nu=1;
tspan=0:.01:50;
X0_1 = [-3 0 1 2.5 2.5 ]; %in river %time series goes to constant
%X0_1 = [1  0 0 2.5 2.5 ]; %in circle Time series still chaotic in X1 X2 not
%X0_1 = [0  0 -1 2.5 2.5 ]; %in sea Time series still chaotic

%Arnold Equation
Arnold =@(t,X)[ A*sin(X(3))+C*cos(X(2));
    B*sin(X(1))+A*cos(X(3));
    C*sin(X(2))+B*cos(X(1));
    nu*cos(X(3));
    nu*sin(X(3))
    ];
%Solving ODE
[t1, X1] = ode45(Arnold, tspan, X0_1);



 % Bounding Method
for k = 1:length(t1)
   
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


%plotting
c1 = X1(:,4) ;
c2 = X1(:,5) ;

c1(end+1) = NaN ;
c2(end+1) = NaN;

c=ones(length(c1),1);

figure

patch(c1,c2,c,'EdgeColor','interp','Marker','.');
     xlabel('X', 'FontSize', 14);
    ylabel('Y', 'FontSize', 14);
    xlim([xmin,xmax])
    ylim([ymin,ymax])
    title('Bounded Path Planning of ABC Flow in River', 'FontSize', 14);
    grid on;
