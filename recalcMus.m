function Kmus = recalcMus(X,Rnk)
% get the Kmus from the mean value of the cluster
% mu_k = frac{\sum_n{r_{nk}X_n}{\sum_n{r_{nk}}}
% X: N by D
% Rnk: N by K
% Kmus: K by D
N = size(X,1);
K = size(Rnk,2);
D = size(X,2);
sumCluster = Rnk'*X;    % K by D
numCluster = sum(Rnk)';  % K by 1
normMat = repmat(numCluster,1,D);
Kmus = sumCluster./normMat;
end