if(r_p call r_RC)then{
if(r_vol==0)exitWith{};
params["_c","_u"];
_f="Land_HelipadEmpty_F"createVehicleLocal[0,0,0];r_f pushBack[getPlayerUID _u,_f];
private _val=[0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1];
private _valu=_val findIf{_x==r_vol};
if(_c==0)then{playSound("in"+str(_valu))}else{playSound("inA"+str(_valu))};
while{!isNull _f&&alive _u&&((!r_incap)||(lifeState _u!="INCAPACITATED"))}do{_valu=_val findIf{_x==r_vol};_f say2D("fuz"+str(_valu));sleep 5}}