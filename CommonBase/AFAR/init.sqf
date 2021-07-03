if(!hasInterface&&{didJip})exitWith{};//Do not initialize on HC
if(!isServer&&hasInterface&&isNull player || didJIP)then{diag_log"JIP Detected";waitUntil{!isNull player};systemChat"[AFAR: JIP Detected]"};//JIP Compatibility
if((isClass(configFile>>"CfgPatches">>"task_force_radio"))||{(isClass(configFile>>"CfgPatches">>"acre_main"))})exitWith{};
#include "CFG.sqf"
r_vol=1;r_UI=0;
{_x enableChannel[false,false]}count[0,1,2,3,4,6,7,8,9];
waitUntil{!isNil"r_chat"};
private _txt=[
(if(r_sideCH)then{"<font color='#00bdff'>SIDE</font>, "}else{""}),
format["<font color='#768ce0'>%1</font>",(toUpperANSI r_mCHName)],
(if(r_sideCH)then{"• Everyone on your Side can communicate via <font color='#00bdff'>Side channel</font><br/><br/>"}else{""}),
format["<font color='#768ce0'>%1 channel</font>",r_mCHName],
(if(r_alertOn)then{"<br/>• Talking will alert nearby enemies <img image='\A3\Ui_f\data\IGUI\Cfg\simpleTasks\types\listen_ca.paa' width='18' height='18'/><br/><br/>"}else{"<br/>"}),
(if(r_incap)then{"• Cannot communicate via radio if incapacitated<br/><br/>"}else{""}),
(if(!r_chOn)then{"• Cannot use channel switching keybinds, must use handheld radio interface"}else{""}),
(if(r_sideCH)then{" and <font color='#00bdff'>Side</font>"}else{""}),
(if(!r_chOn)then{"     6. Cycle radio channels via the radio interface (Diary Key)<br/><br/>"}else{""})];
private _AFARtxt=str composeText["
<font face='PuristaMedium' size='30' color='#808000'>ADDON-FREE ARMA RADIO</font><img image='\A3\Ui_f\data\IGUI\Cfg\simpleTasks\types\radio_ca.paa'/><b/><br/>Created by Phronk<br/>
<br/>
<font face='PuristaMedium' size='20' color='#808000'>SETUP RADIO</font><br/>
     0. Equip a radio or radio backpack<br/><br/>
     1. Use a PUSH TO TALK key to talk via radio<br/><br/>
     2. Open the in-game menu and go into 'Configure>Controls>Multiplayer'<br/><br/>
     3. Set your PUSH TO TALK key<br/><br/>
     4. Unbind your VoiceOverNet keybind!<br/><br/>
     5. Raise both the VON and Effects volume slider in AUDIO settings<br/><br/>",_txt#8,"

<font face='PuristaMedium' size='20' color='#808000'>OPERATING RADIO</font><br/>
• Radio must be equipped to send/receive transmissions with those in radio range<br/><br/>
• Radio channels are ",_txt#0,"<font color='#fffaa3'>COMMAND</font>, <font color='#b6f442'>GROUP</font>, <font color='#f4c542'>VEHICLE</font>, and ",_txt#1,"<br/><br/>
• <font color='#b6f442'>Group</font>",_txt#7," channel radio range is 3200 meters<br/><br/>
• <font color='#fffaa3'>Command</font> and ",_txt#3," radio range is 9600 meters<br/><br/>
• Terrain interference affects transmission strength by 50%<br/><br/>",_txt#2,
"• Only squad leaders can communicate via <font color='#fffaa3'>Command channel</font><br/><br/>
• Only squadmates can communicate via <font color='#b6f442'>Group channel</font><br/><br/>
• Only vehicle passengers can communicate via <font color='#f4c542'>Vehicle channel</font><br/><br/>",
"• Only RTOs, pilots, copilots, and gunners can use ",_txt#3,"<br/><br/>
• Everyone in close proximity can communicate via <font color='#ffffff'>Direct channel</font><br/>",_txt#4,
"• Cannot communicate if dead or underwater without rebreather<br/><br/>",_txt#5,_txt#6];
player createDiarySubject["Arma Radio","ArmA Radio"];
player createDiaryRecord["Arma Radio",["Instructions Manual",_AFARtxt]];
if(isServer)then{
waitUntil{!isNil"r_mCHName"};diag_log format["r_mCHName loaded: %1",r_mCHName];
private _txt="("+r_mCHName+") "+"%UNIT_NAME";private _txt2=" channel";
ch6=radioChannelCreate[[0.2,0.2,1,0.8],r_mCHName+_txt2,_txt,[]];
ch7=radioChannelCreate[[0.2,1,0.2,0.8],r_mCHName+_txt2,_txt,[]];
ch8=radioChannelCreate[[1,0.2,0.2,0.8],r_mCHName+_txt2,_txt,[]];
{publicVariable _x}forEach["ch6","ch7","ch8"];
ch9=13;
if("Spectator"in getMissionConfigValue"respawnTemplates")then{ch9=radioChannelCreate[[0.2,1,1,0.8],"Spectator channel","(Spectator) %UNIT_NAME",[]]};
publicVariable"ch9"};sleep 0.02;
if(r_sideCH)then{r_CH=[1,2,3,4,(ch6+5),(ch7+5),(ch8+5)]}else{r_CH=[2,3,4,(ch6+5),(ch7+5),(ch8+5)]};publicVariable"r_CH";
if(isDedicated)exitWith{};
waitUntil{!isNil"r_CH"};
waitUntil{!isObjectHidden player&&alive player};
r_RTOBP=["B_RadioBag_01_base_F","CUP_B_Kombat_Radio_Olive","CUP_B_Motherlode_Radio_MTP","CUP_B_Predator_Radio_MTP"]+r_RTOBP;
missionNamespace setVariable["r_p",player];player linkItem"ItemRadio";
{missionNamespace setVariable[(_x#0),compileFinal(loadFile(_x#1))]}forEach
[["r_RC","AFAR\f\hasRadio.sqf"],
["r_d","AFAR\f\d.sqf"],
["r_noCHS","AFAR\f\noCHS.sqf"],
["r_noMB","AFAR\f\noMB.sqf"],
["r_allOn","AFAR\f\allOn.sqf"],
["r_allOff","AFAR\f\allOff.sqf"],
["r_RTO","AFAR\f\RTO.sqf"],
["r_alert","AFAR\f\alert.sqf"],
["r_fuzz","AFAR\f\fuzz.sqf"],
["r_up","AFAR\f\up.sqf"],
["r_dn","AFAR\f\dn.sqf"],
["r_opt","AFAR\f\opt.sqf"],
["r_out","AFAR\f\out.sqf"],
["r_out2","AFAR\f\out2.sqf"],
["r_anm","AFAR\f\anim.sqf"],
["r_z","AFAR\f\z.sqf"],
["C_In","AFAR\f\C_In.sqf"],
["D_In","AFAR\f\D_In.sqf"],
["G_In","AFAR\f\G_In.sqf"],
["M_In","AFAR\f\M_In.sqf"],
["S_In","AFAR\f\S_In.sqf"],
["V_In","AFAR\f\V_In.sqf"],
["cOut","AFAR\f\cOut.sqf"],
["dOut","AFAR\f\dOut.sqf"],
["gOut","AFAR\f\gOut.sqf"],
["mOut","AFAR\f\mOut.sqf"],
["sOut","AFAR\f\sOut.sqf"],
["vOut","AFAR\f\vOut.sqf"],
["r_ehAdd","AFAR\f\eh.sqf"],
["nextCH","AFAR\f\nextCH.sqf"],
["prevCH","AFAR\f\prevCH.sqf"],
["rVol","AFAR\f\vol.sqf"],
["rVolu","AFAR\f\volu.sqf"],
["r_useRadio","AFAR\f\ui.sqf"]];
waitUntil{!isNil"r_useRadio"};
[]spawn compileFinal(preprocessFile"AFAR\f\init.sqf")