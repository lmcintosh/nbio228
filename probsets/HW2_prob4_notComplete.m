% NBIO 228, Homework 2, Problem 4

% clear the workspace 
clear all; close all; clc

% load the movie-person matrix
movie_person_matrix


% find known entries
idx = find(~isnan(X)); known = X(idx);

% choose an initial X, with the correct known entries
X_0 = X; X_0(isnan(X)) = mean(known)*ones(sum(sum(isnan(X))),1);

p = 5;
num = 1e3;
errVec = nan(num,1);

err = 100; counter = 0;
while err > 1e-6
    
    % store for comparison at the end
    X_1 = X_0;
    
    % take SVD
    % put your code here
    
    % take low-rank approximation
    % put your code here
    
    % fill in matrix with known entries of original matrix
    % put your code here
    
    % compute error
    counter = counter + 1;
    err = norm(X_0-X_1,'fro');
    errVec(counter) = err;
    
end


% set filled in matrix to R for an output
X = X_0;

% find top movie
[~,ind_new] = max(X(:,100))