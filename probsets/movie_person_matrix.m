%%% generate a movie - person matrix

numMovies = 500;
numPeople = 1000;

% compute low-dim matrix
rng default % for reproducibility

mat1 = (-100 + 200.*rand(500,1))*(-100 + 200.*rand(1,1000));
mat2 = (-100 + 200.*rand(500,1))*(-100 + 200.*rand(1,1000));
mat3 = (-100 + 200.*rand(500,1))*(-100 + 200.*rand(1,1000));
mat4 = (-100 + 200.*rand(500,1))*(-100 + 200.*rand(1,1000));

fullX = mat1+mat2+mat3+mat4;

% compute highest-ranking movie for 100th customer - use this to check at
% the end!
[~,ind] = max(fullX(:,100));

% take away 20% of entries, including the element above
X = fullX;
takeAway = randperm(numel(X)); 
X(takeAway(1:0.2*numel(X))) = NaN;
X(ind,100) = NaN;