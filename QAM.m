function [yn, bit_error_rate] = QAM(n,M, snr)

% M=16;
% snr=[0:1:20]; %Signal-to-noise ratio gradually improve

k=log2(M);

% n=100000;                          %比特序列长度

samp=1;                            %过采样率

x=randint(n,1);                    %生成随机二进制比特流

x4=reshape(x,k,length(x)/k);       %将原始的二进制比特序列每四个一组分组，并排列成k行length(x)/k列的矩阵

xsym=bi2de(x4.','left-msb');       %将矩阵转化为相应的16进制信号序列

y=modulate(modem.qammod(M),xsym);  %用16QAM调制器对信号进行调制

% scatterplot(y);                    %画出16QAM信号的星座图
% 
% text(real(y)+0.1,imag(y),dec2bin(xsym));
% 
% axis([-5 5 -5 5]);

% EbNo=15;

% snr=EbNo+10*log10(k)-10*log10(samp); %信噪比

for index = 1 : length(snr)
    yn=awgn(y,snr(index),'measured');         %加入高斯白噪声

    %h=scatterplot(yn,samp,0,'b.');     %经过信道后接收到的含白噪声的信号星座图

    % hold on;
    % 
    % scatterplot(y,1,0,'k+',h);         %加入不含白噪声的信号星座图

    % title('接收信号星座图');
    % 
    % legend('含噪声接收信号');

    % axis([-5 5 -5 5]);

    yd=demodulate(modem.qamdemod(M),yn); %此时解调出来的是16进制信号

    z=de2bi(yd,'left-msb');            %转化为对应的二进制比特流

    z=reshape(z.',numel(z),1');

    %[number_of_errors,bit_error_rate(index)]=biterr(x,z,log2(M));
    [number_of_errors,bit_error_rate(index)]=biterr(x,z);
end
end