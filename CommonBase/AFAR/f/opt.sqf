playSound"beep";
if(!dialog || (!isNull((findDisplay 6966696)displayCtrl 0506661)))exitWith{{ctrlDelete((findDisplay 6966696)displayCtrl _x)}forEach[0506661,0506662,0506663,0506664]};
disableSerialization;
_d=findDisplay 6966696;
_b1=_d ctrlCreate["RscButton",0506661];
_b1 ctrlSetPosition[(0.325*safezoneW+safezoneX),(0.38*safezoneH+safezoneY),(0.09*safezoneW),(0.025*safezoneH)];
_b1 ctrlSetBackgroundColor[0,0,0,1];
_b1 ctrlSetText"PTT RADIO ANIMATION";
if(r_Anim)then{_b1 ctrlSetTextColor[0,1,0,1]}else{_b1 ctrlSetTextColor[.5,.5,.5,1]};
_b1 ctrlSetTooltip"Toggle the PushToTalk pop-up radio";
_b1 ctrlSetTooltip"Toggle the PushToTalk radio animation";
_b1 ctrlAddEventHandler["ButtonClick",{if(r_Anim)then{(_this#0)ctrlSetTextColor[.5,.5,.5,1];r_Anim=false}else{(_this#0)ctrlSetTextColor[0,1,0,1];r_Anim=true}}];

_b2=_d ctrlCreate["RscButton",0506662];
_b2 ctrlSetPosition[(0.325*safezoneW+safezoneX),(0.43*safezoneH+safezoneY),(0.09*safezoneW),(0.025*safezoneH)];
_b2 ctrlSetText"UI & AI VOICE VOLUME";
_b2 ctrlSetBackgroundColor[0,0,0,1];
if(radioVolume>0)then{_b2 ctrlSetTextColor[0,1,0,1]}else{_b2 ctrlSetTextColor[.5,.5,.5,1]};
_b2 ctrlSetTooltip"Toggle volume for UI & AI";
_b2 ctrlAddEventHandler["ButtonClick",{if(radioVolume>0)then{(_this#0)ctrlSetTextColor[.5,.5,.5,1];0 fadeRadio 0}else{(_this#0)ctrlSetTextColor[0,1,0,1];0 fadeRadio 1}}];

_b3=_d ctrlCreate["RscButton",0506663];
_b3 ctrlSetPosition[(0.325*safezoneW+safezoneX),(0.48*safezoneH+safezoneY),(0.09*safezoneW),(0.025*safezoneH)];
_b3 ctrlSetText"SHOW CHAT";
_b3 ctrlSetBackgroundColor[0,0,0,1];
if(r_chat)then{_b3 ctrlSetTextColor[0,1,0,1]}else{_b3 ctrlSetTextColor[.5,.5,.5,1]};
_b3 ctrlSetTooltip"Toggle the chat & radio text";
_b3 ctrlAddEventHandler["ButtonClick",{if(r_chat)then{(_this#0)ctrlSetTextColor[.5,.5,.5,1];showChat false;r_chat=false}else{(_this#0)ctrlSetTextColor[0,1,0,1];showChat true;r_chat=true}}];
{_x ctrlCommit 0}forEach[_b1,_b2,_b3];