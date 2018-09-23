function [snr_QPSK, snr_8QAM, snr_16QAM] = BER(ber)
SNR_DB = 1 :0.0001 :20;
Pbit=1/2*erfc(sqrt(10.^(SNR_DB/10)/2));  %理论误比特率
Prb8 = (1/3)*3/2*erfc(sqrt(3*0.1)*(10.^(SNR_DB/30)));
Prb16 = (1/4)*3/2*erfc(sqrt(4*0.1)*(10.^(SNR_DB/40)));
a = inf;
for index = 1 : 1 : length(Pbit)
   if(abs(Pbit(index) - ber) < a)
       a  = Pbit(index) - ber;
   else
       snr_QPSK = SNR_DB(index);
       break;
   end   
end
a = inf;
for index = 1 : 1 : length(Prb8)
   if(abs(Prb8(index) - ber) < a)
       a  = Prb8(index) - ber;
   else
       snr_8QAM = SNR_DB(index);
       break;
   end   
end
a = inf;
for index = 1 : 1 : length(Prb16)
   if(abs(Prb16(index) - ber) < a)
       a  = Prb16(index) - ber;
   else
       snr_16QAM = SNR_DB(index);
       break;
   end   
end
end