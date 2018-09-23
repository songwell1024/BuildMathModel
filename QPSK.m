function [receive, pbit] = QPSK(sum, SNR_DB)

% SNR_DB=[0:1:12]; %Signal-to-noise ratio gradually improve

% sum=100;

data= randsrc(sum,2,[0 1]); %generate a 1000000*2 random matrix, using [0 1]

[a1,b1]=find(data(:,1)==0&data(:,2)==0);  %returns the row and column indices of the evaluated expression which are TRUE.

message(a1)=-1-j; % map [ 0 0] to 225°

[a2,b2]=find(data(:,1)==0&data(:,2)==1);

message(a2)=-1+j; % map [ 0 1] to 135°

[a3,b3]=find(data(:,1)==1&data(:,2)==0);

message(a3)=1-j; % map [ 1 0] to 275°

[a4,b4]=find(data(:,1)==1&data(:,2)==1);

message(a4)=1+j;% map [ 0 0] to 45°

A=1;

Tb=1;

Eb=A*A*Tb;

P_signal=Eb/Tb;

NO=Eb./(10.^(SNR_DB/10)); %SNR_DB=10.*log10(Eb./NO)

P_noise=NO; %noise power 单边功率谱密度(N0)主要用在复数信号中，双边功率谱密度(N0/2)主要用在实信号中。

sigma=sqrt(P_noise);  

for Eb_NO_id=1:length(sigma) 

    noise1=sigma(Eb_NO_id)*randn(1,sum); 

    noise2=sigma(Eb_NO_id)*randn(1,sum); 

    receive=message+noise1+noise2*j; %previously unconsidered: how to add gaussian noise to the original signal

    resum=0; 

    total=0; 

    m1=find(angle(receive)<=pi/2&angle(receive)>0);  %demodulate the [ 1 1] pattern

    remessage(1,m1)=1+j;

    redata(m1,1)=1;

    redata(m1,2)=1;

    m2= find( angle(receive)>pi/2&angle(receive)<=pi); %demodulate the [ 0 1] pattern

    remessage(1,m2)=-1+j;

    redata(m2,1)=0;

    redata(m2,2)=1;

    m3=find( angle(receive)>-pi&angle(receive)<=-pi/2); %demodulate the [ 0 0] pattern

    remessage(1,m3)=-1-j;

    redata(m3,1)=0;

    redata(m3,2)=0;

    m4=find( angle(receive)>-pi/2&angle(receive)<=0); %demodulate the [ 1 0] pattern

    remessage(1,m4)=1-j;

    redata(m4,1)=1;

    redata(m4,2)=0;

    [resum,ratio1]=symerr(data,redata); % 'symerr' Compute number of symbol errors and symbol error rate

    pbit(Eb_NO_id)=resum/(sum*2); %1000000 symbols -->2000000 bits     QPSK: 2bits per symbol

    [total,ratio2]=symerr(message,remessage); %Compute number of symbol errors and symbol error rate

    pe(Eb_NO_id)=total/sum; % Calculated according to the definition

end

%Pbit=1/2*erfc(sqrt(10.^(SNR_DB/10)/2));  %理论误比特率



end

