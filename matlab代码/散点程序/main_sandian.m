% ����ɢ��ĳ���
clear all;clc
sandian0;%��������ģ��
%% ׼������
X_sandian=[];
Y_sandian=[];
Z_sandian=[];
ans_kind_1=0;
ans_kind_2=0;
ans_kind_3=0;
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
disp('��ѡ�������Ҫ���ǵĲ�����ΪZ�����ݣ�')
disp('������֪����-1�����������-2����Ϣ��-3�������̶�-4��͸����-5�����Ŷȣ���������-6������������Ϣ�Ĵ���-7��')
ANS_3=input('��ѡ�� ');
%% ���β�������ѡ��ͬ����
if (ANS_1==ANS_2)
    error('��һ���������벻����Ҫ��,��������������');
end
if (ANS_1==ANS_3)
    error('��һ���������벻����Ҫ��,��������������');
end
if (ANS_3==ANS_2)
    error('��һ���������벻����Ҫ��,��������������');
end
%% %Ĭ�ϵĲ�����
sandian1
%% ��ʼѭ��
i0=1;
for i_1=1:1:4
    switch ANS_1 %��ʼѡ���һ������
        case 1
            P_network_n1=P_network_kind(i_1);
            ans_kind_1=P_network_n1;
        case 2
            con_network_n1=con_network_kind(i_1);
            ans_kind_1=con_network_n1;
        case 3
            I_network_n1=I_network_kind(i_1);
            ans_kind_1=I_network_n1;
        case 4
            b_network_n1=b_network_kind(i_1);
            ans_kind_1=b_network_n1;
        case 5
            m_1=m_1_kind(i_1);
            ans_kind_1=m_1;
        case 6
            m_2=m_2_kind(i_1);
            ans_kind_1=m_2;
        case 7
            m_m=m_m_kind(i_1);
            ans_kind_1=m_m;
        otherwise
            error('��һ���������벻����Ҫ��,��������������');
    end
    for i_2=1:1:4
        switch ANS_2 %��ʼѡ��ڶ�������
            case 1
                P_network_n1=P_network_kind(i_2);
                ans_kind_2=P_network_n1;
            case 2
                con_network_n1=con_network_kind(i_2);
                ans_kind_2=con_network_n1;
            case 3
                I_network_n1=I_network_kind(i_2);
                ans_kind_2=I_network_n1;
            case 4
                b_network_n1=b_network_kind(i_2);
                ans_kind_2=b_network_n1;
            case 5
                m_1=m_1_kind(i_2);
                ans_kind_2=m_1;
            case 6
                m_2=m_2_kind(i_2);
                ans_kind_2=m_2;
            case 7
                m_m=m_m_kind(i_2);
                ans_kind_2=m_m;
            otherwise
                error('�ڶ����������벻����Ҫ��,��������������');
        end
        for i_3=1:1:4
            g=0;%������ͼ������
            T_Ni=0;
            T_Nn=0;
            T_Nr=0;
            T_Ne=0;
            n=1;
            NN=size(G.Nodes,1);
            switch ANS_3 %��ʼѡ��ڶ�������
                case 1
                    P_network_n1=P_network_kind(i_3);
                    ans_kind_3=P_network_n1;
                case 2
                    con_network_n1=con_network_kind(i_3);
                    ans_kind_3=con_network_n1;
                case 3
                    I_network_n1=I_network_kind(i_3);
                    ans_kind_3=I_network_n1;
                case 4
                    b_network_n1=b_network_kind(i_3);
                    ans_kind_3=b_network_n1;
                case 5
                    m_1=m_1_kind(i_3);
                    ans_kind_3=m_1;
                case 6
                    m_2=m_2_kind(i_3);
                    ans_kind_3=m_2;
                case 7
                    m_m=m_m_kind(i_3);
                    ans_kind_3=m_m;
                otherwise
                    error('�������������벻����Ҫ��,��������������');
            end
            sandain2 %��ʼ����
            X_sandian(i0,1)=ans_kind_1;
            Y_sandian(i0,1)=ans_kind_2;
            Z_sandian(i0,1)=ans_kind_3;
            ans_1(i0,1)=Time_max;%��¼�������
            ans_2(i0,1)=max_num;
            ans_3(i0,1)=Time_zero;
            i0=i0+1;
        end
    end
end
%% �洢����
sx=[];
sx(:,1)=X_sandian;
sx(:,2)=Y_sandian;
sx(:,3)=Z_sandian;
sx(:,4)=ans_1;
sx(:,5)=ans_2;
sx(:,6)=ans_3;
suju=input('�Ƿ���Ҫ�������ݵ�excel�ļ�����Ҫ����1������Ҫ����0�������ļ�����ɢ���� ');
switch suju
    case 1
        xlswrite('ɢ����.xlsx',sx,'sheet1','A2');
        xlswrite('ɢ����.xlsx',{'����1-X'},'sheet1','A1');
        xlswrite('ɢ����.xlsx',{'����2-Y'},'sheet1','B1');
        xlswrite('ɢ����.xlsx',{'����3-Z'},'sheet1','C1');
        xlswrite('ɢ����.xlsx',{'��ֵʱ��'},'sheet1','D1');
        xlswrite('ɢ����.xlsx',{'��ֵ����'},'sheet1','E1');
        xlswrite('ɢ����.xlsx',{'��ʧʱ��'},'sheet1','F1');
        disp('����������excel�ļ������ɣ��������������');
    case 0
        disp('���������������������������');
end
%% ����X,Y,Z����
X = sx(:,1);
Y = sx(:,2);
Z = sx(:,3);
%% ȼ���߷�ֵʱ��
figure
ZF = sx(:,4);
scatter3(X,Y,Z,110*(1.3-((ZF-min(ZF))/max(ZF-min(ZF)))),ZF,'filled');
c = colorbar;
c.Label.String = 'Time for the burner to reach the peak';
X_label;
Y_label
Z_label
%% ȼ���߷�ֵ
figure
ZF = sx(:,5);
scatter3(X,Y,Z,130*ZF/(max(ZF)-20),ZF,'filled');
c = colorbar;
c.Label.String = 'Maximum number of burner';
X_label
Y_label
Z_label
%% ȼ������ʧʱ��
figure
ZF = sx(:,6);
scatter3(X,Y,Z,110*(1.3-((ZF-min(ZF))/max(ZF-min(ZF)))),ZF,'filled');
c = colorbar;
c.Label.String = 'The time when the burners disappeared';
X_label
Y_label
Z_label