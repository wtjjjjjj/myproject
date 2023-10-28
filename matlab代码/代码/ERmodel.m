function [G] = ERmodel
N_ER = input('�����ܽڵ����� '); %
p_ER =input('���Ӹ���:  ') ; %�����֮����p�ĸ����γ�����
position=zeros(N_ER,2);    %��λ����Ϣposition,һ����N�����ݣ�ÿ��������2����Ϣ
adj = zeros(N_ER,N_ER);  %�����ڽӾ��󣬳�ʼ���ڽӾ���ȫ��
for m=1:N_ER           %��ÿ���㰲��λ�ã�Χ��һ��Բ
    position(m,1)=cos(m/N_ER*2*pi);
    position(m,2)=sin(m/N_ER*2*pi);
end
figure('name','ER���ͼ');
for m=1:N_ER
    for n=m+1:N_ER
        if(rand(1,1)<p_ER)  %��0.1�ĸ������ɱ�
            adj(m,n)=1;  %����������ڽӱ�ֵ
            adj(n,m)=1;
        end
    end
end
G=graph(adj,'upper');
p=plot(G,'-k','Layout','force','EdgeAlpha',0.2);
p.NodeColor = 'b';
p.MarkerSize =5;
end