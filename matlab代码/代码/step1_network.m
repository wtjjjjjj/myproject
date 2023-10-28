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