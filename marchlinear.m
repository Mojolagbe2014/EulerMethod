% marchlinear.m
%   dy/dt=a
%   y(0)=b
%
%       Author: Mojolagbe Jamiu


%% set parameters
a=1.2;
b=0.5;
Nt=7;
Tf=1;   % final time

%% initialize
t=linspace(0, Tf, Nt);
deltat=t(2)-t(1);
y=zeros(1, Nt);
y(1)=b;

%% march through array, calculating next y
%   from previous y
for it=1:Nt-1
    y(it+1)=y(it)+a*deltat;
end

%% plot results
plot(t, y, '-o');
axis([0 Tf 0 inf]);
xlabel('t');
ylabel('y(t)');
grid on