%  figure
% NodeWeight=randi([1 4],NN,1);
NodeWeight=ones(NN,1);
NodeWeight(1)=2;
unit_statistics;
%%%%%%%%%%%%%%%%%%
Edges=table2array(G.Edges);
[G1,g]=graghColor_withWeight(NodeWeight,Edges,g,n,N,T);
T_B=zeros(NN,1);%���Դ���ȼ����B�ĳ���ʱ��
for n=2:T
    T_B=func1(G1,T_B);
    [NodeWeight,Edges]=updateNodeState3(G1,gamma,beta,n,P_network,con_network,I_network,b_network,m_1,m_2,T_B,qw,m_m,SD);%
    unit_statistics;
    [G1,g]=graghColor_withWeight(NodeWeight,Edges,g,n,N,T);
    %     pause(0.5);
end
subplot(2,2,4);
plot([1:T],T_Ni,'-',[1:T],T_Nn,'--',[1:T],T_Nr,'.-',[1:T],T_Ne,':.');
legend('infected','noninfected','recovered');
xlabel('Time');
ylabel('Proortion');
legend('D��ȼ��','S�ȶ���','Bȼ����','F��ȼ��');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% figure
% plot([1:T],T_Ni,'-',[1:T],T_Nn,'--',[1:T],T_Nr,'.-',[1:T],T_Ne,':.');
% % legend('infected','noninfected','recovered');
% xlabel('Time');
% ylabel('Proportion');
% legend('D','S','B','F');
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
