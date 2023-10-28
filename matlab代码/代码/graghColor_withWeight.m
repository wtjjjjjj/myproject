function [G1,g] = graghColor_withWeight(NodeWeight,Edges,g,n,N,T)
NodeTable=table(NodeWeight);
EndNodes=Edges(:,1:2);
Weight=Edges(:,3);
EdgeTable=table(EndNodes,Weight);
G1=graph(EdgeTable,NodeTable,'omitselfloops');
if n==1||n==round(T/5)||n==T
        g=g+1;
        subplot(2,2,g);
        p1=plot(G1,'-k','Layout','force');
        p1.NodeCData=G1.Nodes.NodeWeight;   %蓝1为感染人群，绿2为恢复人群，黄3为易感人群,4为另一个人群
        p1.MarkerSize =5;
        set(gca,'CLim',[1,4]); %设置颜色图上下限为4.5、0.5
        map=[0.12 0.56 1;1 0.5 0;0 1 0;0.64 0.13 0.94]; %设计四类人员散点的颜色
        colormap(map) %更新所映射的颜色矩阵为map
        colorbar
        text(5.2,4,['传播时间=',num2str(n)]);
        text(5.2,2,['D阴燃者=:',num2str(N.N_infected)]);
        text(5.2,1,['S稳定者=:',num2str(N.N_noninfected)]);
        text(5.2,0,['B燃烧者=:',num2str(N.N_recovered)]);
        text(5.2,3,['F抑燃者=:',num2str(N.N_E)]);
    end
end