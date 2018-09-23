function [n_80, n_100] = Length(SNR_th,Pin)
h = 6.62606896e-34;
f = 193.1e12;
B = 50e9;
NF  =4;
% G80 = 1/(0.5^(80/15));
% G100 = 1/(0.5^(100/15));
G80 = 2^(80/15);
G100 = 2^(100/15);

Pn_80 = 2 * pi * h * f * B*(NF - 1/G80)*1000;
SNR = inf;
k_80 =2/3 * Pn_80 *G80;
n_80 = 0;
while( SNR > SNR_th)
 snr = Pin/(n_80 * k_80 * Pin^2 + n_80 * Pn_80 * G80);
 SNR = 10 * log10(snr);
 n_80 = n_80+1;
end

n_100 = 0;
SNR = inf;
Pn_100 = 2 * pi * h * f * B*(NF - 1/G100)*1000;
k_100 =2/3 * Pn_100 * G100;
while( SNR > SNR_th)
 snr = Pin/(n_100 * k_100 * Pin^2 + n_100 * Pn_100 * G100);
 SNR = 10 * log10(snr);
 n_100 = n_100+1;
end



