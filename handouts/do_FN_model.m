% run the Fitzhugh-Nagumo model

%clear workspace
clear all
close all
clc

%time to run ode
time=[0 100];

%set initial conditions
v0=0; 
w0=0;
y0=[v0;w0]; 

[t,y]=ode45(@FN_model,time,y0);

plot(t,y(:,1),'k','linewidth',3) % plot voltage as a function of time
box off
xlabel('Time (arbitrary units)')
ylabel('Something like voltage, but not voltage')