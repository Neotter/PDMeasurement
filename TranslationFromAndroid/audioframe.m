

function audioframe(file,bSound)
   
    %%%%%%����Ҷ�任/��任/��ʱ����Ҷ�任%%%%%%

[y,Fs]=audioread(file,'native'); %�����źţ������ʺͲ���λ����

[m,n]=size(y);
y1=y(:,1); %������������������˫��������ֻȡ����������������������������һ����������ĳ�y=y(:,2)
dy1 = double(y1(4096*60:4096*80));

   

sigLength1=length(dy1); 
FFTNum = 4096;
wavefft(dy1,FFTNum,sigLength1,Fs)

if(n > 1)
    y2=y(:,2);
    dy2 = double(y2);
    sigLength2=length(y2); 
    wavefft(dy2,FFTNum,sigLength2,Fs)
end
%%%%%%% 2. fft change end %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%subplot(4,1,3);plot(f,abs(Y));axis([19000,21000,0, 40000])    

%xlabel('Frequency(Hz)'); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%�ڵ�һ�����ڻ�����, 

% grid on;
% 
% subplot(3,1,3);
% 
% xifft=ifft(Y);
% 
% sound(xifft,Fs);
% 
% plot(t(8192:8500),xifft(8192:8500));xlabel('Time(s)')
% 
% grid on;




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% figure
% 
% Nw=20;          %�������� window length
% 
% L=Nw/2;         %������ÿ���ƶ���������
% 
% Ts=round((sigLength-Nw)/L)+1;     %���������y���ֳɶ��ٶ�
% 
% nfft=512;        % FFT�ĳ���
% 
% TF=zeros(Ts,nfft);  %�������άͼ�ף�������
% 
% for i=1:Ts
% 
%     xw=y((i-1)*L+1:i*L+L);   %ȡһ������
% 
%     temp=fft(xw,nfft);       % FFT�任
% 
%     %temp=fftshift(temp);     %Ƶ����0ƵΪ����
% 
%     TF(i,:)=temp;            %����ͼ�����TF�� ����TF�����еĵ�i��
% 
% end
% 
% fn=(1:nfft)*Fs/nfft;
% 
% tn=(1:Ts)*Nw/2/Fs;
% 
% [T,F]=meshgrid(tn,fn);
% 
% mesh(T,F,abs(TF.'));  %��ά��ͼ
% 
% axis tight;
% 
% title('��άʱƵͼ'); 
% 
% ylabel('Frequency(Hz)'); 
% 
% xlabel('Time(s)'); 
% 
% grid on;
%     

    
    

      
end