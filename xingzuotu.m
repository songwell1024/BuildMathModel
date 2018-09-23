lc
clear;
%%8PSK星座图
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
n=1200;                          %比特序列长度
x=randint(n,1);                    %生成随机二进制比特流
x4=reshape(x,k,length(x)/k);       %将原始的二进制比特序列每四个一组分组，并排列成k行length(x)/k列的矩阵
xsym=bi2de(x4.','left-msb');       %将矩阵转化为相应的16进制信号序列
y=modulate(modem.qammod(M),xsym);  %用16QAM调制器对信号进行调制
scatterplot(y);                    %画出8QAM信号的横矩形星座图

yy=[1-3i,1-1i,1+1i,1+3i,-1-3i,-1-1i,-1+1i,-1+3i];                  %画出8QAM信号的竖矩形星座图
scatterplot(yy);                    %画出8QAM信号的横矩形星座图
