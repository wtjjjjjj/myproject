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
        p1.NodeCData=G1.Nodes.NodeWeight;   %��1Ϊ��Ⱦ��Ⱥ����2Ϊ�ָ���Ⱥ����3Ϊ�׸���Ⱥ,4Ϊ��һ����Ⱥ
        p1.MarkerSize =5;
        set(gca,'CLim',[1,4]); %������ɫͼ������Ϊ4.5��0.5
        map=[0.12 0.56 1;1 0.5 0;0 1 0;0.64 0.13 0.94]; %���������Աɢ�����ɫ
        colormap(map) %������ӳ�����ɫ����Ϊmap
        colorbar
        text(5.2,4,['����ʱ��=',num2str(n)]);
        text(5.2,2,['D��ȼ��=:',num2str(N.N_infected)]);
        text(5.2,1,['S�ȶ���=:',num2str(N.N_noninfected)]);
        text(5.2,0,['Bȼ����=:',num2str(N.N_recovered)]);
        text(5.2,3,['F��ȼ��=:',num2str(N.N_E)]);
    end
end