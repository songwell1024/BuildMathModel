function a = PeopleWorth(PeopleNum,CORP)
n = 0;
M =1;
% h = zeros(3,1);
h = [];
data = zeros(3,1);

for i =1:1:12
    for j = 1 :1 : 12
        if(j ~= i)
            for k = 1 :1 : 12
                if( k ~= j && k ~= i)
                    Num(M) = sqrt(PeopleNum(i) * PeopleNum(k)) - sqrt(PeopleNum(i) * PeopleNum(j)) -sqrt(PeopleNum(j) * PeopleNum(k));
                    if Num(M) > 0
                        n = n+1;
                        data(1) = i;
                        data(2) = j;
                        data(3) = k;
                        h = [h,data];
                    end
                    M = M +1;
                end
            end
        end
        
    end
end
 
Mid  = h (2 ,:);

a = zeros(1,3);
if CORP==1       %城市
    for index = 1 :1 : length(Mid)
        if(Mid(index) == 3)
           a(1)= a(1)+ 1; 
        elseif(Mid(index) == 11)
          a(2)= a(2)+ 1; 
        elseif(Mid(index) == 12)
           a(3)= a(3)+ 1; 
        end
    end
end

if CORP==2   %省
    for index = 1 :1 : length(Mid)
        if(Mid(index) == 3)
           a(1)= a(1)+ 1; 
        elseif(Mid(index) == 4)
          a(2)= a(2)+ 1; 
        elseif(Mid(index) == 12)
           a(3)= a(3)+ 1; 
        end
    end
end



figure
axis equal;            %画最小生成树   
hold on
[x,y]=cylinder(1,12);   %画出顶点，均匀画圆
xm=min(x(1,:));
ym=min(y(1,:));
xx=max(x(1,:));
yy=max(y(1,:));
axis([xm-abs(xm)*0.15,xx+abs(xx)*0.15,ym-abs(ym)*0.15,yy+abs(yy)*0.15]);
plot(x(1,:),y(1,:),'ko'); 
City = {'京津','哈尔滨','乌鲁木齐','上海','西安','郑州','武汉','成都','重庆','广深','昆明','拉萨'};
for i=1:12
    temp=[(City(i))];
    text(x(1,i),y(1,i),temp);
end

m  = 1;
for i=1:length(h)  %画出树内的边
    if(i <=length(h) -1)
        if h(1,i) == h(1,i+1) && h(2,i) == h(2,i+1)  
            plot(x(1,h(1:2,i)),y(1,h(1:2,i)),'r','linewidth',0.3 *m);
            m = m +1;
        else
            m = 1;
            plot(x(1,h(1:2,i)),y(1,h(1:2,i)),'r','linewidth',0.3 *m);
            
        end
    end

%     plot(x(1,h(1:2,i)),y(1,h(1:2,i)),'r');
end
title('中间节点');
end


