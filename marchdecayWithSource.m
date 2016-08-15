% marchdecayWithSource.m
%   Improved Euler Method with source (rin)
%       dy/dt=-a*(y(t+1)-y(t))/2 + rin
%       y(0)=b
%
%           Author: Mojolagbe Jamiu


%% set parameters
a=1;
b=9;    %initial height of the tank
rin=5;   
Nt=300;
Tf=10;   % final time

%% initialize
t=linspace(0, Tf, Nt);
deltat=t(2)-t(1);
y=zeros(1, Nt);
y(1)=b;

%% march through array, calculating next y
%   from previous y
%       Improved Euler Method with source 
for it=1:Nt-1
    y(it+1)=y(it)*(1-a*deltat/2)/(1+a*deltat/2) + ...
        rin*deltat/(1+a*deltat/2);
end

%% plot results
plot(t, y, '-');
axis([0 Tf 0 inf]);
xlabel('t');
ylabel('y(t)');
grid on

%% display y(Tf)
clc;
yeq=rin/a;
disp(' ');
disp(['y(Tf) = ', num2str(y(Nt), 15)]);
disp(['yeq = ', num2str(yeq, 15)]);
errorpct = 100*abs(y(Nt)-yeq)/yeq;
disp(['error = ', num2str(errorpct), '%']);