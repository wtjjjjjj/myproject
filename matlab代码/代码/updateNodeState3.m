function [NodeWeight,Edges] = updateNodeState3(G1,gamma,beta,n,P_network,con_network,I_network,b_network,m_1,m_2,T_B,qw,m_m,SD)
Nodes=table2array(G1.Nodes);
Edges=table2array(G1.Edges);
Edges1=Edges(:,1:2);
gamma;
NodeWeight=Nodes;
for node=1:size(G1.Nodes,1)
    if Nodes(node) == 1 %阴燃者D——转燃烧者B或者抑燃者F
        r = rand(); % 生成一个0到1的随机数
        %%%%%%%%%阴燃者D转燃烧者B
        c(node)=1-P_network(node);
        if(qw==1)
            m(node)=1-(degree(G1,node)/max(degree(G1)));
        elseif(qw==0)
            m(node)=1;
        end
        h=find_NB(G1,Nodes,node);
        T_NB(node)=con_network(node)*(h+3)/degree(G1,node);
        E_NB(node)=c(node)*m(node)*T_NB(node);
%         P(node)=1+(I_network(node)-1)*exp(b_network(node)*(1-m(node)));
%         P(node)=1+(I_network(node)-1)*exp(b_network(node)*(1-m(node)));
        P(node)=1+(I_network(node)-1)*exp(b_network(node)*(1-m_m));
%         M=m_1*(1-exp(1/m_2));
        M=m_1*(1-exp(-m_2));
%          a_B(node)=(E_NB(node)+0.3)*P(node)*(1-M);%最终版
         a_B(node)=(E_NB(node))*P(node)*(1-M);%测试版
%        a_B(node)=(1-E_NB(node))*P(node)*(1-M);
        %%%%%%%%%%%%%%
        if r < a_B(node)   % 
            NodeWeight(node) = 2 ;%将节点状态设置成“B”,即燃烧者
        end
        %%%%%%%%%%%阴燃者D转抑燃者F
        h=find_NF(G1,Nodes,node);
        T_NF(node)=con_network(node)*(h)/degree(G1,node);
        E_NF(node)=c(node)*m(node)*T_NF(node);
%         a_F(node)=(1-E_NF(node))*(1-P(node))*M;
%         a_F(node)=(E_NF(node))*(1-P(node))*M;
%         a_F(node)=(1-E_NB(node)+0.4)*(1-P(node))*M;%最终版
          a_F(node)=(1-E_NB(node))*(1-P(node))*M;%测试版
        %%%%%%%%%%%%%%
%         if (a_B(node) <=r) && (r<=(a_F(node) +a_B(node) ) )  % 
       if r < a_F(node)   %
            NodeWeight(node) = 4 ;%将节点状态设置成“F”,即抑染者
        end
        %%%%%%%%%%%
    end
    if Nodes(node) == 2 %燃烧者B转稳定者S
        r = rand(); % 生成一个0到1的随机数
        h=find_NS(G1,Nodes,node);
%       a_S(node)=(1-exp(-n))*h/degree(G1,node);
%          a_S(node)=1-exp(-1*T_B(node)*h/degree(G1,node)-0.01);
%      a_S(node)=1-exp(-0.01*T_B(node));%最终版
      a_S(node)=1-exp(-0.01*T_B(node)/SD);
        if r < a_S(node)    % 
            NodeWeight(node) = 3 ;%将节点状态设置成“S”,即稳定者
        end
    end
%%%%%%%%%%%%%%%%%%%%%%
%     elseif Nodes(node) == 3 %易感者
%         r = rand(); % 生成一个0到1的随机数
%         k = 0 ; % 计算邻居中的感染者数量
%         for i=1:size(Edges1) % 查看所有邻居状态
%             if ((Edges1(i,1) == node&&Nodes(Edges1(i,2))==1)||(Edges1(i,2) == node&&Nodes(Edges1(i,1))==1))%如果这个邻居是感染者，则k加1
%                 k = k + 1;
%             end
%         end
%         if r < 1 - (1 - beta).^k  % 易感者被感染
%             NodeWeight(node) = 1 ;
%         end
%     elseif Nodes(node) == 4 %易感者
        
    end
end
 
 