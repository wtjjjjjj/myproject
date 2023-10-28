%求平均度Average_node_size
function [N_network]=ADS(G)
d=degree(G);
N_network=sum(d)/length(d);
end