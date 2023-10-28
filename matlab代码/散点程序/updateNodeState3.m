function [NodeWeight,Edges] = updateNodeState3(G1,gamma,beta,n,P_network,con_network,I_network,b_network,m_1,m_2,T_B,qw,m_m,SD)
Nodes=table2array(G1.Nodes);
Edges=table2array(G1.Edges);
Edges1=Edges(:,1:2);
gamma;
NodeWeight=Nodes;
for node=1:size(G1.Nodes,1)
    if Nodes(node) == 1 %��ȼ��D����תȼ����B������ȼ��F
        r = rand(); % ����һ��0��1�������
        %%%%%%%%%��ȼ��Dתȼ����B
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
%          a_B(node)=(E_NB(node)+0.3)*P(node)*(1-M);%���հ�
         a_B(node)=(E_NB(node))*P(node)*(1-M);%���԰�
%        a_B(node)=(1-E_NB(node))*P(node)*(1-M);
        %%%%%%%%%%%%%%
        if r < a_B(node)   % 
            NodeWeight(node) = 2 ;%���ڵ�״̬���óɡ�B��,��ȼ����
        end
        %%%%%%%%%%%��ȼ��Dת��ȼ��F
        h=find_NF(G1,Nodes,node);
        T_NF(node)=con_network(node)*(h)/degree(G1,node);
        E_NF(node)=c(node)*m(node)*T_NF(node);
%         a_F(node)=(1-E_NF(node))*(1-P(node))*M;
%         a_F(node)=(E_NF(node))*(1-P(node))*M;
%         a_F(node)=(1-E_NB(node)+0.4)*(1-P(node))*M;%���հ�
          a_F(node)=(1-E_NB(node))*(1-P(node))*M;%���԰�
        %%%%%%%%%%%%%%
%         if (a_B(node) <=r) && (r<=(a_F(node) +a_B(node) ) )  % 
       if r < a_F(node)   %
            NodeWeight(node) = 4 ;%���ڵ�״̬���óɡ�F��,����Ⱦ��
        end
        %%%%%%%%%%%
    end
    if Nodes(node) == 2 %ȼ����Bת�ȶ���S
        r = rand(); % ����һ��0��1�������
        h=find_NS(G1,Nodes,node);
%       a_S(node)=(1-exp(-n))*h/degree(G1,node);
%          a_S(node)=1-exp(-1*T_B(node)*h/degree(G1,node)-0.01);
%      a_S(node)=1-exp(-0.01*T_B(node));%���հ�
      a_S(node)=1-exp(-0.01*T_B(node)/SD);
        if r < a_S(node)    % 
            NodeWeight(node) = 3 ;%���ڵ�״̬���óɡ�S��,���ȶ���
        end
    end
%%%%%%%%%%%%%%%%%%%%%%
%     elseif Nodes(node) == 3 %�׸���
%         r = rand(); % ����һ��0��1�������
%         k = 0 ; % �����ھ��еĸ�Ⱦ������
%         for i=1:size(Edges1) % �鿴�����ھ�״̬
%             if ((Edges1(i,1) == node&&Nodes(Edges1(i,2))==1)||(Edges1(i,2) == node&&Nodes(Edges1(i,1))==1))%�������ھ��Ǹ�Ⱦ�ߣ���k��1
%                 k = k + 1;
%             end
%         end
%         if r < 1 - (1 - beta).^k  % �׸��߱���Ⱦ
%             NodeWeight(node) = 1 ;
%         end
%     elseif Nodes(node) == 4 %�׸���
        
    end
end
 
 