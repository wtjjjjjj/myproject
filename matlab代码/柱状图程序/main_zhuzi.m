% ����ɢ��ĳ���
clear all;clc
sandian0;%��������ģ��
%% ׼������
X_sandian=[];
Y_sandian=[];
% Z_sandian=[];
ans_kind_1=[];
ans_kind_2=[];
% ans_kind_3=0;
ans_1=[];
ans_2=[];
ans_3=[];
%% ������
P_network_kind=[0.2,0.4,0.6,0.8];
con_network_kind=[0.2,0.4,0.6,0.8];
I_network_kind=[0.2,0.4,0.6,0.8];
b_network_kind=[0.2,0.4,0.6,0.8];
m_1_kind=[0.2,0.4,0.6,0.8];
m_2_kind=[0.2,0.4,0.6,0.8];
m_m_kind=[1,3,6,9];
%% ������Ҫ���ǵĲ�������
disp('-����������ɢ��ͼ���ƿ�ʼ��������-��')
disp('��ѡ���һ��Ҫ���ǵĲ�����ΪX�����ݣ�')
disp('������֪����-1�����������-2����Ϣ��-3�������̶�-4��͸����-5�����Ŷȣ���������-6������������Ϣ�Ĵ���-7��')
ANS_1=input('��ѡ�� ');
disp('��ѡ��ڶ���Ҫ���ǵĲ�����ΪY�����ݣ�')
disp('������֪����-1�����������-2����Ϣ��-3�������̶�-4��͸����-5�����Ŷȣ���������-6������������Ϣ�Ĵ���-7��')
ANS_2=input('��ѡ�� ');
% disp('��ѡ�������Ҫ���ǵĲ�����ΪZ�����ݣ�')
% disp('������֪����-1�����������-2����Ϣ��-3�������̶�-4��͸����-5�����Ŷȣ���������-6������������Ϣ�Ĵ���-7��')
% ANS_3=input('��ѡ�� ');
%% ���β�������ѡ��ͬ����
if (ANS_1==ANS_2)
    error('�������ò���һ��,��������������');
end
% if (ANS_1==ANS_3)
%     error('��һ���������벻����Ҫ��,��������������');
% end
% if (ANS_3==ANS_2)
%     error('��һ���������벻����Ҫ��,��������������');
% end
%% %Ĭ�ϵĲ�����
sandian1
%% ��ʼѭ��
i0=1;
for i_1=1:1:4
    switch ANS_1 %��ʼѡ���һ������
        case 1
            P_network_n1=P_network_kind(i_1);
            ans_kind_1(i_1)=P_network_n1;
        case 2
            con_network_n1=con_network_kind(i_1);
            ans_kind_1(i_1)=con_network_n1;
        case 3
            I_network_n1=I_network_kind(i_1);
            ans_kind_1(i_1)=I_network_n1;
        case 4
            b_network_n1=b_network_kind(i_1);
            ans_kind_1(i_1)=b_network_n1;
        case 5
            m_1=m_1_kind(i_1);
            ans_kind_1(i_1)=m_1;
        case 6
            m_2=m_2_kind(i_1);
            ans_kind_1(i_1)=m_2;
        case 7
            m_m=m_m_kind(i_1);
            ans_kind_1(i_1)=m_m;
        otherwise
            error('��һ���������벻����Ҫ��,��������������');
    end   
        for i_2=1:1:4
            g=0;%������ͼ������
            T_Ni=0;
            T_Nn=0;
            T_Nr=0;
            T_Ne=0;
            n=1;
            NN=size(G.Nodes,1);
            switch ANS_2 %��ʼѡ��ڶ�������
                case 1
                    P_network_n1=P_network_kind(i_2);
                    ans_kind_2(i_2)=P_network_n1;
                case 2
                    con_network_n1=con_network_kind(i_2);
                    ans_kind_2(i_2)=con_network_n1;
                case 3
                    I_network_n1=I_network_kind(i_2);
                    ans_kind_2(i_2)=I_network_n1;
                case 4
                    b_network_n1=b_network_kind(i_2);
                    ans_kind_2(i_2)=b_network_n1;
                case 5
                    m_1=m_1_kind(i_2);
                    ans_kind_2(i_2)=m_1;
                case 6
                    m_2=m_2_kind(i_2);
                    ans_kind_2(i_2)=m_2;
                case 7
                    m_m=m_m_kind(i_2);
                    ans_kind_2(i_2)=m_m;
                otherwise
                    error('�ڶ����������벻����Ҫ��,��������������');
            end
            sandain2 %��ʼ����
            
%             X_sandian(i0,1)=ans_kind_1;
%             Y_sandian(i0,1)=ans_kind_2;
%             Z_sandian(i0,1)=ans_kind_2;
            ans_1(i_2,i_1)=Time_max;%��¼�������
            ans_2(i_2,i_1)=max_num;
            ans_3(i_2,i_1)=Time_zero;
            i0=i0+1;
        end
end
%% �洢����
suju=input('�Ƿ���Ҫ�������ݵ�excel�ļ�����Ҫ����1������Ҫ����0�������ļ��������ӱ�� ');
switch suju
    case 1
        xlswrite('���ӱ��.xlsx',ans_1,'sheet1','B2');
        xlswrite('���ӱ��.xlsx',ans_2,'sheet1','H2');
        xlswrite('���ӱ��.xlsx',ans_3,'sheet1','B8');
        xlswrite('���ӱ��.xlsx',{'��ֵʱ��'},'sheet1','A1');
        xlswrite('���ӱ��.xlsx',{'��ֵ����'},'sheet1','G1');
        xlswrite('���ӱ��.xlsx',{'��ʧʱ��'},'sheet1','A7');
        xlswrite('���ӱ��.xlsx',ans_kind_1,'sheet1','B1');
        xlswrite('���ӱ��.xlsx',ans_kind_2','sheet1','A2');
        xlswrite('���ӱ��.xlsx',ans_kind_1,'sheet1','H1');
        xlswrite('���ӱ��.xlsx',ans_kind_2','sheet1','G2');
        xlswrite('���ӱ��.xlsx',ans_kind_1,'sheet1','B7');
        xlswrite('���ӱ��.xlsx',ans_kind_2','sheet1','A8');
        disp('����������excel�ļ������ɣ��������������');
    case 0
        disp('���������������������������');
end


%% ȼ���߷�ֵʱ��
figure
bar3(ans_1)
zlabel('Time for the burner to reach the peak');
X_label;
Y_label;
% Z_label
%% ȼ���߷�ֵ
figure
bar3(ans_2)
zlabel('Maximum number of burner');
X_label;
Y_label;
%% ȼ������ʧʱ��
figure
bar3(ans_3)
zlabel('The time when the burners disappearedk');
X_label;
Y_label;