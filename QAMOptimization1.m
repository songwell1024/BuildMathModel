function bit_error_rate = QAMOptimization1()
M = 8;
k = log2(M);
n = 1.2e6;
samp = 1;   %过采样率
coderate = 1; % 编码码率
x = randint(1,n);
xreshape = reshape(x, n/k,k);
xsym = bi2de(xreshape,'left-msb');
yy  =[1.00000000000000 + 0.00000000000000i,1.38991066352415 + 1.38991066352415i,...
    0.00000000000000 + 1.00000000000000i,-1.38991066352415 + 1.38991066352415i,...
    -1.00000000000000 + 1.22464679914735e-16i,-1.38991066352415 - 1.38991066352415i,...
    -1.83697019872103e-16 - 1.00000000000000i,1.38991066352415 - 1.38991066352415i];
h_mod1 = modem.genqammod('Constellation', yy,'InputType','integer');
h_demod1 = modem.genqamdemod('Constellation', yy,'OutputType','integer');
                                                         
y1 = modulate(h_mod1,xsym); 
scatterplot(y1);   % 星座图
snr = 0:1:15;

for index =1: 1: length(snr)
    yn1 = awgn(y1,snr(index),'measured');
    zsym1 = demodulate(h_demod1, yn1);
    z1 = reshape(de2bi(zsym1,'left-msb'),1,n);
    [num_of_errors(index), bit_error_rate(index)] = biterr(x,z1);
end

[yn, bit_error_rate2] = QAM(n,M, snr);
figure
semilogy(snr,bit_error_rate,'-o',snr,bit_error_rate2,'-s');
legend('16QAM优化','8QAM误比特率');
xlabel('SNR/dB')
ylabel('BER')
grid on;
hold on;
x = 0 :0.01 : 15;
ber = zeros(1, length(x));
for index  = 1 : 1: length(x)
    ber(index)  = 0.02;
end
plot(x, ber);
end