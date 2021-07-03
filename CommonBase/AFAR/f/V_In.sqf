if((r_p call r_RC)&&(!isNull objectParent r_p))then{
_p=(crew objectParent r_p-[r_p]select{isPlayer _x});
if(count _p>0)then{4 enableChannel r_vCH;
{[r_p,r_vol]remoteExecCall["setPlayerVONVolume",_x];_x setPlayerVONVolume r_vol;"inA5"remoteExecCall["playSound",_x]}forEach _p;
if(r_vol>0)then{playSound("inA"+str(call rVolu))}}else{playSound"inB2"}}else{{_x enableChannel[false,false]}count r_CH;setCurrentChannel 5};
_eh=["KeyUp","if(!r_up_ && _this#1 in(actionKeys'pushToTalk'+actionKeys'pushToTalkVehicle'))then{call r_up}"];kpUp=(findDisplay 46)displayAddEventHandler _eh;kpUpZ=(findDisplay 312)displayAddEventHandler _eh