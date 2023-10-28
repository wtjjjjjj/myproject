%求燃烧者数量到达峰值的时间、燃烧者数量峰值、燃烧者数量为零的时间
function [Time_max,max_num,Time_zero]=func2(T_Nr)
T_B=T_Nr';
[max_num,Time_max]=max(T_B);
if(min(T_B)==0)
    a=find(T_B==0);
    Time_zero=a(1);
else
    
end
end