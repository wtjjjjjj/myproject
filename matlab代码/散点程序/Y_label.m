switch ANS_2 %第一个参数的坐标轴
    case 1
        yticks([0.2,0.4,0.6,0.8])
        ylim([0.1,0.9])
        ylabel('\rho');
        yticklabels({'\rho\simN(0.2,0.2)','\rho\simN(0.4,0.2)','\rho\simN(0.6,0.2)','\rho\simN(0.8,0.2)'})
    case 2
        yticks([0.2,0.4,0.6,0.8])
        ylim([0.1,0.9])
        ylabel('\itcon');
        yticklabels({'\itcon\simN(0.2,0.2)','\itcon\simN(0.4,0.2)','\itcon\simN(0.6,0.2)','\itcon\simN(0.8,0.2)'})
    case 3
        yticks([0.2,0.4,0.6,0.8])
        ylim([0.1,0.9])
        ylabel('\itI');
        yticklabels({'\itI\simN(0.2,0.2)','\itI\simN(0.4,0.2)','\itI\simN(0.6,0.2)','\itI\simN(0.8,0.2)'})
    case 4
        yticks([0.2,0.4,0.6,0.8])
        ylim([0.1,0.9]);
        ylabel('\itb');
        yticklabels({'\itb\simN(0.2,0.2)','\itb\simN(0.4,0.2)','\itb\simN(0.6,0.2)','\itb\simN(0.8,0.2)'});
    case 5
        yticks([0.2,0.4,0.6,0.8])
        ylim([0.1,0.9])
        ylabel('\theta');
        yticklabels({'0.2','0.4','0.6','0.8'});
    case 6
        yticks([0.2,0.4,0.6,0.8])
        ylim([0.1,0.9])
        ylabel([char(949),''],'interpreter','tex')
        yticklabels({'0.2','0.4','0.6','0.8'});
    case 7
        yticks([1,3,6,9])
        ylim([0,10])
        ylabel('m');
        yticklabels({'1','3','6','9'})
    otherwise
        error('第一个参数输入不符合要求,请重新启动程序');
end