params["_c","_p","_d"];private["_d2"];
private _posA=getPosASL r_p;private _posA=[_posA#0,_posA#1,(_posA#2)+4];
private _posB=getPosASL _p;private _posB=[_posB#0,_posB#1,(_posB#2)+4];
_d2=0;
private _ti=terrainIntersectASL[_posA,_posB];
switch _c do{
case 1:{_d2=([[0,700],[700,1200],[1200,1700],[1700,2200],[2200,2700],[2700,3200]]findIf{_d > (_x#0)&&_d <= (_x#1)})};
case 2:{_d2=([[0,1600],[1600,3200],[3200,4800],[4800,6400],[6400,8000],[8000,9600]]findIf{_d > (_x#0)&&_d <= (_x#1)})}};
if(_d2>0)then{
_v=r_vol-(parseNumber(_d2 toFixed 1)*0.11/2)max 0.05;
if(_ti)then{_p setPlayerVONVolume _v/2}else{_p setPlayerVONVolume _v}}else{
if(_ti)then{_p setPlayerVONVolume r_vol/2}else{_p setPlayerVONVolume r_vol}};