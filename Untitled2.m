clc
clear all
close all hidden
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
M = 16;
nPacket = 5000;           % The signal length
x = randint(nPacket,1,M); % Signal for modulate

 % Creat an object of general QAM modulation
h = modem.genqammod('Constellation', exp(j*2*pi*[0:M-1]/M));      
y = modulate(h,x);        % modulate x get y
scatterplot(y);
yn = awgn(y,15,'measured'); % Pass the gauss channel with SNR=15dB
scatterplot(yn);
reset(h);                      
h = modem.genqamdemod('Constellation', exp(j*2*pi*[0:M-1]/M));
z = demodulate(h,yn);
[num,rt]= symerr(x,z)

%% Process rectanglar pulse shaping
Nsamp = 4;               % Oversampling rate
ypulse = rectpulse(y,Nsamp);
ynoisy = awgn(ypulse,15,'measured');
ydownsamp = intdump(ynoisy,Nsamp);
scatterplot(ydownsamp);
reset(h);
h = modem.genqamdemod('Constellation', exp(j*2*pi*[0:M-1]/M));
z = demodulate(h,ydownsamp);
[num,rt]= symerr(x,z)