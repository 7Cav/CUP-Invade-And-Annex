if((r_incap)&&(lifeState r_p=="INCAPACITATED"))then{1 enableChannel[false,false];setCurrentChannel 5}else{1 enableChannel r_sCH;{r_p remoteExec["r_out",_x]}forEach(allPlayers-[r_p]select{playerSide==side _x})};
if(r_vol>0)then{playSound("out"+str(call rVolu))};
_eh=["KeyDown","if(!r_dn_ && _this#1 in(actionKeys'pushToTalk'+actionKeys'pushToTalkDirect'+actionKeys'pushToTalkGroup'+actionKeys'pushToTalkVehicle'+actionKeys'pushToTalkSide'+actionKeys'pushToTalkCommand'))then{call r_dn}"];
kpDn=(findDisplay 46)displayAddEventHandler _eh;kpDnZ=(findDisplay 312)displayAddEventHandler _eh