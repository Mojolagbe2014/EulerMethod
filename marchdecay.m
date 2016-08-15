% marchdecay.m
%   dy/dt=-a*y
%   y(0)=b
%
%       Author: Mojolagbe Jamiuß


%% set parameters
a=2;
b=5;
Nt=300;
Tf=3;   % final time

%% initialize
t=linspace(0, Tf, Nt);
deltat=t(2)-t(1);
y=zeros(1, Nt);
y(1)=b;

%% march through array, calculating next y
%   from previous y
%       Euler Method
for it=1:Nt-1
    y(it+1)=y(it)-a*y(it)*deltat;
end

%% plot results
plot(t, y, '-');
axis([0 Tf 0 inf]);
xlabel('t');
ylabel('y(t)');
grid on

%% display y(Tf)
clc; 
yexact=y(1)*exp(-a*Tf); % Euler => y(t)=ae^(-kt)
disp(' ');
disp(['y(Tf) = ', num2str(y(Nt), 15)]);
disp(['yexact = ', num2str(yexact, 15)]);
errorpct = 100*abs(y(Nt)-yexact)/yexact;
disp(['error = ', num2str(errorpct), '%']);