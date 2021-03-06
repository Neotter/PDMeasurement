clc;
clear;
%接收的超声波信号
[dataPoint,Fs] = audioread('ProxyRecording-1756217116_20171011010733.wav','native');
%中心频率17500Hz
f = 17500;
%将接收信号转换为实数并去掉初始的500个不准确值
dataPoint = dataPoint(500:end);
lengthOfData = length(dataPoint);
dataPoint = double(dataPoint).';
%产生本地信号，
t = (0:(1/48000):(lengthOfData/48000));
cos2pift = cos(2*pi*f.*t);
nsin2pift = -1*sin(2*pi*f.*t);
cos2pift = cos2pift(1:lengthOfData);
nsin2pift = nsin2pift(1:lengthOfData);

%采集数据和本地信号做乘法
IChannalBeforeFIR = dataPoint .* cos2pift;
QChannalBeforeFIR = dataPoint .* nsin2pift;
% plot(IChannalBeforeFIR);
% hold on
% grid on
lengthOfData = length(IChannalBeforeFIR);
IChannal = double(FIR(IChannalBeforeFIR.'));
QChannal = double(FIR(QChannalBeforeFIR.'));
% plot(IChannal);
% hold on
% grid on
%%----到这里数据很正常

%鏈仛鍘婚潤鎬佸悜閲忔椂鍦ㄦ椂鍩熶笂鐨処Q鍥?figure(1);
subplot(4,2,1);
plot([1:length(IChannal)],IChannal,[1:length(QChannal)],QChannal);
grid on;
title('I/Q waveforms');

%鏈仛鍘婚潤鎬佸悜閲忔椂鍦ㄥ骞抽潰涓婄殑鍊?subplot(4,2,2);
plot(IChannal,QChannal);
%%xlim([min([IChannal;QChannal]),max([IChannal;QChannal])]);
grid on;
title('Complex I/Q traces');

%鍋氫簡鍘婚潤鎬佸悜閲忔椂鍦ㄦ椂鍩熶笂鐨勫?
SI = LEVD(IChannal);
SQ = LEVD(QChannal);