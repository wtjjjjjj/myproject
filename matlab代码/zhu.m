avg=[87 75 63 54;
     76 58 43 40 ;
     58 46 35 33;
     48 40 36 30;
];
var=[];

figure
%subplot(1,2,1)
h=bar3(avg,0.8);
%设置柱子颜色,颜色为RGB三原色，每个值在0~1之间即可
color_matrix = [20,210,179;129,120,220;217,150,200;240,90,190]/255;

axis([-inf inf -inf inf 0 100])
for n=1:numel(h)
    cdata=get(h(n),'zdata');
    set(h(n),'cdata',cdata,'facecolor',color_matrix(n,:))
end
ylabel('自我认知能力','FontSize',14)
set(gca,'yticklabel',{'\rho\simN(0.2,0.2)','\rho\simN(0.4,0.2)','\rho\simN(0.6,0.2)','\rho\simN(0.8,0.2)'},'FontSize',9);
xlabel('从众度','FontSize',14)
set(gca,'xticklabel',{'\itcon\simN(0.2,0.2)','\itcon\simN(0.4,0.2)','\itcon\simN(0.6,0.2)','\itcon\simN(0.8,0.2)'},'FontSize',9);
zlabel('燃烧者减少至0的时刻','FontSize',8.5)


