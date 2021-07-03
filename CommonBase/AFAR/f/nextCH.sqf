_CH=currentChannel;
_seat=((assignedVehicleRole r_p in[["driver"],["Turret",[0]],["Turret",[0,0]]])&&{(objectParent r_p isKindOf"Air"&&!(objectParent r_p isKindOf"ParachuteBase"))});
_ch6=(ch6+5);_ch7=(ch7+5);_ch8=(ch8+5);
_RTO=r_RTOBP findIf{unitBackpack r_p isKindOf _x}>=0;
playSound"r_nob";
switch(true)do{
case(_CH==1):{switch(true)do{
		case(true in r_cCH&&leader group r_p==r_p):{2 enableChannel r_cCH;setCurrentChannel 2};
		case(true in r_grCH):{3 enableChannel r_grCH;setCurrentChannel 3};
		case(true in r_vCH&&!isNull objectParent r_p):{4 enableChannel r_vCH;setCurrentChannel 4};
		case(true in r_mCH&&_RTO):{
		switch(playerSide)do{
			case WEST:{if(channelEnabled _ch6 isEqualTo[false,false])then{ch6 radioChannelAdd[r_p]};_ch6 enableChannel r_mCH;setCurrentChannel _ch6};
			case EAST:{if(channelEnabled _ch7 isEqualTo[false,false])then{ch7 radioChannelAdd[r_p]};_ch7 enableChannel r_mCH;setCurrentChannel _ch7};
			case INDEPENDENT:{if(channelEnabled _ch8 isEqualTo[false,false])then{ch8 radioChannelAdd[r_p]};_ch8 enableChannel r_mCH;setCurrentChannel _ch8}}};
		case(true in r_mCH&&_seat):{
			switch(playerSide)do{
			case WEST:{if(channelEnabled _ch6 isEqualTo[false,false])then{ch6 radioChannelAdd[r_p]};_ch6 enableChannel r_mCH;setCurrentChannel _ch6};
			case EAST:{if(channelEnabled _ch7 isEqualTo[false,false])then{ch7 radioChannelAdd[r_p]};_ch7 enableChannel r_mCH;setCurrentChannel _ch7};
			case INDEPENDENT:{if(channelEnabled _ch8 isEqualTo[false,false])then{ch8 radioChannelAdd[r_p]};_ch8 enableChannel r_mCH;setCurrentChannel _ch8}}};
		default{setCurrentChannel 3}}};

case(_CH==2):{switch(true)do{
		case(true in r_grCH):{3 enableChannel r_grCH;setCurrentChannel 3};
		case(true in r_vCH&&!isNull objectParent r_p):{4 enableChannel r_vCH;setCurrentChannel 4};
		case(true in r_mCH&&_RTO):{
		switch(playerSide)do{
			case WEST:{if(channelEnabled _ch6 isEqualTo[false,false])then{ch6 radioChannelAdd[r_p]};_ch6 enableChannel r_mCH;setCurrentChannel _ch6};
			case EAST:{if(channelEnabled _ch7 isEqualTo[false,false])then{ch7 radioChannelAdd[r_p]};_ch7 enableChannel r_mCH;setCurrentChannel _ch7};
			case INDEPENDENT:{if(channelEnabled _ch8 isEqualTo[false,false])then{ch8 radioChannelAdd[r_p]};_ch8 enableChannel r_mCH;setCurrentChannel _ch8}}};
		case(true in r_mCH&&_seat):{
			switch(playerSide)do{
			case WEST:{if(channelEnabled _ch6 isEqualTo[false,false])then{ch6 radioChannelAdd[r_p]};_ch6 enableChannel r_mCH;setCurrentChannel _ch6};
			case EAST:{if(channelEnabled _ch7 isEqualTo[false,false])then{ch7 radioChannelAdd[r_p]};_ch7 enableChannel r_mCH;setCurrentChannel _ch7};
			case INDEPENDENT:{if(channelEnabled _ch8 isEqualTo[false,false])then{ch8 radioChannelAdd[r_p]};_ch8 enableChannel r_mCH;setCurrentChannel _ch8}}};
		case(true in r_sCH&&r_sideCH):{1 enableChannel r_sCH;setCurrentChannel 1};
		default{setCurrentChannel 3}}};

case(_CH==3):{switch(true)do{
		case(true in r_vCH&&!isNull objectParent r_p):{4 enableChannel r_vCH;setCurrentChannel 4};
		case(true in r_mCH&&_RTO):{
			switch(playerSide)do{
			case WEST:{if(channelEnabled _ch6 isEqualTo[false,false])then{ch6 radioChannelAdd[r_p]};_ch6 enableChannel r_mCH;setCurrentChannel _ch6};
			case EAST:{if(channelEnabled _ch7 isEqualTo[false,false])then{ch7 radioChannelAdd[r_p]};_ch7 enableChannel r_mCH;setCurrentChannel _ch7};
			case INDEPENDENT:{if(channelEnabled _ch8 isEqualTo[false,false])then{ch8 radioChannelAdd[r_p]};_ch8 enableChannel r_mCH;setCurrentChannel _ch8}}};
		case(true in r_mCH&&_seat):{
			switch(playerSide)do{
			case WEST:{if(channelEnabled _ch6 isEqualTo[false,false])then{ch6 radioChannelAdd[r_p]};_ch6 enableChannel r_mCH;setCurrentChannel _ch6};
			case EAST:{if(channelEnabled _ch7 isEqualTo[false,false])then{ch7 radioChannelAdd[r_p]};_ch7 enableChannel r_mCH;setCurrentChannel _ch7};
			case INDEPENDENT:{if(channelEnabled _ch8 isEqualTo[false,false])then{ch8 radioChannelAdd[r_p]};_ch8 enableChannel r_mCH;setCurrentChannel _ch8}}};
		case(true in r_sCH&&r_sideCH):{1 enableChannel r_sCH;setCurrentChannel 1};
		case(true in r_cCH&&leader group r_p==r_p):{2 enableChannel r_cCH;setCurrentChannel 2};
		default{setCurrentChannel 3}}};

case(_CH==4):{switch(true)do{
		case(true in r_mCH&&_RTO):{
			switch(playerSide)do{
			case WEST:{if(channelEnabled _ch6 isEqualTo[false,false])then{ch6 radioChannelAdd[r_p]};_ch6 enableChannel r_mCH;setCurrentChannel _ch6};
			case EAST:{if(channelEnabled _ch7 isEqualTo[false,false])then{ch7 radioChannelAdd[r_p]};_ch7 enableChannel r_mCH;setCurrentChannel _ch7};
			case INDEPENDENT:{if(channelEnabled _ch8 isEqualTo[false,false])then{ch8 radioChannelAdd[r_p]};_ch8 enableChannel r_mCH;setCurrentChannel _ch8}}};
		case(true in r_mCH&&_seat):{
			switch(playerSide)do{
			case WEST:{if(channelEnabled _ch6 isEqualTo[false,false])then{ch6 radioChannelAdd[r_p]};_ch6 enableChannel r_mCH;setCurrentChannel _ch6};
			case EAST:{if(channelEnabled _ch7 isEqualTo[false,false])then{ch7 radioChannelAdd[r_p]};_ch7 enableChannel r_mCH;setCurrentChannel _ch7};
			case INDEPENDENT:{if(channelEnabled _ch8 isEqualTo[false,false])then{ch8 radioChannelAdd[r_p]};_ch8 enableChannel r_mCH;setCurrentChannel _ch8}}};
		case(true in r_sCH&&r_sideCH):{1 enableChannel r_sCH;setCurrentChannel 1};
		case(true in r_cCH&&leader group r_p==r_p):{2 enableChannel r_cCH;setCurrentChannel 2};
		case(true in r_grCH):{3 enableChannel r_grCH;setCurrentChannel 3};
		default{setCurrentChannel 3}}};

case(_CH==5):{setCurrentChannel 3};

case(_CH in[_ch6,_ch7,_ch8]):{switch(true)do{
	case(true in r_sCH&&r_sideCH):{1 enableChannel r_sCH;setCurrentChannel 1};
	case(true in r_cCH&&leader group r_p==r_p):{2 enableChannel r_cCH;setCurrentChannel 2};
	case(true in r_grCH):{3 enableChannel r_grCH;setCurrentChannel 3};
	case(true in r_vCH&&!isNull objectParent r_p):{4 enableChannel r_vCH;setCurrentChannel 4};
	default{setCurrentChannel 3}}}
};
_CH=currentChannel;
_txt=[switch(_CH)do{
case 1:{"SIDE"};
case 2:{"COMMAND"};
case 3:{"GROUP"};
case 4:{"VEHICLE"};
case 5:{"NONE"};
case(ch6+5):{toUpperANSI r_mCHName};
case(ch7+5):{toUpperANSI r_mCHName};
case(ch8+5):{toUpperANSI r_mCHName};
case(ch9+5):{"SPECTATOR"};
default{if(alive r_p)exitWith{5 enableChannel r_dCH;setCurrentChannel 5;"NONE"};
if(!alive r_p&&"Spectator"in getMissionConfigValue"respawnTemplates")then{setCurrentChannel(ch9+5);"SPECTATOR"}}},
(if(channelEnabled _CH#1)then{"<img size='0.7' image='\A3\ui_f\data\igui\cfg\simpleTasks\types\listen_ca.paa'/>"}else{"<t color='#22000000'><img size='0.7' image='\A3\ui_f\data\igui\cfg\simpleTasks\types\listen_ca.paa'/></t>"}),
(if(channelEnabled _CH#0)then{"<img size='0.7' image='\A3\ui_f\data\igui\cfg\simpleTasks\types\talk_ca.paa'/>"}else{"<t color='#22000000'><img size='0.7' image='\A3\ui_f\data\igui\cfg\simpleTasks\types\talk_ca.paa'/></t>"}),
(if((_CH in[1,3,4]&&{_x distance r_p<=3500}count(allPlayers-[r_p])>0)||(_CH in[2,(ch6+5),(ch7+5),(ch8+5)]&&{_x distance r_p<=8000}count(allPlayers-[r_p])>0))then{"<img size='0.7' image='\A3\ui_f\data\igui\cfg\simpleTasks\types\radio_ca.paa'/>"}else{"<t color='#22000000'><img size='0.7' image='\A3\ui_f\data\igui\cfg\simpleTasks\types\radio_ca.paa'/></t>"})];
(findDisplay 6966696 displayCtrl 80085)ctrlSetStructuredText(parseText format["<a size='0.7'>   G01</a><a align='right'>%2%3	%4<br/></a><a size='0.7'>   CH: %1<br/></a><a size='0.6' align='right'>PT		FM	</a>",_txt#0,_txt#1,_txt#2,_txt#3]);