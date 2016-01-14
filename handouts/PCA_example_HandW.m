% NBIO 228
% tutorial - applying PCA to datasets. This is a simple data set that you
% probably wouldn't apply PCA to, but hopefully serves as an instructive
% example of what PCA is doing.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CREATE HEIGHT AND WEIGHT DATA FOR 100 PEOPLE
weight = 100 + 80.*rand(100,1); % weights for 100 people
height = 0.5*weight+10*ones(size(weight))+5*randn(size(weight)); % let's say height is some function of weight
data = [weight'; height']; %weights and heights in arbitrary units - 2x100 matrix

% first - let's plot this data, before we do anything, to see what it looks like
plot(data(1,:),data(2,:),'ok')
xlabel('Weight')
ylabel('Height')

% note that this data can probably be described by just 1-dimension - we
% don't really need 2 because height and weight are so correlated. In other
% words, knowing the height of a person leaves us with a pretty good guess
% of what their weight is.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% APPLY PCA TO THIS DATA SET

[M,N] = size(data); %compute size of matrix - we'll use these numbers later

% subtract off the mean for each dimension
data = data - mean(data,2)*ones(1,N);

% normalize(there are many options here)
data = data./(range(data,2)*ones(1,N));

%%%%%%%%%%%% STEP TWO: COMPUTE COVARIANCE MATRIX %%%%%%%%%%%%%%%%%%%%%%%%%%
% calculate the covariance matrix
covariance = cov(data'); % this is a 2x2 symmetric matrix. 
% the values along the diagonal correspond to the variance of weights and
% variance of heights, while values off the diagonal correspond to the
% covariance between height and weight. Note that the off-diagonal values
% are positive, because height and weight are positively correlated.

%%%%%%%%%%%% STEP THREE: COMPUTE EIGENVALUES AND EIGENVECTORS %%%%%%%%%%%%%
% find the eigenvectors and eigenvalues of the covariance matrix
[PC, V] = eig(covariance); %each column in PC is an eigenvector (or principal axis)

% extract diagonal of matrix as vector
V = diag(V);

% sort the variances in decreasing order
[~, rindices] = sort(V,'descend');
V = V(rindices);
PC = PC(:,rindices);

% let's take a look at the PC's and see what they are corresponding to

% plot our data first
plot(data(1,:),data(2,:),'ok')
hold on
plot([0 (PC(1,1))],[0 (PC(2,1))],'r','linewidth',2) 
plot([0 (PC(1,2))],[0 (PC(2,2))],'b','linewidth',2)
hold off
legend('Data','1st eigenvector','2nd eigenvector')
axis equal
xlabel('Weight')
ylabel('Height')

% one note about the plotting - the PC's are indicating the DIRECTION along
% which the most variance is captured.

% let's take a look at the eigenvalues (the spectrum)
stem(V)
axis([0.5 2.5 0 inf])
ylabel('Eigenvalue')
% note that there are only 2 eigenvalues (for each direction), and that one
% of them is pretty big - corresponding to the fact that most of our data
% is well-captured by just one dimension.

% we can also compute the 'variance explained', because the sum of the
% eigenvalues correspond to the variance in our data
propVar = cumsum(V)/sum(V);
stem(propVar)
axis([0.5 2.5 0 inf])

% this plot shows that most of the variance in our data is explained by the
% first component

%%%%%%%%%%%% STEP FOUR: PROJECT THE DATA %%%%%%%%%%%%%%%%%%%%%%%%
% project the data into our new space! each signal is then a visualization
% of the pc's
Y = PC' * data;


% What does the data look like in a new dimensional space?
subplot(1,2,1)
plot(data(1,:),data(2,:),'ok')
box off
xlabel('Weight')
ylabel('Height')


subplot(1,2,2)
plot(Y(1,:),Y(2,:),'ok')
box off
xlabel('PC 1')
ylabel('PC 2')
axis([-1 1 -1 1])