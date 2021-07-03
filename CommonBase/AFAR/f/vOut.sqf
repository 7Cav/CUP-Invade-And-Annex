if((r_p call r_RC)&&{(!isNull objectParent r_p)})then{
_p=(crew(objectParent r_p)-[r_p]select{isPlayer _x});
if(count _p>0)then{4 enableChannel r_vCH;{"out5"remoteExecCall["playSound",_x]}forEach _p};if(r_vol>0)then{playSound("out"+str(call rVolu))}}else{setCurrentChannel 5;4 enableChannel[false,false]};
private _eh=["KeyDown","if(!r_dn_ && _this#1 in(actionKeys'pushToTalk'+actionKeys'pushToTalkDirect'+actionKeys'pushToTalkGroup'+actionKeys'pushToTalkVehicle'+actionKeys'pushToTalkSide'+actionKeys'pushToTalkCommand'))then{call r_dn}"];
kpDn=(findDisplay 46)displayAddEventHandler _eh;kpDnZ=(findDisplay 312)displayAddEventHandler _eh