function S = LEVD2 (IQChannal)
    T = length(IQChannal); %输入数据点的长度
    E = []; %用于存储extrema,有标记其为最大值还是最小值，1为最大值，0为最小值
    S = [0]; %静态变量,初始值为刚测出来的值(为零)
    thr = 3*std(IQChannal(1:100)); %初始阈值,为前100个点的3倍标准差
    mark = 2;%标记位，标记最大值和最小值
    
    for t = 2:T-1
        %判断是极大值还是极小值，改变mark，第一个if
        if  ((IQChannal(t) > IQChannal(t-1)) & (IQChannal(t) > IQChannal(t+1)))
           mark = 1;
        elseif ((IQChannal(t) < IQChannal(t-1)) & (IQChannal(t) < IQChannal(t+1)))
           mark = 0;
        else
           mark = 2;
        end
        %如果不是极值点,S为前一个值,跳下一个循环
        if (mark == 2)
            S = [S;S(end)];
            continue;
        end
        %如果是极值点
        if (mark ~= 2)
            %E为空,直接入E,并且更新S为前一个值,跳下一个循环
            if isempty(E)
                E = [IQChannal(t);mark];
                S = [S;S(end)];
                continue;
                
            end
            %如果同样是极大/小值,并且比现有极大极小值更大(小),更新E
            if (mark == E(2,end))
                switch(mark)
                    case 0
                        if(IQChannal(t) < E(1,end))
                            E(1,end) = IQChannal(t);
                        end
                    case 1
                        if(IQChannal(t) > E(1,end))
                            E(1,end) = IQChannal(t);
                        end
                    otherwise
                end
            end
            %如果两者一个是极大值一个是极小值并且极值点超过阈值，把极大/小值放在E末尾
            if ((mark ~= E(2,end)) & (abs(IQChannal(t) - E(1,end))>thr))
                temp = [IQChannal(t);mark];
                E = [E,temp];
            end
            
        end
        %更新S,如果E只有一个值,S为前一个值,如果E为不同的极大极小值,S为E的差值
        if (size(E,2) < 2)
            S = [S;S(end)];
        else
            S = [S;[0.9 * S(end) + 0.1 * abs(E(1,end-1) - E(1,end))/2]];
        end
    end
    %边界点T
    S = [S;[0.9 * S(end) + 0.1 * (E(1,end-1) + E(1,end))/2]];
end