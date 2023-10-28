switch ANS_3 %第一个参数的坐标轴
    case 1
        zticks([0.2,0.4,0.6,0.8])
        zlim([0.1,0.9])
        zlabel('\rho');
        zticklabels({'\rho\simN(0.2,0.2)','\rho\simN(0.4,0.2)','\rho\simN(0.6,0.2)','\rho\simN(0.8,0.2)'})
    case 2
        zticks([0.2,0.4,0.6,0.8])
        zlim([0.1,0.9])
        zlabel('\itcon');
        zticklabels({'\itcon\simN(0.2,0.2)','\itcon\simN(0.4,0.2)','\itcon\simN(0.6,0.2)','\itcon\simN(0.8,0.2)'})
    case 3
        zticks([0.2,0.4,0.6,0.8])
        zlim([0.1,0.9])
        zlabel('\itI');
        zticklabels({'\itI\simN(0.2,0.2)','\itI\simN(0.4,0.2)','\itI\simN(0.6,0.2)','\itI\simN(0.8,0.2)'})
    case 4
        zticks([0.2,0.4,0.6,0.8])
        zlim([0.1,0.9]);
        zlabel('\itb');
        zticklabels({'\itb\simN(0.2,0.2)','\itb\simN(0.4,0.2)','\itb\simN(0.6,0.2)','\itb\simN(0.8,0.2)'});
    case 5
        zticks([0.2,0.4,0.6,0.8])
        zlim([0.1,0.9])
        zlabel('\theta');
        zticklabels({'0.2','0.4','0.6','0.8'});
    case 6
        zticks([0.2,0.4,0.6,0.8])
        zlim([0.1,0.9])
        zlabel([char(949),''],'interpreter','tex')
        zticklabels({'0.2','0.4','0.6','0.8'});
    case 7
        zticks([1,3,6,9])
        zlim([0,10])
        zlabel('m');
        zticklabels({'1','3','6','9'})
    otherwise
        error('第一个参数输入不符合要求,请重新启动程序');
end