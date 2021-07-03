if(r_p call r_RC)then{
if(leader group r_p!=r_p)exitWith{2 enableChannel[false,false];setCurrentChannel 5;titleText["You are not the group leader","PLAIN DOWN"];titleFadeOut 5};
_p=(allPlayers-[r_p]select{leader group _x==_x&&side _x==playerSide});
if(r_alertOn)then{r_p call r_alert};
if(count _p>0)then{
if((r_incap)&&(lifeState r_p=="INCAPACITATED"))then{playSound"inB2";[2,_p]call r_out2;setCurrentChannel 5}else{
2 enableChannel r_cCH;
[(if(r_RTOBP findIf{unitBackpack r_p isKindOf _x}>=0)then{2}else{1}),_p]call r_d}}else{playSound"inB2"};call r_anm};
_eh=["KeyUp","if(!r_up_ && _this#1 in(actionKeys'pushToTalk'+actionKeys'pushToTalkCommand'))then{call r_up}"];kpUp=(findDisplay 46)displayAddEventHandler _eh;kpUpZ=(findDisplay 312)displayAddEventHandler _eh