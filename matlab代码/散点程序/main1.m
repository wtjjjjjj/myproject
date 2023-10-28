clear all;clc
gamma=0.01;%恢复率
beta=0.05;%传染率
g=0;%用来画图计数的
T_Ni=0;
T_Nn=0;
T_Nr=0;
T_Ne=0;
n=1;
%%%%
disp('———————————程序开始———————————')
disp('—--——请输入对应数字选择要创建的网络模型：——--—')
Network_kind=input('（全局耦合网络——1、WS小世界网络——2、BA网络——3）请输入： ');
if(Network_kind==1)
    disp('———开始全局耦合网络，请输入参数———')
    N_q=input('网络总节点数： ');
    A=ones(N_q,N_q)-eye(N_q,N_q);
    G=graph(A,'upper');
    p=plot(G,'-k','Layout','force','EdgeAlpha',0.1);
    % p=plot(G1,'-k','Layout','force');
    p.NodeColor = 'b';
    p.MarkerSize =5;
elseif(Network_kind==2)
    disp('———开始创建WS小世界网络，请输入参数———')
    N_ws=input('网络总节点数： ');
    K_ws=input('邻居节点个数： ');
    beta_ws=input('重连概率:  ');
    G=WattsStrogatz(N_ws,K_ws,beta_ws);
elseif(Network_kind==3)
    disp('———开始创建BA网络，请输入参数———')
    sir001;
else
    error('输入不符合要求,请重新启动程序');
end
%%%%
disp('-—————网络基本属性————-—')
disp(['网络的总节点数：',num2str(size(G.Nodes,1))])
disp(['网络的总边数：',num2str(size(G.Edges,1))])
[D_network]=APL(G);
disp(['网络的平均路径长度：',num2str(D_network)])
[C_network]=Cluster(G);
disp(['网络的聚类系数：',num2str(C_network)])
[N_network]=ADS(G);
disp(['网络的平均度：',num2str(N_network)])
%%%%
% NN=length(A);
NN=size(G.Nodes,1);
%%%%%%%%%%%%
disp('———网络创建结束，开始创建舆论传播模型，请输入参数———')
MM=input('手动设置参数请输入1、默认参数请输入0： ');
if(MM==0)
    T=100;%演化时间
    P_network_n1=0.5;
    P_network_n2=0.2;
    con_network_n1=0.5;
    con_network_n2=0.2;
    I_network_n1=0.5;
    I_network_n2=0.2;
    b_network_n1=0.5;
    b_network_n2=0.2;
    qw=1;
    m_1=0.3;
    m_2=0.4;
    m_m=3;
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
pause(2);
disp('———舆论传播模型创建结束———');
n_excel=input('是否需要生成数据的excel文件（需要输入1、不需要输入0）： ');
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
NodeWeight=ones(NN,1);
NodeWeight(1)=2;
unit_statistics;
Edges=table2array(G.Edges);
figure
[G1,g]=graghColor_withWeight(NodeWeight,Edges,g,n,N,T);
T_B=zeros(NN,1);%用以储存燃烧者B的持续时间
for n=2:T
    T_B=func1(G1,T_B);%用以储存燃烧者B的持续时间
    [NodeWeight,Edges]=updateNodeState3(G1,gamma,beta,n,P_network,con_network,I_network,b_network,m_1,m_2,T_B,qw,m_m,SD);%
    unit_statistics;
    [G1,g]=graghColor_withWeight(NodeWeight,Edges,g,n,N,T);
end
subplot(2,2,4);
plot([1:T],T_Ni,'-',[1:T],T_Nn,'--',[1:T],T_Nr,'.-',[1:T],T_Ne,':.');
xlabel('Time');
ylabel('Proortion');
legend('D阴燃者','S稳定者','B燃烧者','F抑燃者');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
plot([1:T],T_Ni,'-',[1:T],T_Nn,'--',[1:T],T_Nr,'.-',[1:T],T_Ne,':.');
xlabel('Time');
ylabel('Proportion');
legend('D','S','B','F');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%求燃烧者数量到达峰值的时间、燃烧者数量峰值、燃烧者数量为零的时间
[Time_max,max_num,Time_zero]=func2(T_Nr);
disp('-—————燃烧者基本属性————-—')
disp(['燃烧者数量到达峰值的时间：',num2str(Time_max)]);
disp(['燃烧者数量峰值：',num2str(max_num)]);
disp(['燃烧者数量为零的时间：',num2str(Time_zero)]);
if (n_excel==1)
    T_D=T_Ni';T_S=T_Nn';T_B=T_Nr';T_F=T_Ne';
    T_O=ones(length(T_D),1);
    for b=1:length(T_D)
        T_O(b)=b;
    end
    xlswrite('数据.xlsx',T_O,'sheet1','A2');
    xlswrite('数据.xlsx',T_D,'sheet1','B2');
    xlswrite('数据.xlsx',T_B,'sheet1','C2');
    xlswrite('数据.xlsx',T_S,'sheet1','D2');
    xlswrite('数据.xlsx',T_F,'sheet1','E2');
    %%%
    xlswrite('数据.xlsx',size(G.Nodes,1),'sheet1','G2');
    xlswrite('数据.xlsx',size(G.Edges,1),'sheet1','H2');
    xlswrite('数据.xlsx',D_network,'sheet1','I2');
    xlswrite('数据.xlsx',C_network,'sheet1','J2');
    xlswrite('数据.xlsx',N_network,'sheet1','K2');
    %%%
    xlswrite('数据.xlsx',Time_max,'sheet1','G5');
    xlswrite('数据.xlsx',max_num,'sheet1','H5');
    xlswrite('数据.xlsx',Time_zero,'sheet1','I5');
    %%%
    rowName=cell(1,13);
    rowName{1,1}='序号/时间';
    rowName{1,2}='D';
    rowName{1,3}='B';
    rowName{1,4}='S';
    rowName{1,5}='F';
    rowName{1,6}='总节点数';
    rowName{1,7}='总边数';
    rowName{1,8}='平均路径长度';
    rowName{1,9}='聚类系数';
    rowName{1,10}='平均度';
    rowName{1,11}='到峰值的时间';
    rowName{1,12}='峰值';
    rowName{1,13}='到零的时间';
    xlswrite('数据.xlsx',rowName(1,1),'sheet1','A1');
    xlswrite('数据.xlsx',rowName(1,2),'sheet1','B1');
    xlswrite('数据.xlsx',rowName(1,3),'sheet1','C1');
    xlswrite('数据.xlsx',rowName(1,4),'sheet1','D1');
    xlswrite('数据.xlsx',rowName(1,5),'sheet1','E1');
    xlswrite('数据.xlsx',rowName(1,6),'sheet1','G1');
    xlswrite('数据.xlsx',rowName(1,7),'sheet1','H1');
    xlswrite('数据.xlsx',rowName(1,8),'sheet1','I1');
    xlswrite('数据.xlsx',rowName(1,9),'sheet1','J1');
    xlswrite('数据.xlsx',rowName(1,10),'sheet1','K1');
    xlswrite('数据.xlsx',rowName(1,11),'sheet1','G4');
    xlswrite('数据.xlsx',rowName(1,12),'sheet1','H4');
    xlswrite('数据.xlsx',rowName(1,13),'sheet1','I4');
    %%%%
    disp('———数据excel文件已生成，程序结束———');
elseif(n_excel==0)
    disp('—————程序结束—————');
end

