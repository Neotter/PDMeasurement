clc;
clear;
%���յĳ������ź�
[dataPoint,Fs] = audioread('ProxyRecording-1756217116_20171011010733.wav','native');
%����Ƶ��17500Hz
f = 17500;
%�������ź�ת��Ϊʵ����ȥ����ʼ��500����׼ȷֵ
dataPoint = dataPoint(500:end);
lengthOfData = length(dataPoint);
dataPoint = double(dataPoint).';
%���������źţ�
t = (0:(1/48000):(lengthOfData/48000));
cos2pift = cos(2*pi*f.*t);
nsin2pift = -1*sin(2*pi*f.*t);
cos2pift = cos2pift(1:lengthOfData);
nsin2pift = nsin2pift(1:lengthOfData);

%�ɼ����ݺͱ����ź����˷�
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
%%----���������ݺ�����

%未做去静态向量时在时域上的IQ�?figure(1);
subplot(4,2,1);
plot([1:length(IChannal)],IChannal,[1:length(QChannal)],QChannal);
grid on;
title('I/Q waveforms');

%未做去静态向量时在复平面上的�?subplot(4,2,2);
plot(IChannal,QChannal);
%%xlim([min([IChannal;QChannal]),max([IChannal;QChannal])]);
grid on;
title('Complex I/Q traces');

%做了去静态向量时在时域上的�?
SI = LEVD(IChannal);
SQ = LEVD(QChannal);