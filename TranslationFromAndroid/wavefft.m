
function  wavefft(dy,FFTNum,sigLength, Fs)
for timestep = 1:FFTNum:sigLength
    figure
    frameStart = timestep;
    frameEnd = timestep + FFTNum -1; 
    if(frameEnd > sigLength)
        break;
    end
    dataFrame = dy(frameStart:frameEnd);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    framenum = int8(frameStart/FFTNum);
    file_name = strcat('wav_',num2str(framenum));
    file_name = strcat(file_name,'.txt');
    fid = fopen(file_name,'wt');
    
    for i=1:length(dataFrame)
        fprintf(fid,'%g\n',dataFrame(i));       % \n 换行
    end
    fclose(fid);
    %%%%%%  1.1time zone begin  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    t=(frameStart:frameEnd)/Fs; %计算时间轴
    subplot(2,1,1);plot(t,dataFrame);xlabel('Time(s)');%在第一个窗口画波形
    grid on;
    %%%%%%% 1.time zone end   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    %%%%%%% 2. fft change begin %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    n=0:frameEnd-1;
    NFFT = 2^nextpow2(FFTNum); % Next power of 2 from length of y
    fftdata = fft(dataFrame,NFFT);    
    Y = fftdata/Fs;
    f = Fs/2*linspace(0,1,NFFT/2+1);
    absmulti = abs(Y(1:NFFT/2+1)).^2;
    absy = 2*abs(Y(1:NFFT/2+1));
    
    
%     file_name = strcat('fft_',num2str(frameStart));
%     file_name = strcat(file_name,'.txt');
%     fid = fopen(file_name,'wt');
%     
%     for i=1:length(absmulti)
%         fprintf(fid,'%g\n',absmulti(i));       % \n 换行
%     end
%     fclose(fid);
    
    dby = 20*log10(absy);
    
    
    % Plot single-sided amplitude spectrum.
    subplot(2,1,2);
    %bar(dby(1822:1892));    
    %plot(f(1822:1892),dby(1822:1892)); 
    plot(f,dby); 
    title('Single-Sided Amplitude Spectrum of y(t)')
    xlabel('Frequency (Hz)')
    ylabel('|db|')
    %axis([16500,23500,-20, 80]);
    axis([19600,20400,0, 80]);
    
%     FrameNum = timestep/FFTNum + 1;
%     filename = file + '_' + FrameNum + '.dat';  %     
%     csvwrite(filename,m)
    
    end
end
