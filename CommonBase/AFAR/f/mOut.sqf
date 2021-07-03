private _seat=[["driver"],["Turret",[0]],["Turret",[0,0]]];private _p=[];
{private _y=_x;if((r_RTOBP findIf{unitBackpack _y isKindOf _x}>=0)||{(assignedVehicleRole _x in _seat && objectParent _x isKindOf"Air"&& !(objectParent _x isKindOf"ParachuteBase"))})then{_p pushBack _x}}forEach((allPlayers-[r_p]select{playerSide==side _x}));
if(count _p>0)then{
if((r_incap)&&(lifeState r_p=="INCAPACITATED"))then{
[currentChannel,[r_p]]call r_out2;{(_x#0)enableChannel[false,false];(_x#1)radioChannelRemove[r_p]}forEach[[(ch6+5),ch6],[(ch7+5),ch7],[(ch8+5),ch8]];setCurrentChannel 5;{r_p remoteExecCall["r_out",_x]}forEach _p}else{
switch(playerSide)do{
case WEST:{(ch6+5)enableChannel r_mCH};
case EAST:{(ch7+5)enableChannel r_mCH};
case INDEPENDENT:{(ch8+5)enableChannel r_mCH}};
{r_p remoteExec["r_out",_x]}forEach _p}};
if(r_vol>0)then{playSound("out"+str(call rVolu))};
_eh=["KeyDown","if(!r_dn_ && _this#1 in(actionKeys'pushToTalk'+actionKeys'pushToTalkDirect'+actionKeys'pushToTalkGroup'+actionKeys'pushToTalkVehicle'+actionKeys'pushToTalkSide'+actionKeys'pushToTalkCommand'))then{call r_dn}"];
kpDn=(findDisplay 46)displayAddEventHandler _eh;kpDnZ=(findDisplay 312)displayAddEventHandler _eh