clear all;
exam=xlsread('D:\matlab代码\散点程序\图16.xlsx');
X=exam(:,2);
Y=exam(:,1);
Z=exam(:,3);
ZF=exam(:,4);
scatter3(X,Y,Z,130*ZF/(max(ZF)-20),ZF,'filled');
c = colorbar;
c.Label.String = '燃烧者达到的最大规模';
xticks([0.2,0.4,0.6,0.8])
        xlim([0.1,0.9])
        xlabel('信息量');
        xticklabels({'\itI\simN(0.2,0.2)','\itI\simN(0.4,0.2)','\itI\simN(0.6,0.2)','\itI\simN(0.8,0.2)'})
yticks([0.2,0.4,0.6,0.8])
        ylim([0.1,0.9])
        ylabel('关联度');
        yticklabels({'\itb\simN(0.2,0.2)','\itb\simN(0.4,0.2)','\itb\simN(0.6,0.2)','\itb\simN(0.8,0.2)'})
zticks([1,3,6,9])
        xlim([0,10])
        xlabel('接触信息的次数');
        xticklabels({'1','3','6','9'})