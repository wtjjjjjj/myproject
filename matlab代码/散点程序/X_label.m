switch ANS_1 %第一个参数的坐标轴
    case 1
        xticks([0.2,0.4,0.6,0.8])
        xlim([0.1,0.9])
        xlabel('\rho');
        xticklabels({'\rho\simN(0.2,0.2)','\rho\simN(0.4,0.2)','\rho\simN(0.6,0.2)','\rho\simN(0.8,0.2)'})
    case 2
        xticks([0.2,0.4,0.6,0.8])
        xlim([0.1,0.9])
        xlabel('\itcon');
        xticklabels({'\itcon\simN(0.2,0.2)','\itcon\simN(0.4,0.2)','\itcon\simN(0.6,0.2)','\itcon\simN(0.8,0.2)'})
    case 3
        xticks([0.2,0.4,0.6,0.8])
        xlim([0.1,0.9])
        xlabel('\itI');
        xticklabels({'\itI\simN(0.2,0.2)','\itI\simN(0.4,0.2)','\itI\simN(0.6,0.2)','\itI\simN(0.8,0.2)'})
    case 4
        xticks([0.2,0.4,0.6,0.8])
        xlim([0.1,0.9]);
        xlabel('\itb');
        xticklabels({'\itb\simN(0.2,0.2)','\itb\simN(0.4,0.2)','\itb\simN(0.6,0.2)','\itb\simN(0.8,0.2)'});
    case 5
        xticks([0.2,0.4,0.6,0.8])
        xlim([0.1,0.9])
        xlabel('\theta');
        xticklabels({'0.2','0.4','0.6','0.8'});
    case 6
        xticks([0.2,0.4,0.6,0.8])
        xlim([0.1,0.9])
        xlabel([char(949),''],'interpreter','tex')
        xticklabels({'0.2','0.4','0.6','0.8'});
    case 7
        xticks([1,3,6,9])
        xlim([0,10])
        xlabel('m');
        xticklabels({'1','3','6','9'})
    otherwise
        error('第一个参数输入不符合要求,请重新启动程序');
end