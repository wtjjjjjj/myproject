% 绘制散点的程序
clear all;clc
sandian0;%建立网络模型
%% 准备工作
X_sandian=[];
Y_sandian=[];
% Z_sandian=[];
ans_kind_1=[];
ans_kind_2=[];
% ans_kind_3=0;
ans_1=[];
ans_2=[];
ans_3=[];
%% 参数库
P_network_kind=[0.2,0.4,0.6,0.8];
con_network_kind=[0.2,0.4,0.6,0.8];
I_network_kind=[0.2,0.4,0.6,0.8];
b_network_kind=[0.2,0.4,0.6,0.8];
m_1_kind=[0.2,0.4,0.6,0.8];
m_2_kind=[0.2,0.4,0.6,0.8];
m_m_kind=[1,3,6,9];
%% 输入需要考虑的参数种类
disp('-—————散点图绘制开始————-—')
disp('请选择第一个要考虑的参数作为X轴数据：')
disp('个体认知能力-1、个体从众性-2、信息量-3、关联程度-4、透明度-5、可信度（公信力）-6、接收舆情信息的次数-7：')
ANS_1=input('请选择： ');
disp('请选择第二个要考虑的参数作为Y轴数据：')
disp('个体认知能力-1、个体从众性-2、信息量-3、关联程度-4、透明度-5、可信度（公信力）-6、接收舆情信息的次数-7：')
ANS_2=input('请选择： ');
% disp('请选择第三个要考虑的参数作为Z轴数据：')
% disp('个体认知能力-1、个体从众性-2、信息量-3、关联程度-4、透明度-5、可信度（公信力）-6、接收舆情信息的次数-7：')
% ANS_3=input('请选择： ');
%% 三次参数不能选择同样的
if (ANS_1==ANS_2)
    error('参数设置不能一样,请重新启动程序');
end
% if (ANS_1==ANS_3)
%     error('第一个参数输入不符合要求,请重新启动程序');
% end
% if (ANS_3==ANS_2)
%     error('第一个参数输入不符合要求,请重新启动程序');
% end
%% %默认的参数集
sandian1
%% 开始循环
i0=1;
for i_1=1:1:4
    switch ANS_1 %开始选择第一个参数
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
            error('第一个参数输入不符合要求,请重新启动程序');
    end   
        for i_2=1:1:4
            g=0;%用来画图计数的
            T_Ni=0;
            T_Nn=0;
            T_Nr=0;
            T_Ne=0;
            n=1;
            NN=size(G.Nodes,1);
            switch ANS_2 %开始选择第二个参数
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
                    error('第二个参数输入不符合要求,请重新启动程序');
            end
            sandain2 %开始更新
            
%             X_sandian(i0,1)=ans_kind_1;
%             Y_sandian(i0,1)=ans_kind_2;
%             Z_sandian(i0,1)=ans_kind_2;
            ans_1(i_2,i_1)=Time_max;%记录结果数据
            ans_2(i_2,i_1)=max_num;
            ans_3(i_2,i_1)=Time_zero;
            i0=i0+1;
        end
end
%% 存储数据
suju=input('是否需要生成数据的excel文件（需要输入1、不需要输入0）——文件名：柱子表格： ');
switch suju
    case 1
        xlswrite('柱子表格.xlsx',ans_1,'sheet1','B2');
        xlswrite('柱子表格.xlsx',ans_2,'sheet1','H2');
        xlswrite('柱子表格.xlsx',ans_3,'sheet1','B8');
        xlswrite('柱子表格.xlsx',{'峰值时间'},'sheet1','A1');
        xlswrite('柱子表格.xlsx',{'峰值数量'},'sheet1','G1');
        xlswrite('柱子表格.xlsx',{'消失时间'},'sheet1','A7');
        xlswrite('柱子表格.xlsx',ans_kind_1,'sheet1','B1');
        xlswrite('柱子表格.xlsx',ans_kind_2','sheet1','A2');
        xlswrite('柱子表格.xlsx',ans_kind_1,'sheet1','H1');
        xlswrite('柱子表格.xlsx',ans_kind_2','sheet1','G2');
        xlswrite('柱子表格.xlsx',ans_kind_1,'sheet1','B7');
        xlswrite('柱子表格.xlsx',ans_kind_2','sheet1','A8');
        disp('———数据excel文件已生成，程序结束———');
    case 0
        disp('—————程序结束—————');
end


%% 燃烧者峰值时间
figure
bar3(ans_1)
zlabel('Time for the burner to reach the peak');
X_label;
Y_label;
% Z_label
%% 燃烧者峰值
figure
bar3(ans_2)
zlabel('Maximum number of burner');
X_label;
Y_label;
%% 燃烧者消失时间
figure
bar3(ans_3)
zlabel('The time when the burners disappearedk');
X_label;
Y_label;