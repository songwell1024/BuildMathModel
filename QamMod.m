function data_M = QamMod(binary,M_QAM)


k=log2(M_QAM);%ÿ��M������Ԫ��bit��


data_len=length(binary);%���س���
binary_rec=reshape(binary,k,data_len/k)';%ת��Ϊdata_len/k�У�k�У��ľ����Ա�ת��Ϊ16����M����
%����ʵ��
data_str1=num2str(binary_rec(:,1:k/2));
data_m_real=bin2dec(data_str1);
%�����鲿
data_str2=num2str(binary_rec(:,k/2+1:k));
data_m_imag=bin2dec(data_str2);
%ʵ���鲿ӳ�䵽MQam
data_M=((data_m_real*2-2^(k/2)+1)+j*(data_m_imag*2-2^(k/2)+1)).';


