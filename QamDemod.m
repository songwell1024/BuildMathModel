function data_out=QamDemod(data_QAM,M_QAM)


k=log2(M_QAM);%每个M进制码元的bit数
data_len=length(data_QAM);%码元长度
%-------------------------------------------------------------------
%QAM信号放缩至与发送端相同比例
data_temp=data_QAM(find(real(data_QAM>0)));
aver=mean(real(data_temp));
data_Qam_temp=data_QAM/aver*(2^(k/2-1));
%------------------------------------------------------------------------
%平移到第一象限
data_Qam_temp2=(data_Qam_temp+(2^(k/2)-1)*(1+j))/2;
%----------------------------------------------------------------------
%将实部虚部分别映射为二进制数据
%实部
data_real=round(real(data_Qam_temp2));%实部判决
data_real(find(data_real>(2^(k/2)-1)))=2^(k/2)-1;%大于2^(k/2)-1的数据判定为2^(k/2)-1
data_real(find(data_real<0))=0;%小于0的数据判为0
bit_real=abs(dec2bin(data_real))-'0';
%虚部
data_imag=round(imag(data_Qam_temp2));%虚部判决
data_imag(find(data_imag>(2^(k/2)-1)))=2^(k/2)-1;%大于2^(k/2)-1的数据判定为2^(k/2)-1
data_imag(find(data_imag<0))=0;%小于0的数据判为0
bit_imag=abs(dec2bin(data_imag))-'0';
%------------------------------------------------------------------------
%还原为二进制比特流
bit_rec=[bit_real,bit_imag]';
data_out=reshape(bit_rec,1,data_len*k);
