

function audioframe(file,bSound)
   
    %%%%%%傅里叶变换/逆变换/短时傅里叶变换%%%%%%

[y,Fs]=audioread(file,'native'); %读出信号，采样率和采样位数。

[m,n]=size(y);
y1=y(:,1); %我这里假设你的声音是双声道，我只取单声道作分析，如果你想分析另外一个声道，请改成y=y(:,2)
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

%在第一个窗口画率谱, 

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
% Nw=20;          %窗函数长 window length
% 
% L=Nw/2;         %窗函数每次移动的样点数
% 
% Ts=round((sigLength-Nw)/L)+1;     %计算把数据y共分成多少段
% 
% nfft=512;        % FFT的长度
% 
% TF=zeros(Ts,nfft);  %将存放三维图谱，先清零
% 
% for i=1:Ts
% 
%     xw=y((i-1)*L+1:i*L+L);   %取一段数据
% 
%     temp=fft(xw,nfft);       % FFT变换
% 
%     %temp=fftshift(temp);     %频谱以0频为中心
% 
%     TF(i,:)=temp;            %把谱图存放在TF中 代表TF矩阵中的第i行
% 
% end
% 
% fn=(1:nfft)*Fs/nfft;
% 
% tn=(1:Ts)*Nw/2/Fs;
% 
% [T,F]=meshgrid(tn,fn);
% 
% mesh(T,F,abs(TF.'));  %三维绘图
% 
% axis tight;
% 
% title('三维时频图'); 
% 
% ylabel('Frequency(Hz)'); 
% 
% xlabel('Time(s)'); 
% 
% grid on;
%     

    
    

      
end