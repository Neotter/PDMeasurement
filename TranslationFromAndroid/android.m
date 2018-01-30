clc;
clear;
%
Path = 'IQ__0_20171011010716.txt';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
decsize=32;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
      
[txt,real,image]=textread(Path,'%s%n%n','delimiter', ',');
realvalid=real(32*20:length(real));
imagevalid=image(32*20:length(image));

figure(1);
subplot(2,2,2);
plot(realvalid,imagevalid);
title('Complex I/Q traces(no static vector)');
len = length(realvalid);
n=ones(len,1);
for jj=1:len
    n(jj) = jj*0.01/32;
end

subplot(2,2,1);
plot(n,realvalid,n,imagevalid);
title('I/Q waveforms(no static vector)');

[distance,phase,p] = distanceCalculation(realvalid,imagevalid);
subplot(2,2,3);
plot(phase);
title('Phase');
subplot(2,2,4);
plot(distance);
title('Distance');
%% 



