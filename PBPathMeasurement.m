clc;
clear;
%读取数据
[dataPoint,Fs] = audioread('/Users/nonohara/Downloads/PD数据/AutoRecording-1159706217_20170928020341.wav','native');
%CW波的频率为17500Hz
f = 17500;
%前3000个点会有一个很大的震荡,截掉
dataPoint = dataPoint(60000:end);
lengthOfData = length(dataPoint);
dataPoint = double(dataPoint).';
%正交向量
t = (0:(1/44100):(lengthOfData/44100));
cos2pift = cos(2*pi*f.*t);
nsin2pift = -1*sin(2*pi*f.*t);
cos2pift = cos2pift(1:lengthOfData);
nsin2pift = nsin2pift(1:lengthOfData);
%取得未经过CIC滤波后的IQ信号值
IChannalBeforeCIC = dataPoint .* cos2pift;
QChannalBeforeCIC = dataPoint .* nsin2pift;
lengthOfData = length(IChannalBeforeCIC);
IChannalBeforeCIC = IChannalBeforeCIC(1:fix(lengthOfData/16)*16);
QChannalBeforeCIC = QChannalBeforeCIC(1:fix(lengthOfData/16)*16);
%CIC滤波
%release(CIC);
IChannal = double(CIC(IChannalBeforeCIC.'));
QChannal = double(CIC(QChannalBeforeCIC.'));
IChannal = IChannal(3000:end-3000);
QChannal = QChannal(3000:end-3000);
%归一化到300区间内
%IChannalNorm = (IChannal./max(abs(IChannal))).*300;
%QChannalNorm = (QChannal./max(abs(QChannal))).*300;
%未做去静态向量时在时域上的IQ图
figure(1);
subplot(4,2,1);
plot([1:length(IChannal)],IChannal,[1:length(QChannal)],QChannal);
grid on;
title('时域上的IQ图');
%未做去静态向量时在复平面上的值
subplot(4,2,2);
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
%归一化到300区间内
%IChannalNoDCNorm = (IChannalNoDC./max(abs(IChannalNoDC))).*300;
%QChannalNoDCNorm = (QChannalNoDC./max(abs(QChannalNoDC))).*300;
subplot(4,2,3);
plot([1:length(IChannal)],SI,[1:length(IChannal)],IChannal);
title('I的静态向量');
subplot(4,2,4);
plot([1:length(QChannal)],SQ,[1:length(QChannal)],QChannal);
title('Q的静态向量');
subplot(4,2,5);
plot([1:length(IChannalNoDC)],IChannalNoDC,[1:length(QChannalNoDC)],QChannalNoDC);
grid on;
title('时域上的IQ图(去直流)');
%做了去静态向量时在复平面上的值
subplot(4,2,6);
ylim([min([IChannalNoDC;QChannalNoDC]),max([IChannalNoDC;QChannalNoDC])]);
xlim([min([IChannalNoDC;QChannalNoDC]),max([IChannalNoDC;QChannalNoDC])]);
plot(IChannalNoDC,QChannalNoDC);
grid on;
title('复平面上IQ图(去直流)');
%计算距离和相位并且显示直流分量
[distance,p] = distanceCalculation(IChannalNoDC,QChannalNoDC);

subplot(4,2,7);
plot(p);
title('相位');

subplot(4,2,8)
plot(distance);
title('距离');

figure(2);
plot(dataPoint);

