function example()
SnrSeq =  (0:1:25);
Iters = 1e5;
result = zeros(3,length(SnrSeq));
for ii=1:length(SnrSeq)
    TxBit1 = randi([0 3],1,Iters);
    TxSym1 = qammod(TxBit1,4)/sqrt(2);
    
    TxBit2 = randi([0 7],1,Iters);
    TxSym2 = qammod2(TxBit2,8)/sqrt(4.7);
    
    TxBit3 = randi([0 15],1,Iters);
    TxSym3 = qammod(TxBit3,16)/sqrt(34.133);
    
    Noise = (randn(1,Iters)+randn(1,Iters)*1i)*10^(-SnrSeq(ii)/20)/sqrt(2);
    RxSym1 = TxSym1+Noise;
    RxSym2 = TxSym2+Noise;
    RxSym3 = TxSym3+Noise;
    
    RxBit1 = qamdemod(RxSym1*sqrt(2),4);
    RxBit2 = qamdemod2(RxSym2*sqrt(4.7),8);
    RxBit3 = qamdemod(RxSym3*sqrt(34.133),16);
    
    Bc1 = dec2bin(RxBit1,2)==dec2bin(TxBit1,2);
    Bc2 = dec2bin(RxBit2,3)==dec2bin(TxBit2,3);
    Bc3 = dec2bin(RxBit3,4)==dec2bin(TxBit3,4);
    
    result(1,ii) = sum(Bc1(:)==0)/Iters/2;
    result(2,ii)  = sum(Bc2(:)==0)/Iters/3;
    result(3,ii)  = sum(Bc3(:)==0)/Iters/4;   
end

Iters = 100;
TxBit1 = randi([0 3],1,Iters);
TxSym1 = qammod(TxBit1,4)/sqrt(2);
TxBit2 = randi([0 7],1,Iters);
TxSym2 = qammod2(TxBit2,8)/sqrt(4.7);
TxBit3 = randi([0 15],1,Iters);
TxSym3 = qammod(TxBit3,16)/sqrt(34.133);

figure(2);clf;hold on;
subplot(1,3,1);plot(TxSym1,'b*');title('QPSK·¢ÉäÐÇ×ùÍ¼');axis equal;axis([-2 2 -2 2])
subplot(1,3,2);plot(TxSym2,'b*');title('8QAM·¢ÉäÐÇ×ùÍ¼');axis equal;axis([-2 2 -2 2])
% subplot(1,3,3);plot(TxSym3,'b*');title('16QAM·¢ÉäÐÇ×ùÍ¼');axis equal;axis([-2 2 -2 2])
subplot(1,3,3);plot(TxSym3,'b*');title('16QAM·¢ÉäÐÇ×ùÍ¼');axis equal;axis([-2 2 -2 2])


SNR = 10;
Noise = (randn(1,Iters)+randn(1,Iters)*1i)*10^(-SnrSeq(ii)/20)/sqrt(2);
RxSym1 = TxSym1+Noise;
RxSym2 = TxSym2+Noise;
RxSym3 = TxSym3+Noise;
figure(3);clf;hold on;
subplot(1,3,1);plot(RxSym1,'b*');title('QPSK½ÓÊÕÐÇ×ùÍ¼');axis equal;axis([-2 2 -2 2])
subplot(1,3,2);plot(RxSym2,'b*');title('8QAM½ÓÊÕÐÇ×ùÍ¼');axis equal;axis([-2 2 -2 2])
subplot(1,3,3);plot(RxSym3,'b*');title('16QAM½ÓÊÕÐÇ×ùÍ¼');axis equal;axis([-2 2 -2 2])
end

