function [CityNode,ProvienceNode] = Peo()
CityPeopleNum = xlsread('城市人口');   % 单位million
ProviencePeopleNum =  xlsread('省人口');   % 单位million
CityNode = PeopleWorth(CityPeopleNum,1);
ProvienceNode = PeopleWorth(ProviencePeopleNum,2);
end