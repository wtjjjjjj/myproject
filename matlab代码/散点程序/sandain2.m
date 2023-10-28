%  figure
% NodeWeight=randi([1 4],NN,1);
NodeWeight=ones(NN,1);
NodeWeight(1)=2;
unit_statistics;
%%%%%%%%%%%%%%%%%%
Edges=table2array(G.Edges);
[G1,g]=graghColor_withWeight(NodeWeight,Edges,g,n,N,T);
T_B=zeros(NN,1);%用以储存燃烧者B的持续时间
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
legend('D阴燃者','S稳定者','B燃烧者','F抑燃者');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% figure
% plot([1:T],T_Ni,'-',[1:T],T_Nn,'--',[1:T],T_Nr,'.-',[1:T],T_Ne,':.');
% % legend('infected','noninfected','recovered');
% xlabel('Time');
% ylabel('Proportion');
% legend('D','S','B','F');
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
