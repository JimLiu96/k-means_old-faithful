function runKMeans(K,fileString)
%load data file specified by fileStringfrom Bishop book

X=load(fileString);

%determine and store data set information
N=size(X,1);
D=size(X,2);

%allocate space for the K mu vectors
Kmus=zeros(K,D); % not need to allocate it but it is still worthy

%initialize cluster centers by randomly picking points from the data
rndinds=randperm(N);
Kmus=X(rndinds(1:K),:);

%specify the maximum number of iterations to allow
maxiters=1000;

for iter=1:maxiters
    %assign each data vector to closest mu vector as per Bishop (9.2)
    %do this by first calculating a squared distance matrix where the n,k entry
    %contains the squared distance from the nth data vector to the kth mu vector

    %sqDmat will be an N-by-K matrix with the n,k entry as specfied above
    sqDmat=calcSqDistances(X,Kmus);
    
    %given the matrix of squared distances, determine the closest cluster
    %center for each data vector 

    %R is the "responsibility" matrix
    %R will be an N-by-K matrix of binary values whose n,k entry is set as 
    %per Bishop (9.2)
    %Specifically, the n,k entry is 1 if point n is closest to cluster k,
    %and is 0 otherwise
    Rnk=determineRnk(sqDmat);
    
    KmusOld=Kmus;
    plotCurrent(X,Rnk,Kmus);
    pause(1)
    
    %recalculate mu values based on cluster assignments as per Bishop (9.4)
    Kmus=recalcMus(X,Rnk);
    




    %check to see if the cluster centers have converged.  If so, break.
    if sum(abs(KmusOld(:)-Kmus(:)))<1e-6
        disp(iter);
        break
    end
end

end

