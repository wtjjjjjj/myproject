function [G] = ERmodel
N_ER = input('网络总节点数： '); %
p_ER =input('连接概率:  ') ; %点与点之间以p的概率形成连边
position=zeros(N_ER,2);    %点位置信息position,一共有N组数据，每组数据有2个信息
adj = zeros(N_ER,N_ER);  %创建邻接矩阵，初始化邻接矩阵全零
for m=1:N_ER           %给每个点安排位置，围成一个圆
    position(m,1)=cos(m/N_ER*2*pi);
    position(m,2)=sin(m/N_ER*2*pi);
end
figure('name','ER随机图');
for m=1:N_ER
    for n=m+1:N_ER
        if(rand(1,1)<p_ER)  %以0.1的概率生成边
            adj(m,n)=1;  %这里两句给邻接表赋值
            adj(n,m)=1;
        end
    end
end
G=graph(adj,'upper');
p=plot(G,'-k','Layout','force','EdgeAlpha',0.2);
p.NodeColor = 'b';
p.MarkerSize =5;
end