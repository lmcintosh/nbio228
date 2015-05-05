function [dx] = FN_model(t,y)

% Description of the model:
% Taken from: http://www.scholarpedia.org/article/FitzHugh-Nagumo_model
%
% This is meant to be a 2-dimensional simplification of the HH model of
% spike generation in the giant squid axon. The voltage-like variable is a
% cubic function, and the recovery variable has linear dynamics that
% provides slow negative feedback. This model is a hybrid of the van der
% Pol model, which is a model for oscillators, and the Hodgkin-Huxley
% equations. 

% V - the membrane potential. 
% W - recovery variable. This variable is something that increases while
% the voltage is high, and will ultimately cause the end of an action
% potential. This value will then relax when the voltage is low, allowing
% the membrane potential to slowly increase (if there is enough injected
% current). 
% Iapp - magnitude of current injected.

v = y(1);
w = y(2);

dx=zeros(2,1); %dx = [dv/dt; dw/dt]

% set parameters
a = 0.08;
b = 0.7;
c = 0.8;
Iapp = 0.5;

% these are the differential equations
dx(1) = v-(v^3)/3-w+Iapp;

dx(2) = a*(v+b-c*w);

return
