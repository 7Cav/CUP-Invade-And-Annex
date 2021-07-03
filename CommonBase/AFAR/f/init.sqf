waitUntil{!isNull(findDisplay 46)};_d=(findDisplay 46);r_f=[];
missionNamespace setVariable["r_p",player];setCurrentChannel 5;
[]spawn{waitUntil{r_p==player};call r_allOn};

//Toggle radio channels when radio dropped/picked up
r_p addEventHandler["Put",{if(_this#2=="ItemRadio"||(r_RTOBP findIf{unitBackpack r_p isKindOf _x}>=0))then{if(r_p call r_RC)exitWith{};call r_allOff;{deleteVehicle(_x#1)}forEach r_f;r_f=[];{r_p remoteExecCall["r_out",_x]}forEach(allPlayers-[r_p]select{side _x==playerSide});
{uiNamespace setVariable[_x,nil]}forEach["AFAR_Pos","AFAR_txtPos","AFAR_txt2Pos","AFAR_batPos","AFAR_halpPos","AFAR_but2Pos","AFAR_but3Pos","AFAR_but4Pos"];r_UI=0}}];
r_p addEventHandler["Take",{if(_this#2=="ItemRadio"||(r_RTOBP findIf{unitBackpack r_p isKindOf _x}>=0))then{if(alive r_p)then{call r_allOn}}}];

//EHs to call In & Out functions on KeyPress/Release
_d displayAddEventHandler["KeyDown",{_block=false;if((_this#1)in(actionKeys"VoiceOverNet"))then{_block=true;titleText["Replace your 'VoiceOverNet' key with 'PushToTalk' instead!","PLAIN"];setCurrentChannel 5};_block}];
if(!r_chOn)then{_d displayAddEventHandler["KeyDown",{call r_noCHS}]};

//Block mouse-button inputs
_d displayAddEventHandler["MouseButtonDown",{call r_noMB}];


r_dn_=false;r_up_=false;
private _eh=["KeyDown","if(!r_dn_ && _this#1 in(actionKeys'pushToTalk'+actionKeys'pushToTalkDirect'+actionKeys'pushToTalkGroup'+actionKeys'pushToTalkVehicle'+actionKeys'pushToTalkSide'+actionKeys'pushToTalkCommand'))then{call r_dn}"];
kpDn=_d displayAddEventHandler _eh;kpDnZ=(findDisplay 312)displayAddEventHandler _eh;
kpUp=_d displayAddEventHandler["KeyUp",""];
kpZ=_d displayAddEventHandler["KeyDown","if(!r_dn_ && _this#1 in actionKeys'curatorInterface')then{[(isNull(findDisplay 312))]spawn r_z}"];

//Talking + reloading bug workaround
_d displayAddEventHandler["KeyDown","if(_this#1 in(actionKeys'reloadMagazine'))then{if(!r_Anim)exitWith{};if(isNull objectParent r_p && alive r_p && currentWeapon r_p!='')then{r_Anim=false;[]spawn{sleep 5;r_Anim=true}}}"];

_d displayAddEventHandler["KeyDown","if(inputAction'Diary'>0)then{call r_useRadio}"];

//Cycling channels via keybinds
_d displayAddEventHandler["KeyDown",{_block=false;if((_this#1)in(actionKeys'nextChannel'))then{_block=true;if(r_chOn)then{call NextCH}else{call r_useRadio}};_block}];
_d displayAddEventHandler["KeyDown",{_block=false;if((_this#1)in(actionKeys'prevChannel'))then{_block=true;if(r_chOn)then{call PrevCH}else{call r_useRadio}};_block}];

//Vehicle channel detection
r_p addEventHandler["GetInMan",{4 enableChannel r_vCH;(_this#0)call r_RTO}];
r_p addEventHandler["GetOutMan",{4 enableChannel[false,false];(_this#0)call r_RTO;if(currentChannel==4)then{setCurrentChannel 3}}];

r_p addEventHandler["Killed",{currentChannel call r_out2;call r_allOff;{deleteVehicle(_x#1)}forEach r_f;r_f=[];
{r_p remoteExecCall["r_out",_x]}forEach(allPlayers-[r_p]select{side _x==playerSide});
if("Spectator"in getMissionConfigValue"respawnTemplates")then{_ch9=(ch9+5);ch9 radioChannelAdd[player];_ch9 enableChannel[true,true];setCurrentChannel _ch9}}];

r_p addEventHandler["Respawn",{if(alive player&& !isNull player)then{if("Spectator"in getMissionConfigValue"respawnTemplates")then{ch9 radioChannelRemove[player]};missionNamespace setVariable["r_p",player];
call r_allOn;setCurrentChannel 5;r_dn_=false;call r_ehAdd}}];

//Block channel switching in Esc menu
r_myCH=5;r_escD=0;
[missionNamespace,"OnGameInterrupt",{
[(_this#0)]spawn{params["_d"];waitUntil{!isNull _d};
r_escD=_d displayAddEventHandler["KeyDown",{_block=false;if((_this#1)in(actionKeys"nextChannel"+actionKeys"prevChannel"))then{_block=true};_block}];
r_myCH=currentChannel;
(_this#0)spawn{waitUntil{isNull(_this)};_this displayRemoveEventHandler["KeyDown",r_escD];
if(currentChannel==r_myCH)exitWith{};
if((!alive r_p)||{(isObjectHidden r_p)||(isNull player)})then{if("Spectator"in getMissionConfigValue"respawnTemplates")then{ch9 radioChannelRemove[player]}else{call r_allOff}};
setCurrentChannel r_myCH}}}]call BIS_fnc_addScriptedEventHandler;

if(actionKeys"diary"isEqualTo[])then{systemChat"Please set a Diary keybind, via the Common controls!"};
if(actionKeys"PushToTalk"isEqualTo[])then{systemChat"Please set a PushToTalk keybind, via the Multiplayer controls!"};
if(!(actionKeys"VoiceOverNet"isEqualTo[]))then{systemChat"Please unbind your VoiceOverNet keybind via Multiplayer controls! (Use PushToTalk instead)"};
if((getAudioOptionVolumes#3)<0.5)then{systemChat"Please raise your VON volume in audio settings!"};

[0,(allPlayers-[r_p])]call r_d;
systemChat"[AFAR: Initialized]";setCurrentChannel 5;