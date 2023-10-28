
gamma=0.01;%恢复率
beta=0.05;%传染率
g=0;%用来画图计数的
T_Ni=0;
T_Nn=0;
T_Nr=0;
T_Ne=0;
n=1;
NN=size(G.Nodes,1);
%%%%%%%%%%%%
disp('———网络创建结束，开始创建舆论传播模型，请输入参数———')
% MM=input('手动设置参数请输入1、默认参数请输入0： ');
MM=0;
if(MM==0)
    T=150;%演化时间
    P_network_n1=0.5;
    P_network_n2=0.2;
    con_network_n1=0.5;
    con_network_n2=0.2;
    I_network_n1=0.5;
    I_network_n2=0.2;
    b_network_n1=0.5;
    b_network_n2=0.2;
    qw=1;
%     m_1=0.3;
%     m_2=0.4;
    m_1=0.6;
    m_2=0.8;
    m_m=5;
    SD=1;
elseif(MM==1)
    T=input('请输入演化时间T（正整数）： ');
    P_network_n1=input('请输入个体认知能力的正态分布参数—均值： ');
    P_network_n2=input('请输入个体认知能力的正态分布参数—标准差： ');
    con_network_n1=input('请输入个体从众性的正态分布参数—均值： ');
    con_network_n2=input('请输入个体从众性的正态分布参数—标准差： ');
    I_network_n1=input('请输入个体接受到有关舆情事件的信息量的正态分布参数—均值： ');
    I_network_n2=input('请输入个体接受到有关舆情事件的信息量的正态分布参数—标准差： ');
    b_network_n1=input('请输入个体信息与受众网民之间的关联程度的正态分布参数—均值： ');
    b_network_n2=input('请输入个体信息与受众网民之间的关联程度的正态分布参数—标准差： ');
    qw=input('是否考虑权威性（考虑输入1、不考虑输入0）： ');
    m_1=input('请输入政府和媒体发布信息的透明度： ');
    m_2=input('请输入政府和媒体的可信度： ');
    m_m=input('请输入接收有关舆情信息的次数： ');
    SD=input('请输入熄灭率下降的速度（正整数）： ');
end
%%%%%%%%%%%%%%
% pause(1);
disp('———舆论传播模型创建结束———');
% n_excel=input('是否需要生成数据的excel文件（需要输入1、不需要输入0）： ');
n_excel=0;
%生成每个个体的基础属性
P_network=normrnd(P_network_n1,P_network_n2,NN,1);
con_network=normrnd(con_network_n1,con_network_n2,NN,1);
I_network=normrnd(I_network_n1,I_network_n2,NN,1);
b_network=normrnd(b_network_n1,b_network_n2,NN,1);
%剔除数值中不合理的部分，即控制范围在0-1
while(length(find(P_network<=0))>0)||(length(find(P_network>1))>0)
    P_network(find(P_network<=0))=normrnd(0.2,0.2,length(find(P_network<=0)),1);
    P_network(find(P_network>1))=normrnd(0.2,0.2,length(find(P_network>1)),1);
end
while(length(find(con_network<=0))>0)||(length(find(con_network>1))>0)
    con_network(find(con_network<=0))=normrnd(0.2,0.2,length(find(con_network<=0)),1);
    con_network(find(con_network>1))=normrnd(0.2,0.2,length(find(con_network>1)),1);
end
while(length(find(I_network<=0))>0)||(length(find(I_network>1))>0)
    I_network(find(I_network<=0))=normrnd(0.2,0.2,length(find(I_network<=0)),1);
    I_network(find(I_network>1))=normrnd(0.2,0.2,length(find(I_network>1)),1);
end
while(length(find(b_network<=0))>0)||(length(find(b_network>1))>0)
    b_network(find(b_network<=0))=normrnd(0.2,0.2,length(find(b_network<=0)),1);
    b_network(find(b_network>1))=normrnd(0.2,0.2,length(find(b_network>1)),1);
end

