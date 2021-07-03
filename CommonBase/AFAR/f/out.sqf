params["_u"];
_n=getPlayerUID _u;
_r_f2=r_f;
_f=r_f select{_n in _x};_f apply{deleteVehicle(_x#1)};
{if(_n in _x)then{r_f deleteAt _forEachIndex};
if(r_p call r_rC)then{if(alive _u && r_vol>0)then{playSound"outB2"}}}forEach _r_f2