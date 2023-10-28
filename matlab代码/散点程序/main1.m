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
% NN=length(A);
NN=size(G.Nodes,1);
%%%%%%%%%%%%
disp('���������紴����������ʼ�������۴���ģ�ͣ����������������')
MM=input('�ֶ����ò���������1��Ĭ�ϲ���������0�� ');
if(MM==0)
    T=100;%�ݻ�ʱ��
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
    T=input('�������ݻ�ʱ��T������������ ');
    P_network_n1=input('�����������֪��������̬�ֲ���������ֵ�� ');
    P_network_n2=input('�����������֪��������̬�ֲ���������׼� ');
    con_network_n1=input('�������������Ե���̬�ֲ���������ֵ�� ');
    con_network_n2=input('�������������Ե���̬�ֲ���������׼� ');
    I_network_n1=input('�����������ܵ��й������¼�����Ϣ������̬�ֲ���������ֵ�� ');
    I_network_n2=input('�����������ܵ��й������¼�����Ϣ������̬�ֲ���������׼� ');
    b_network_n1=input('�����������Ϣ����������֮��Ĺ����̶ȵ���̬�ֲ���������ֵ�� ');
    b_network_n2=input('�����������Ϣ����������֮��Ĺ����̶ȵ���̬�ֲ���������׼� ');
    qw=input('�Ƿ���Ȩ���ԣ���������1������������0���� ');
    m_1=input('������������ý�巢����Ϣ��͸���ȣ� ');
    m_2=input('������������ý��Ŀ��Ŷȣ� ');
    m_m=input('����������й�������Ϣ�Ĵ����� ');
    SD=input('������Ϩ�����½����ٶȣ����������� ');
end
%%%%%%%%%%%%%%
pause(2);
disp('���������۴���ģ�ʹ�������������');
n_excel=input('�Ƿ���Ҫ�������ݵ�excel�ļ�����Ҫ����1������Ҫ����0���� ');
%����ÿ������Ļ�������
P_network=normrnd(P_network_n1,P_network_n2,NN,1);
con_network=normrnd(con_network_n1,con_network_n2,NN,1);
I_network=normrnd(I_network_n1,I_network_n2,NN,1);
b_network=normrnd(b_network_n1,b_network_n2,NN,1);
%�޳���ֵ�в�����Ĳ��֣������Ʒ�Χ��0-1
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
T_B=zeros(NN,1);%���Դ���ȼ����B�ĳ���ʱ��
for n=2:T
    T_B=func1(G1,T_B);%���Դ���ȼ����B�ĳ���ʱ��
    [NodeWeight,Edges]=updateNodeState3(G1,gamma,beta,n,P_network,con_network,I_network,b_network,m_1,m_2,T_B,qw,m_m,SD);%
    unit_statistics;
    [G1,g]=graghColor_withWeight(NodeWeight,Edges,g,n,N,T);
end
subplot(2,2,4);
plot([1:T],T_Ni,'-',[1:T],T_Nn,'--',[1:T],T_Nr,'.-',[1:T],T_Ne,':.');
xlabel('Time');
ylabel('Proortion');
legend('D��ȼ��','S�ȶ���','Bȼ����','F��ȼ��');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
plot([1:T],T_Ni,'-',[1:T],T_Nn,'--',[1:T],T_Nr,'.-',[1:T],T_Ne,':.');
xlabel('Time');
ylabel('Proportion');
legend('D','S','B','F');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%��ȼ�������������ֵ��ʱ�䡢ȼ����������ֵ��ȼ��������Ϊ���ʱ��
[Time_max,max_num,Time_zero]=func2(T_Nr);
disp('-����������ȼ���߻������ԡ�������-��')
disp(['ȼ�������������ֵ��ʱ�䣺',num2str(Time_max)]);
disp(['ȼ����������ֵ��',num2str(max_num)]);
disp(['ȼ��������Ϊ���ʱ�䣺',num2str(Time_zero)]);
if (n_excel==1)
    T_D=T_Ni';T_S=T_Nn';T_B=T_Nr';T_F=T_Ne';
    T_O=ones(length(T_D),1);
    for b=1:length(T_D)
        T_O(b)=b;
    end
    xlswrite('����.xlsx',T_O,'sheet1','A2');
    xlswrite('����.xlsx',T_D,'sheet1','B2');
    xlswrite('����.xlsx',T_B,'sheet1','C2');
    xlswrite('����.xlsx',T_S,'sheet1','D2');
    xlswrite('����.xlsx',T_F,'sheet1','E2');
    %%%
    xlswrite('����.xlsx',size(G.Nodes,1),'sheet1','G2');
    xlswrite('����.xlsx',size(G.Edges,1),'sheet1','H2');
    xlswrite('����.xlsx',D_network,'sheet1','I2');
    xlswrite('����.xlsx',C_network,'sheet1','J2');
    xlswrite('����.xlsx',N_network,'sheet1','K2');
    %%%
    xlswrite('����.xlsx',Time_max,'sheet1','G5');
    xlswrite('����.xlsx',max_num,'sheet1','H5');
    xlswrite('����.xlsx',Time_zero,'sheet1','I5');
    %%%
    rowName=cell(1,13);
    rowName{1,1}='���/ʱ��';
    rowName{1,2}='D';
    rowName{1,3}='B';
    rowName{1,4}='S';
    rowName{1,5}='F';
    rowName{1,6}='�ܽڵ���';
    rowName{1,7}='�ܱ���';
    rowName{1,8}='ƽ��·������';
    rowName{1,9}='����ϵ��';
    rowName{1,10}='ƽ����';
    rowName{1,11}='����ֵ��ʱ��';
    rowName{1,12}='��ֵ';
    rowName{1,13}='�����ʱ��';
    xlswrite('����.xlsx',rowName(1,1),'sheet1','A1');
    xlswrite('����.xlsx',rowName(1,2),'sheet1','B1');
    xlswrite('����.xlsx',rowName(1,3),'sheet1','C1');
    xlswrite('����.xlsx',rowName(1,4),'sheet1','D1');
    xlswrite('����.xlsx',rowName(1,5),'sheet1','E1');
    xlswrite('����.xlsx',rowName(1,6),'sheet1','G1');
    xlswrite('����.xlsx',rowName(1,7),'sheet1','H1');
    xlswrite('����.xlsx',rowName(1,8),'sheet1','I1');
    xlswrite('����.xlsx',rowName(1,9),'sheet1','J1');
    xlswrite('����.xlsx',rowName(1,10),'sheet1','K1');
    xlswrite('����.xlsx',rowName(1,11),'sheet1','G4');
    xlswrite('����.xlsx',rowName(1,12),'sheet1','H4');
    xlswrite('����.xlsx',rowName(1,13),'sheet1','I4');
    %%%%
    disp('����������excel�ļ������ɣ��������������');
elseif(n_excel==0)
    disp('���������������������������');
end

