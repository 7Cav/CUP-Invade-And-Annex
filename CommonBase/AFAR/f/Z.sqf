if(_this#0)then{
[]spawn{waitUntil{!isNull(findDisplay 312)};
{(_x#0)displayRemoveEventHandler["KeyDown",_x#1]}forEach[[findDisplay 46,kpDn],[findDisplay 312,kpDnZ]];
private _d=(findDisplay 46);private _zD=(findDisplay 312);
kpDnZ=_zD displayAddEventHandler["KeyDown","if(!r_dn_ && _this#1 in(actionKeys'pushToTalk'+actionKeys'pushToTalkDirect'+actionKeys'pushToTalkGroup'+actionKeys'pushToTalkVehicle'+actionKeys'pushToTalkSide'+actionKeys'pushToTalkCommand'))then{(findDisplay 312)displayRemoveEventHandler['KeyDown',kpDnZ];call r_dn}"];
kpZ=_zD displayAddEventHandler["KeyDown","if(!r_dn_ && _this#1 in actionKeys'curatorInterface')then{(findDisplay 312)displayRemoveEventHandler['KeyDown',kpZ];[]spawn r_z}"];
kpDn=_d displayAddEventHandler["KeyDown","if(!r_dn_ && _this#1 in(actionKeys'pushToTalk'+actionKeys'pushToTalkDirect'+actionKeys'pushToTalkGroup'+actionKeys'pushToTalkVehicle'+actionKeys'pushToTalkSide'+actionKeys'pushToTalkCommand'))then{(findDisplay 46)displayRemoveEventHandler['KeyDown',kpDnZ];call r_dn}"];
_zD displayAddEventHandler["KeyDown","if(inputAction'Diary'>0)then{call r_useRadio}"];
_zD displayAddEventHandler["KeyDown",{_block=false;if((_this#1)in(actionKeys'nextChannel'))then{_block=true;if(r_chOn)then{call NextCH}else{call r_useRadio}};_block}];
_zD displayAddEventHandler["KeyDown",{_block=false;if((_this#1)in(actionKeys'prevChannel'))then{_block=true;if(r_chOn)then{call PrevCH}else{call r_useRadio}};_block}];
kpZ=_d displayAddEventHandler["KeyDown","if(!r_dn_ && _this#1 in actionKeys'curatorInterface')then{(findDisplay 46)displayRemoveEventHandler['KeyDown',kpZ];[]spawn r_z}"]}
}else{
[]spawn{waitUntil{!isNull(findDisplay 46)};
{(_x#0)displayRemoveEventHandler["KeyDown",_x#1]}forEach[[findDisplay 46,kpDn],[findDisplay 312,kpDnZ]];
kpDn=(findDisplay 46)displayAddEventHandler["KeyDown","if(!r_dn_ && _this#1 in(actionKeys'pushToTalk'+actionKeys'pushToTalkDirect'+actionKeys'pushToTalkGroup'+actionKeys'pushToTalkVehicle'+actionKeys'pushToTalkSide'+actionKeys'pushToTalkCommand'))then{(findDisplay 46)displayRemoveEventHandler['KeyDown',kpDnZ];call r_dn}"];
kpZ=(findDisplay 46)displayAddEventHandler["KeyDown","if(!r_dn_ && _this#1 in actionKeys'curatorInterface')then{(findDisplay 46)displayRemoveEventHandler['KeyDown',kpZ];[]spawn r_z}"]}}