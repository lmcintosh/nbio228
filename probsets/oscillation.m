function [dy] = oscillation(t,y)

% Description of the model:

y1 = y(1);
y2 = y(2);

dy=zeros(2,1); %dy = [dy1/dt; dy2/dt]

% a set of parameters that give oscillations

n11 = 0;
n12 = -1;
n21 = 1;
n22 = 0;


% another set of parameters that give oscillations
%{
n11 = -1;
n12 = -1;
n21 = 2;
n22 = 1;
%}


% these are the differential equations
dy(1) = n11*y1+n12*y2;
dy(2) = n21*y1+n22*y2;

return
