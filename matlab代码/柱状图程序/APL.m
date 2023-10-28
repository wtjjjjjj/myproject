%求平均路径长度Average_path_length
function [D_network]=APL(G)
d=distances(G);
dd=tril(d);
D_network=sum(sum(dd))/nchoosek(length(d),2);
end

