clear all;
T=110;
exam=xlsread('D:\Ӧ�����\BA�ޱ������.xlsx');
%x=1:1:100;%x���ϵ����ݣ���һ��ֵ�������ݿ�ʼ���ڶ���ֵ��������������ֵ������ֹ
x=exam(1:T,3);
%y=exam(1:T,5);
plot([1:T],x);
% axis([0,T,0,700]);
xlim([0,121]);
xticks(1:20:121)
set(gca,'xticklabel',{'2022-03-21','2022-03-23','2022-03-25','2022-03-27','2022-03-29','2022-03-31','2022-04-2'}); 
set(gca,'YTick',[0:100:1000]);
xlabel('Date');
ylabel('Numbers of burners');
%legend('The model built in the paper','The model in literature (Li et al., 2019)');