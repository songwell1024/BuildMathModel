function [Wt_16,Wt_33]  =MaxWorthProblem2()           %2.2�����˿�

PeopleNum = xlsread('�����˿�');   % ��λmillion
CityDistance =  xlsread('�����о���');  % ��λkm
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
% Kruskal2(Worth);
% Wpt_16 = Kruskal(Worth, 16);
% Wpt_33 = Kruskal(Worth, 33 );

Wt_16 = KruskalProblem2(Worth, 16);

Wt_33 = KruskalProblem2(Worth, 33);
end