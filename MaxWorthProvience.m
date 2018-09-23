function [Wpt_16,Wpt_33]  =MaxWorthProvience()

PeopleNum = xlsread('省人口');   % 单位million
CityDistance =  xlsread('各城市距离');  % 单位km
Worth = zeros(12,12);
for i =  1 : 1 : 12
    for j = i : 1 : 12
        if( CityDistance(i,j) <= 3000 &&  CityDistance(i,j) >1200 )
            Worth(i, j) = 8 *sqrt(PeopleNum(i) * PeopleNum(j));
        elseif(CityDistance(i,j)<=1200 && CityDistance(i,j) > 600)
            Worth(i, j) = 16 *sqrt(PeopleNum(i) * PeopleNum(j));
        elseif(CityDistance(i,j)<=600 && CityDistance(i,j)> 0)
            Worth(i, j) = 32 *sqrt(PeopleNum(i) * PeopleNum(j));
        end
    end
end

Kruskal2(Worth)
Wpt_16 = KruskalProvience(Worth, 16);

Wpt_33 = KruskalProvience(Worth, 33);
end