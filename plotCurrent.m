function    plotCurrent(X,Rnk,Kmus)
[N,D]=size(X);
K=size(Kmus,1);

clf;
figure(1);
hold on;

InitColorMat= [1 0 0;   
               0 1 0;   
               0 0 1;
               0 0 0;
               1 1 0; 
               1 0 1; 
               0 1 1;
               0.5 1 0.5];

KColorMat=InitColorMat(1:K,:);

colorVec=Rnk*KColorMat;
muColorVec=eye(K)*KColorMat;
scatter(X(:,1),X(:,2),[],colorVec)

scatter(Kmus(:,1),Kmus(:,2),200,muColorVec,'d','filled');
axis equal;
hold off;
end