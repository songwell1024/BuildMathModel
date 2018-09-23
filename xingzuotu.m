lc
clear;
%%8PSK����ͼ
M = 8;
nPacket = 5000;           % The signal length
x = randint(nPacket,1,M); % Signal for modulate

 % Creat an object of general QAM modulation
h = modem.genqammod('Constellation', exp(j*2*pi*[0:M-1]/M));      
y = modulate(h,x);        % modulate x get y
scatterplot(y);

% yn = awgn(y,15,'measured'); % Pass the gauss channel with SNR=15dB
% scatterplot(yn);
% reset(h);                      
% h = modem.genqamdemod('Constellation', exp(j*2*pi*[0:M-1]/M));
% z = demodulate(h,yn);
% [num,rt]= symerr(x,z)
% 
% %% Process rectanglar pulse shaping
% Nsamp = 4;               % Oversampling rate
% ypulse = rectpulse(y,Nsamp);
% ynoisy = awgn(ypulse,15,'measured');
% ydownsamp = intdump(ynoisy,Nsamp);
% scatterplot(ydownsamp);
% reset(h);
% h = modem.genqamdemod('Constellation', exp(j*2*pi*[0:M-1]/M));
% z = demodulate(h,ydownsamp);
% [num,rt]= symerr(x,z)


M=8;
k=log2(M);
n=1200;                          %�������г���
x=randint(n,1);                    %������������Ʊ�����
x4=reshape(x,k,length(x)/k);       %��ԭʼ�Ķ����Ʊ�������ÿ�ĸ�һ����飬�����г�k��length(x)/k�еľ���
xsym=bi2de(x4.','left-msb');       %������ת��Ϊ��Ӧ��16�����ź�����
y=modulate(modem.qammod(M),xsym);  %��16QAM���������źŽ��е���
scatterplot(y);                    %����8QAM�źŵĺ��������ͼ

yy=[1-3i,1-1i,1+1i,1+3i,-1-3i,-1-1i,-1+1i,-1+3i];                  %����8QAM�źŵ�����������ͼ
scatterplot(yy);                    %����8QAM�źŵĺ��������ͼ
