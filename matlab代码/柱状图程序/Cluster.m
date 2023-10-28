%求聚类系数Clustering_coefficient
function [C_network]=Cluster(G)
C_1=adjacency(G);
a=full(C_1);
n=length(a);
for i=1:n
    m=find(a(i,:));
    ta=a(m,m);
    Lta=tril(ta);
    if length(m)==0 || length(m)==1
        c(i)=0;
    else
        c(i)=sum(sum(Lta))/nchoosek(length(m),2);
    end
end
C_network=mean(c);
end

