%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CREATE HEIGHT AND WEIGHT DATA
weight = 100:150;
height = 0.5*weight+10*ones(size(weight))+8*randn(size(weight));
measureMatrix = [weight; height]; %weights and heights in arbitrary units

% DO PCA ON THIS DATASET
[signals,PC,V] =PCA_example(measureMatrix); % this will find new axes for the data, and plot the data in PC space

% ANSWER SOME QUESTIONS THAT YOU MIGHT ASK
% 1. What are the principal axes? Columns of this matrix:
PC

% 2. How much variance is explained by each component?
figure(1)
propVar = cumsum(V)/sum(V);
stem(propVar)
axis([0 3 0 1.1])
box off

% 3. What does the data look like in a new dimensional space
figure(2)
subplot(1,2,1)
plot(measureMatrix(1,:),measureMatrix(2,:),'ok')
box off
xlabel('Weight')
ylabel('Height')


subplot(1,2,2)
plot(signals(1,:),signals(2,:),'ok')
box off
xlabel('PC 1')
ylabel('PC 2')
axis([-1 1 -1 1])