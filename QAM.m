function [yn, bit_error_rate] = QAM(n,M, snr)

% M=16;
% snr=[0:1:20]; %Signal-to-noise ratio gradually improve

k=log2(M);

% n=100000;                          %�������г���

samp=1;                            %��������

x=randint(n,1);                    %������������Ʊ�����

x4=reshape(x,k,length(x)/k);       %��ԭʼ�Ķ����Ʊ�������ÿ�ĸ�һ����飬�����г�k��length(x)/k�еľ���

xsym=bi2de(x4.','left-msb');       %������ת��Ϊ��Ӧ��16�����ź�����

y=modulate(modem.qammod(M),xsym);  %��16QAM���������źŽ��е���

% scatterplot(y);                    %����16QAM�źŵ�����ͼ
% 
% text(real(y)+0.1,imag(y),dec2bin(xsym));
% 
% axis([-5 5 -5 5]);

% EbNo=15;

% snr=EbNo+10*log10(k)-10*log10(samp); %�����

for index = 1 : length(snr)
    yn=awgn(y,snr(index),'measured');         %�����˹������

    %h=scatterplot(yn,samp,0,'b.');     %�����ŵ�����յ��ĺ����������ź�����ͼ

    % hold on;
    % 
    % scatterplot(y,1,0,'k+',h);         %���벻�����������ź�����ͼ

    % title('�����ź�����ͼ');
    % 
    % legend('�����������ź�');

    % axis([-5 5 -5 5]);

    yd=demodulate(modem.qamdemod(M),yn); %��ʱ�����������16�����ź�

    z=de2bi(yd,'left-msb');            %ת��Ϊ��Ӧ�Ķ����Ʊ�����

    z=reshape(z.',numel(z),1');

    %[number_of_errors,bit_error_rate(index)]=biterr(x,z,log2(M));
    [number_of_errors,bit_error_rate(index)]=biterr(x,z);
end
end