function SQD = calcSqDistances(X,Kmus)
% compute the squared distance w.r.t. each center point for every data
% X; N by D; Kmus: K by D
% ||x-u||^2 = xx' - 2xu' + uu'  N by K
N = size(X,1);
D = size(X,2);
K = size(Kmus,1);
Data_sq = diag(X*X');   % N by 1
Kmus_sq = diag(Kmus*Kmus')';    % 1 by K
trans = 2*X*Kmus';  % N by K
SQD = repmat(Data_sq,1,K) - trans + repmat(Kmus_sq,N,1);
end