function data_out=QamDemod(data_QAM,M_QAM)


k=log2(M_QAM);%ÿ��M������Ԫ��bit��
data_len=length(data_QAM);%��Ԫ����
%-------------------------------------------------------------------
%QAM�źŷ������뷢�Ͷ���ͬ����
data_temp=data_QAM(find(real(data_QAM>0)));
aver=mean(real(data_temp));
data_Qam_temp=data_QAM/aver*(2^(k/2-1));
%------------------------------------------------------------------------
%ƽ�Ƶ���һ����
data_Qam_temp2=(data_Qam_temp+(2^(k/2)-1)*(1+j))/2;
%----------------------------------------------------------------------
%��ʵ���鲿�ֱ�ӳ��Ϊ����������
%ʵ��
data_real=round(real(data_Qam_temp2));%ʵ���о�
data_real(find(data_real>(2^(k/2)-1)))=2^(k/2)-1;%����2^(k/2)-1�������ж�Ϊ2^(k/2)-1
data_real(find(data_real<0))=0;%С��0��������Ϊ0
bit_real=abs(dec2bin(data_real))-'0';
%�鲿
data_imag=round(imag(data_Qam_temp2));%�鲿�о�
data_imag(find(data_imag>(2^(k/2)-1)))=2^(k/2)-1;%����2^(k/2)-1�������ж�Ϊ2^(k/2)-1
data_imag(find(data_imag<0))=0;%С��0��������Ϊ0
bit_imag=abs(dec2bin(data_imag))-'0';
%------------------------------------------------------------------------
%��ԭΪ�����Ʊ�����
bit_rec=[bit_real,bit_imag]';
data_out=reshape(bit_rec,1,data_len*k);
