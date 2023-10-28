clear all;
T=110;
exam=xlsread('D:\应用软件\BA无标度网络.xlsx');
%x=1:1:100;%x轴上的数据，第一个值代表数据开始，第二个值代表间隔，第三个值代表终止
x=exam(1:T,3);
y=exam(1:T,6);
z=exam(1:T,7);
plot([1:T],x,'-',[1:T],y,'--',[1:T],z,'.-');
axis([0,T,0,600]);
xlim([0,121]);
xticks(1:20:121)
set(gca,'xticklabel',{'2022-03-21','2022-03-23','2022-03-25','2022-03-27','2022-03-29','2022-03-31','2022-04-2'}); 
set(gca,'YTick',[0:100:600]);
xlabel('Date');
ylabel('Numbers of burners');
legend('N=1000','N=2000','N=3000');