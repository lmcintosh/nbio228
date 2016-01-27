% run a 2-dim oscillatory model

%clear workspace
clear all
close all
clc

%time to run ode
time=[0 10];

%set initial conditions
y10=1; 
y20=0;
y0=[y10;y20]; 

[t,y]=ode45(@oscillation,time,y0);

plot(t,y(:,1),'b','linewidth',3) % plot voltage as a function of time
hold on
plot(t,y(:,2),'r','linewidth',3) % plot voltage as a function of time
hold off
box off
xlabel('Time (arbitrary units)')
ylabel('Neural activity')