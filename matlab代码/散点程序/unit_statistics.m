N_infected=size(NodeWeight)-size(find(NodeWeight-1));%D��ȼ��
N_infected=N_infected(1);
T_Ni(n)=N_infected;
N_noninfected=size(NodeWeight)-size(find(NodeWeight-3));%S�ȶ���
N_noninfected=N_noninfected(1);
T_Nn(n)=N_noninfected;
N_recovered=size(NodeWeight)-size(find(NodeWeight-2));%Bȼ����
N_recovered=N_recovered(1);
T_Nr(n)=N_recovered;
N_E=size(NodeWeight)-size(find(NodeWeight-4));%F��ȼ��
N_E=N_E(1);
T_Ne(n)=N_E;
N=table(N_infected,N_noninfected,N_recovered,N_E);