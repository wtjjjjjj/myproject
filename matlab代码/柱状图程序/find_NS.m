%寻找周围的S稳定者
function [h] = find_NS(G1,Nodes,node)
n_node=neighbors(G1,node);
h=0;
for i=1:length(n_node)
    if(Nodes(n_node(i))==3)
        h=h+1;
    end
end
end