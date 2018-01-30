function [distance,phase,p] = distanceCalculation( IChannal,QChannal )
    distance = [];
    phase = [];
    detalDistance = 0;
    %计算原始相位
    p = atan(IChannal./QChannal);
    %处理相位,当相位由正到负的时候,就加2pi
    
    %计算距离
    for t = 2:length(p)
        phase = [phase,p(t)-p(1)]; 
    end
    for i = 1:length(phase)-1
        if abs(phase(i)) > 1 & sign(phase(i))+sign(phase(i+1))==0
            phase(i+1:end) = phase(i+1:end) + sign(phase(i))*pi;
        end
    end
    distance = [distance,-(phase/(2*pi))*343/17500/2];
end

