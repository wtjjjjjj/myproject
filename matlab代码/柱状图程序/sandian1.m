
gamma=0.01;%�ָ���
beta=0.05;%��Ⱦ��
g=0;%������ͼ������
T_Ni=0;
T_Nn=0;
T_Nr=0;
T_Ne=0;
n=1;
NN=size(G.Nodes,1);
%%%%%%%%%%%%
disp('���������紴����������ʼ�������۴���ģ�ͣ����������������')
% MM=input('�ֶ����ò���������1��Ĭ�ϲ���������0�� ');
MM=0;
if(MM==0)
    T=150;%�ݻ�ʱ��
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
% pause(1);
disp('���������۴���ģ�ʹ�������������');
% n_excel=input('�Ƿ���Ҫ�������ݵ�excel�ļ�����Ҫ����1������Ҫ����0���� ');
n_excel=0;
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

