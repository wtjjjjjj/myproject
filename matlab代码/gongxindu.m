avg=[728 680 643 640;
     659 642 592 569;
     652 595 552 548;
     629 563 508 456;
];
var=[];

figure
%subplot(1,2,1)
h=bar3(avg,0.8);
%设置柱子颜色,颜色为RGB三原色，每个值在0~1之间即可
color_matrix = [20,210,179;129,120,220;217,150,200;240,90,190]/255;

axis([-inf inf -inf inf 0 800])
for n=1:numel(h)
    cdata=get(h(n),'zdata');
    set(h(n),'cdata',cdata,'facecolor',color_matrix(n,:))
end
xlabel('\theta','FontSize',14)
set(gca,'yticklabel',{'0.2','0.4','0.6','0.8'},'FontSize',12);
ylabel([char(949),''],'interpreter','tex')
set(gca,'xticklabel',{'0.2','0.4','0.6','0.8'},'FontSize',12);
zlabel('Maximum number of burner','FontSize',12)


