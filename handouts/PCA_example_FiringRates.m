%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CREATE FIRING RATE DATA
clear all;
close all;
clc

time = 0:0.1:10;
num_timeSteps = numel(time);
num_neurons = 50;

close all

% create matrix of data
matrix_of_fr = zeros(num_neurons,num_timeSteps);

for i = 1:num_neurons
        sigma = abs(1+2.*randn); %choose a random sigma value
        c = abs(5+2.*randn); %choose a random c value
        matrix_of_fr(i,:) = gaussmf(time, [sigma c]);

end

% DO PCA ON THIS DATASET
[signals,PC,V] = PCA_example(matrix_of_fr);

% ANSWER SOME QUESTIONS THAT YOU MIGHT ASK
% 1. What does the neural trajectory look like in a low-dimensional space?

% what 3 neurons look like when plotted against each other
figure()
plot3(matrix_of_fr(1,:),matrix_of_fr(2,:),matrix_of_fr(3,:))
title('Trajectory in "Firing rate space"')

% is there a lower-dimensional representation that we can analyze
figure()
plot(signals(1,:),signals(2,:),'k','linewidth',3)
box off
title('Trajectory in PCA space')

% 2. What are the principal responses of all the neurons?
figure()
subplot(1,2,1)
plot(matrix_of_fr')
box off
title('Original signal')
subplot(1,2,2)
plot(signals')
title('Reprojected data')
box off