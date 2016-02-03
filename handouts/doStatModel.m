% example fitting a statistical model using fminunc

% make some data
t = linspace(0,3600,3600*50); %an hour of data, sampled at 50 Hz 
stim1 = cos(t).^2; %stimulus 2
stim2 = cos(0.1*t).^2; %stimulus 2
fr = exp(1*stim1+2*stim2-5); % underlying firing rate - this mapping is what we want to discover

% make the spike train - this is what we would observe in the lab.
% we also know the values of stim1 and stim2 over time, and we will guess
% that fr = exp(a*stim1 + b*stim2+c) - but we don't know what a, b , or c are.
y = poissrnd(fr)'; %spike train - data that we observe

% define the stimulus matrix
stim = [stim1' stim2' ones(size(stim1'))]; % matrix of stimuli, time bins x 3
% we have two parameters we want to find - a, b,and c (see above) - call these
% theta (theta = [a;b];)

% choose initial guess for theta 
init = [1;1;1];

% we are going to report the gradient and hessian - tell fminunc we are
% going to do this
opts = optimset('Gradobj','on','Hessian','on');

% optimize!
[theta] = fminunc(@(theta) myFun(theta,stim,y),init,opts);

% look at our estimate of the firing rate for first couple seconds
fr_hat = exp(stim*theta);

plot(t(1:200),fr(1:200),'k','linewidth',3)
hold on
plot(t(1:200),fr_hat(1:200),'--r','linewidth',3)
hold off
xlabel('Seconds')
ylabel('FR (spikes per time bin)')
% nice match!


