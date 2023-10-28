%—∞’“÷‹ŒßµƒB»º…’’ﬂ
function [h] = find_NB(G1,Nodes,node)
n_node=neighbors(G1,node);
h=0;
for i=1:length(n_node)
    if(Nodes(n_node(i))==2)
        h=h+1;
    end
end
end