function [CityNode,ProvienceNode] = Peo()
CityPeopleNum = xlsread('�����˿�');   % ��λmillion
ProviencePeopleNum =  xlsread('ʡ�˿�');   % ��λmillion
CityNode = PeopleWorth(CityPeopleNum,1);
ProvienceNode = PeopleWorth(ProviencePeopleNum,2);
end