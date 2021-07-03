if(r_p call r_RC)then{
_p=(allPlayers select{playerSide==side _x})-[player];
if(r_alertOn)then{r_p call r_alert};
if(count _p>0)then{
if((r_incap)&&(lifeState r_p=="INCAPACITATED"))then{1 enableChannel[false,false];playSound"inB2";setCurrentChannel 5;{r_p remoteExecCall["r_out",_x]}forEach _p}else{
{(_x#0)enableChannel(_x#1)}forEach[[1,r_sCH],[5,r_dCH]];
[(if(r_RTOBP findIf{unitBackpack r_p isKindOf _x}>=0)then{2}else{1}),_p]call r_d}}else{playSound"inB2"};call r_anm};
_eh=["KeyUp","if(!r_up_ && _this#1 in actionKeys'pushToTalk'+actionKeys'pushToTalkSide')then{call r_up}"];kpUp=(findDisplay 46)displayAddEventHandler _eh;kpUpZ=(findDisplay 312)displayAddEventHandler _eh