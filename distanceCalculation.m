function [distance,p] = distanceCalculation( IChannal,QChannal )
    distance = [];
    phase = [];
    detalDistance = 0;
    %计算原始相位
    p = atan(QChannal./IChannal);
    %处理相位,当相位正负符号每次变换,就加2pi
%     for i = 1:size(rawPhase)
%         if 
%     end
    %计算距离
     for t = 2:length(p)
         %if sign(p())
         distance = [distance,-((p(t)-p(1))/(2*pi))*343/17500/2];
         phase = [phase,p(t)-p(1)];
     end
end

