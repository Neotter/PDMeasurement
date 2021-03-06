clc;
clear;
%读�??��?
[dataPoint,Fs] = audioread('ProxyRecording83420654_20171121042124.wav','native');%ProxyRecording-1756217116_20171011010733
%CW波�?�??�?7500Hz
f = 17500;
%�?000�??�??�?���?��???�????
%dataPoint = dataPoint(20000:end);
lengthOfData = length(dataPoint);
dataPoint = double(dataPoint).';
%正交???
t = (0:(1/Fs):(lengthOfData/Fs));
cos2pift = cos(2*pi*f.*t);
nsin2pift = sin(2*pi*f.*t);
cos2pift = cos2pift(1:lengthOfData);
nsin2pift = nsin2pift(1:lengthOfData);
%??????�?IC滤波???IQ信�?�?
IChannalBeforeCIC = dataPoint .* cos2pift;
QChannalBeforeCIC = dataPoint .* nsin2pift;
lengthOfData = length(IChannalBeforeCIC);
IChannalBeforeCIC = IChannalBeforeCIC(1:fix(lengthOfData/16)*16);
QChannalBeforeCIC = QChannalBeforeCIC(1:fix(lengthOfData/16)*16);
%CIC滤波
IChannal = double(FIR(IChannalBeforeCIC.'));
QChannal = double(FIR(QChannalBeforeCIC.'));
%IChannal = IChannal(5000:end-13000);
%QChannal = QChannal(5000:end-13000);
%�?????300?��?�?%IChannalNorm = (IChannal./max(abs(IChannal))).*300;
%QChannalNorm = (QChannal./max(abs(QChannal))).*300;

%????��????????��??????Q�?figure(1);
figure;
plot([1:length(IChannal)],IChannal,[1:length(QChannal)],QChannal);
grid on;
title('I/Q waveforms');
%????��????????��?平�?�??�?
figure;
plot(IChannal,QChannal);
%%xlim([min([IChannal;QChannal]),max([IChannal;QChannal])]);
grid on;
title('Complex I/Q traces');
%????��????????��??????��?
%IChannal = IChannal(100000:400000);
%QChannal = QChannal(100000:400000);
SI =sum(IChannal)/length(IChannal);% LEVD(IChannal);
% plot(SI);
% hold on 
% grid on
SQ =sum(QChannal)/length(QChannal);% LEVD(QChannal);
% plot(SQ);
% hold on
% grid on
IChannalNoDC = IChannal-SI;
QChannalNoDC= QChannal-SQ;
%�?????300?��?�?%IChannalNoDCNorm = (IChannalNoDC./max(abs(IChannalNoDC))).*300;
%QChannalNoDCNorm = (QChannalNoDC./max(abs(QChannalNoDC))).*300;
% subplot(4,2,3);
% % plot([1:length(IChannal)],SI,[1:length(IChannal)],IChannal);
% plot([1:length(IChannal)],IChannal);
% title('Static vector of I');
% subplot(4,2,4);
% % plot([1:length(QChannal)],SQ,[1:length(QChannal)],QChannal);
% plot([1:length(QChannal)],QChannal);
% title('Static vector of Q');
figure;
plot([1:length(IChannalNoDC)],IChannalNoDC,[1:length(QChannalNoDC)],QChannalNoDC);
grid on;
title('I/Q waveforms(no static vector)');
% %????��????????��?平�?�??�?
figure;
plot(IChannalNoDC,QChannalNoDC);
ylim([min([IChannalNoDC;QChannalNoDC]),max([IChannalNoDC;QChannalNoDC])]);
xlim([min([IChannalNoDC;QChannalNoDC]),max([IChannalNoDC;QChannalNoDC])]);
grid on;
title('Complex I/Q traces(no static vector)');
% %计�?�?????�?���??示�?�??�?
[distance,p] = distanceCalculation(IChannalNoDC,QChannalNoDC);

% subplot(4,2,7);
% plot(p);
% title('Phase change');

figure;
plot(distance);
title('Distance');

