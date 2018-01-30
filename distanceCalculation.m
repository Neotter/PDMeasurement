function [distance,phase] = distanceCalculation( IChannal,QChannal )
%     distance = [];
    phase = [];
    detalDistance = 0;
    %计算原始相位
    p = atan(QChannal./IChannal);
    %处理相位,当相位由正到负的时�?,就加2pi
%     for i = 1:size(rawPhase)
%         if 
%     end
    %计算距离
     distance=zeros(1,length(p));
     for t = 2:length(p)
         delta_phase=p(t)-p(t-1);
         if abs(delta_phase)>0.5*pi
             delta_phase=0;
         end
         %if sign(p())
         delta_distance=(delta_phase/(2*pi))*343/17500/2;%-((p(t)-p(1))/(2*pi))*343/17500/2
%          distance = [distance,-((p(t)-p(1))/(2*pi))*343/17500/2];
         distance(t)=distance(t-1)+delta_distance;
         phase = [phase,p(t)-p(1)];
         %phase = p;
     end
end

