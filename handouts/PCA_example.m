function [signals,PC,V] = PCA_example(data)
% reproduced from Jon Shlens PCA tutorial

% PCA1: Perform PCA using covariance.
% data - MxN matrix of input data
% (M dimensions, N trials)
% signals - MxN matrix of projected data
% PC - each column is a PC
% V - Mx1 matrix of variances

%%%%%%%%%%%%%%%%%%%% STEP ONE: PRE-PROCESS DATA %%%%%%%%%%%%%%%%%%%%%%%%%%%

[M,N] = size(data); %compute size of matrix

% subtract off the mean for each dimension
mn = mean(data,2);
data = data - repmat(mn,1,N);

% normalize(there are many options here)
rng = range(data,2);
data = data./repmat(rng,1,N);

%%%%%%%%%%%% STEP TWO: COMPUTE COVARIANCE MATRIX %%%%%%%%%%%%%%%%%%%%%%%%%%
% calculate the covariance matrix
covariance = 1 / (N-1) * data * data';

%%%%%%%%%%%% STEP THREE: COMPUTE EIGENVALUES AND EIGENVECTORS %%%%%%%%%%%%%
% find the eigenvectors and eigenvalues
[PC, V] = eig(covariance); %each column in PC is an eigenvector (or principal axis)

% take the real part  - since covariance matrix is symmetric, eigenvalues
% should be real. sometimes machine error will make them complex.
PC = real(PC);
V = real(V);

%%%%%%%%%%%% STEP FOUR: COMPUTE VARIANCE EXPLAINED %%%%%%%%%%%%%%%%%%%%%%%%
% extract diagonal of matrix as vector
V = diag(V);

% sort the variances in decreasing order
[~, rindices] = sort(-1*V);
V = V(rindices);
PC = PC(:,rindices);

%%%%%%%%%%%% STEP FOUR: COMPUTE VARIANCE EXPLAINED %%%%%%%%%%%%%%%%%%%%%%%%
% project the data into our new space! each signal is then a visualization
% of the pc's
signals = PC' * data;
