function RnkMat = determineRnk(sqDmat)
% calculate the label for each cluster
% 1 for belong, 0 for not belong
N = size(sqDmat,1);
K = size(sqDmat,2);
RnkMat = zeros(N,K);
[~,minIndex] = min(sqDmat,[],2);
positionVec = 1:N;
idxVec = N*(minIndex-1) + positionVec';
RnkMat(idxVec) = 1;
end