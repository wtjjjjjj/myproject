clear all;clc
gamma=0.01;%�ָ���
beta=0.05;%��Ⱦ��
g=0;%������ͼ������
T_Ni=0;
T_Nn=0;
T_Nr=0;
T_Ne=0;
n=1;
%%%%
disp('��������������������������ʼ����������������������')
disp('��--�����������Ӧ����ѡ��Ҫ����������ģ�ͣ�����--��')
Network_kind=input('��ȫ��������硪��1��WSС�������硪��2��BA���硪��3�������룺 ');
if(Network_kind==1)
    disp('��������ʼȫ��������磬���������������')
    N_q=input('�����ܽڵ����� ');
    A=ones(N_q,N_q)-eye(N_q,N_q);
    G=graph(A,'upper');
    p=plot(G,'-k','Layout','force','EdgeAlpha',0.1);
    % p=plot(G1,'-k','Layout','force');
    p.NodeColor = 'b';
    p.MarkerSize =5;
elseif(Network_kind==2)
    disp('��������ʼ����WSС�������磬���������������')
    N_ws=input('�����ܽڵ����� ');
    K_ws=input('�ھӽڵ������ ');
    beta_ws=input('��������:  ');
    G=WattsStrogatz(N_ws,K_ws,beta_ws);
elseif(Network_kind==3)
    disp('��������ʼ����BA���磬���������������')
    sir001;
else
    error('���벻����Ҫ��,��������������');
end
%%%%
disp('-��������������������ԡ�������-��')
disp(['������ܽڵ�����',num2str(size(G.Nodes,1))])
disp(['������ܱ�����',num2str(size(G.Edges,1))])
[D_network]=APL(G);
disp(['�����ƽ��·�����ȣ�',num2str(D_network)])
[C_network]=Cluster(G);
disp(['����ľ���ϵ����',num2str(C_network)])
[N_network]=ADS(G);
disp(['�����ƽ���ȣ�',num2str(N_network)])
%%%%