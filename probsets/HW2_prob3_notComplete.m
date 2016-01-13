% NBIO 228, Homework 2, Problem 3

% clear the workspace 
clear all; close all; clc

% enter in all of the data
England = [375 57 245 1472 105 54 193 147 1102 720 253 685 488 198 360 1374 156];
NIreland = [135 47 267 1494 66 41 209 93 674 1033 143 586 355 187 334 1506 139];
Scotland = [458 53 242 1462 103 62 184 122 957 566 171 750 418 220 337 1572 147];
Wales = [475 73 227 1582 103 64 235 160 1137 874 265 803 570 203 365 1256 175];

% do PCA to see what it looks like
data = [England; NIreland; Scotland; Wales]';

% subtract off the mean for each dimension
% put your code here

% calculate the covariance matrix
% put your code here

% find the eigenvectors and eigenvalues
% put your code here

% extract diagonal of matrix as vector
% put your code here

% sort the variances in decreasing order
[~, rindices] = sort(-1*V);
V = V(rindices);
PC = PC(:,rindices);

% project the original data set
Y = real(PC') * data;

