close all
clc;
clear;

SNR_DB=0:1:15; %Signal-to-noise ratio gradually improve

n= 1.2e6;   % ������

[yn8, bit_error_rate8] = QAM(n, 8, SNR_DB);
[yn16, bit_error_rate16] = QAM(n, 16, SNR_DB);
[receive, pbit] = QPSK(n, SNR_DB);

example();    %����ͼ

figure
semilogy(SNR_DB,pbit,'-o',SNR_DB,bit_error_rate8,'-s',SNR_DB,bit_error_rate16,'-*')
legend('QPSK�������','8QAM�������','16QAM�������')
xlabel('SNR/dB')
ylabel('BER')
grid on

figure
semilogy(SNR_DB,pbit,'-o',SNR_DB,bit_error_rate8,'-s',SNR_DB,bit_error_rate16,'-*')
legend('QPSK�������','8QAM�������','16QAM�������')
xlabel('SNR/dB')
ylabel('BER')
grid on
hold on
x = 0 :0.01 : 15;
ber = zeros(1, length(x));
for index  = 1 : 1: length(x)
    ber(index)  = 0.02;
end
plot(x, ber);
[snr_QPSK, snr_8QAM, snr_16QAM] = BER(0.02);   % �������޵�
pin  = 0.1 : 0.1 : 10;

for index = 1 : 1 : length(pin)
    [n_80_qpsk(index), n_100_qpsk(index)] = Length(snr_QPSK,pin(index));
    [n_80_8qam(index), n_100_8qam(index)] = Length(snr_8QAM,pin(index));
    [n_80_16qam(index), n_100_16qam(index)] = Length(snr_16QAM,pin(index));
% 
%     [n_80_qpsk(index), n_100_qpsk(index)] = LengthWithNoise(snr_QPSK,pin(index));
%     [n_80_8qam(index), n_100_8qam(index)] = LengthWithNoise(snr_8QAM,pin(index));
%     [n_80_16qam(index), n_100_16qam(index)] = LengthWithNoise(snr_16QAM,pin(index));

end

figure
plot(pin,n_80_qpsk.*80,'-*', pin, n_80_8qam.*80,'-s', pin, n_80_16qam.*80,'-o');
legend('QPSK','8QAM','16QAM');
xlabel('Pin/mw')
ylabel('Length/Km')
grid on;
figure
plot(pin,n_100_qpsk.*100,'-*', pin, n_100_8qam.*100,'-s', pin, n_100_16qam.*100,'-o');
legend('QPSK','8QAM','16QAM');
xlabel('Pin/mw')
ylabel('Length/Km')
grid on;
figure
plot(pin,n_80_qpsk.*80,'-*', pin, n_80_8qam.*80,'-s', pin, n_80_16qam.*80,'-o',pin,n_100_qpsk.*100,'-+', pin, n_100_8qam.*100,'-X', pin, n_100_16qam.*100,'-V');
legend('QPSK(80)','8QAM(80)','16QAM(80)','QPSK(100)','8QAM(100)','16QAM(100)');
xlabel('Pin/mw')
ylabel('Length/Km')
grid on;


[CityNode,ProvienceNode] = Peo();     %�����ֵ
[Wt_16_1,Wt_33_1]  =MaxWorth();       % 2.1���Ż����� 
[Wt_16_2,Wt_33_2]  =MaxWorthProblem2();           %2.2�����˿�
% [Wpt_16_2,Wpt_33_2] =MaxWorthProvience();   %2.2ʡ�˿�
% 

bit_error_rate1 = QAMOptimization1();    %16QAM�Ż�����1
bit_error_rate2 = QAMOptimization2();    %16QAM�Ż�����2
figure
semilogy(SNR_DB,bit_error_rate8,'-o',SNR_DB,bit_error_rate1,'-s',SNR_DB,bit_error_rate2,'-*');
legend('8QAM�������','16QAM�Ż��������1','16QAM�Ż��������2');
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


