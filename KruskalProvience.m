function Wt = KruskalProvience(a, L)          %%2.2
[i,j,b]=find(a);
data=[i';j';b'];
index=data(1:2,:);
loop=length(a)-1;
result=[];
n=max(size(a));
while length(result)<loop
   temp=max(data(3,:));
   flag=find(data(3,:)==temp);
   flag=flag(1);
   v1=index(1,flag);v2=index(2,flag);
   if v1~=v2
      result=[result,data(:,flag)];
   end
   index(find(index==v2))=v1;
   data(:,flag)=[];
   index(:,flag)=[];
end

figure
axis equal;            %画最小生成树   
hold on
[x,y]=cylinder(1,n);   %画出顶点，均匀画圆
xm=min(x(1,:));
ym=min(y(1,:));
xx=max(x(1,:));
yy=max(y(1,:));
axis([xm-abs(xm)*0.15,xx+abs(xx)*0.15,ym-abs(ym)*0.15,yy+abs(yy)*0.15]);
plot(x(1,:),y(1,:),'ko'); 
City = {'京津','哈尔滨','乌鲁木齐','上海','西安','郑州','武汉','成都','重庆','广深','昆明','拉萨'};
for i=1:n
    temp=[(City(i))];
    text(x(1,i),y(1,i),temp);
end

LL = L -11;
data = zeros(3,1);
for index = 1:1:LL
    data(1) = 6;
    data(2) = 7;
    data(3) = 2.397474938346593e+03;
    result=[result,data];
end
for i=1:L  %画出树内的边
    plot(x(1,result(1:2,i)),y(1,result(1:2,i)),'r','linewidth',1);
    if (i > 11 && i <=16)
        plot(x(1,result(1:2,i)),y(1,result(1:2,i)),'r','linewidth',2.5);   
    end
    
    if (i>16)
        plot(x(1,result(1:2,i)),y(1,result(1:2,i)),'r','linewidth',6);   
    end
   
end
title('最优化网络价值');
Wt = sum(result(3,:));     % 最优化网络权重
end
