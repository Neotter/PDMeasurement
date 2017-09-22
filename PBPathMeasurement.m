clc;
clear;
%读取数据
[dataPoint,Fs] = audioread('/Users/nonohara/Downloads/PD数据/6.wav','native');
%CW波的频率为17500Hz
f = 17500;
lengthOfData = length(dataPoint);
dataPoint = double(dataPoint);
%正交向量
t = (0:(1/44100):(lengthOfData/44100));
cos2pift = cos(2*pi*f.*t);
nsin2pift = -sin(2*pi*f.*t);
cos2pift = cos2pift(1:lengthOfData).';
nsin2pift = nsin2pift(1:lengthOfData).';
%取得未经过CIC滤波后的IQ信号值
IChannalBeforeCIC = dataPoint .* cos2pift;
QChannalBeforeCIC = dataPoint .* nsin2pift;
IChannalBeforeCIC = IChannalBeforeCIC(3000:end);
QChannalBeforeCIC = QChannalBeforeCIC(3000:end);
lengthOfData = length(IChannalBeforeCIC);
IChannalBeforeCIC = IChannalBeforeCIC(1:fix(lengthOfData/16)*16);
QChannalBeforeCIC = QChannalBeforeCIC(1:fix(lengthOfData/16)*16);
%CIC滤波
%release(CIC);
IChannal = double(CIC(IChannalBeforeCIC));
QChannal = double(CIC(QChannalBeforeCIC));
IChannal = IChannal(3000:end-3000);
QChannal = QChannal(3000:end-3000);
%未做去静态向量时在时域上的IQ图
figure(1);
subplot(2,2,1);
plot([1:length(IChannal)],IChannal,[1:length(QChannal)],QChannal);
grid on;
title('时域上的IQ图');
%未做去静态向量时在复平面上的值
subplot(2,2,2);
plot(IChannal,QChannal);
ylim([min([IChannal;QChannal]),max([IChannal;QChannal])]);
xlim([min([IChannal;QChannal]),max([IChannal;QChannal])]);
grid on;
title('复平面上IQ图');
%做了去静态向量时在时域上的值
SI = LEVD(IChannal);
SQ = LEVD(QChannal);
IChannalNoDC = IChannal-SI;
QChannalNoDC= QChannal-SQ;
IChannalNoDC = IChannalNoDC(50:end);
QChannalNoDC = QChannalNoDC(50:end);
subplot(2,2,3);
plot([1:length(IChannalNoDC)],IChannalNoDC,[1:length(QChannalNoDC)],QChannalNoDC);
grid on;
title('时域上的IQ图(去直流)');
%做了去静态向量时在复平面上的值
subplot(2,2,4);
ylim([min([IChannalNoDC;QChannalNoDC]),max([IChannalNoDC;QChannalNoDC])]);
xlim([min([IChannalNoDC;QChannalNoDC]),max([IChannalNoDC;QChannalNoDC])]);
plot(IChannalNoDC,QChannalNoDC);
grid on;
title('复平面上IQ图(去直流)');
%计算距离
[distance,p] = distanceCalculation(IChannalNoDC,QChannalNoDC);

figure(2);
plot(p);
title('相位');

figure(3);
plot(distance);
title('距离');

