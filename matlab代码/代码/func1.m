%计算燃烧者B的持续时间
function T_B=func1(G1,T_B)
  Nodes=table2array(G1.Nodes);
  NodeWeight=Nodes;
  for i=1:length(NodeWeight)
      if NodeWeight(i)==2
          T_B(i)=T_B(i)+1;
      end
  end
  T_B;
end