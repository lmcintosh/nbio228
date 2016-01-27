%%% simulate a leaky integrate and fire neuron using Euler's method
% differential eq: dV/dt = f(v) = (1/tau)*(ir - v);
% rules - if v(t) approaches v_th, then the neuron fires a "spike" and
% resets to rest.

% parameters in the model
v_th = -40; % mV
v_r = -70; % mV
ir = -20; % mV
tau = 0.5; %time

% to set up the integration
T = 2; deltaT = 0.01;
time = 0:deltaT:T;
v = nan(size(time));
v(1) = v_r;

% for loop the implements the forward-Euler method
for i = 1:numel(time)-1
    
    % the Euler step
    
    % the spiking rule

end

% plot the result
plot(time,v,'k','linewidth',5)
box off
set(gca,'fontsize',25)




