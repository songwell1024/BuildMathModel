function data_M = QamMod(binary,M_QAM)


k=log2(M_QAM);%每个M进制码元的bit数


data_len=length(binary);%比特长度
binary_rec=reshape(binary,k,data_len/k)';%转化为data_len/k行，k列，的矩阵，以便转化为16进制M进制
%计算实部
data_str1=num2str(binary_rec(:,1:k/2));
data_m_real=bin2dec(data_str1);
%计算虚部
data_str2=num2str(binary_rec(:,k/2+1:k));
data_m_imag=bin2dec(data_str2);
%实部虚部映射到MQam
data_M=((data_m_real*2-2^(k/2)+1)+j*(data_m_imag*2-2^(k/2)+1)).';


