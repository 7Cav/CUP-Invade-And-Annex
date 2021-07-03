
class Intro_Dialog {
  idd = 7740;
  movingEnabled = false;

  class controls {

    class rscPictureBackgroundBottom: RscPicture {
    	idc = 1202;
    	text = "#(argb,8,8,3)color(0.067,0.067,0.067,1)";
    	x = 0.2;
    	y = 0.71;
    	w = 0.6;
    	h = 0.01;
    };

    class rscPictureBackground: RscPicture {
    	idc = 1203;
    	text = "#(argb,8,8,3)color(0.118,0.11,0.114,1)";
    	x = 0.2;
    	y = 0.02;
    	w = 0.6;
    	h = 0.7;
    };

    class rscPictureBackgroundTop: RscPicture {
    	idc = 1204;
    	text = "#(argb,8,8,3)color(0.992,0.843,0,1)";
    	x = 0.2;
    	y = 0.02;
    	w = 0.6;
    	h = 0.01;
    };

    class rscLogo: RscPicture {
    	idc = 1200;
    	text = "Images\7CavLogo.paa";
    	x = 0.37;
    	y = 0.06;
    	w = 0.256;
    	h = 0.128;
    };

    class rscStructuredTextBox: RscStructuredText {
    	idc = 1100;
    	text = "<br/><t align='center'><t size='1.4'>Server Rules</t></t><br/>1) No Team Killing or Destruction of Friendly Equipment<br/>2) No Offensive or Disruptive Behaviour<br/>3) All Aviation Assets must be on Call and on Teamspeak<br/>4) You must play your role and cooperate with your team<br/><br/>Website: <a color='#FFD700' https://7cav.us/' > https://7cav.us/ </a><br/>Teamspeak: <a color='#FFD700'> ts3.7cav.us </a> Password : <a color='#FFD700'>7thCavalry</a><br/>Discord: <a color='#FFD700'> discord.7cav.us </a><br/>";
    	x = 0.24;
    	y = 0.15;
    	w = 0.525;
    	h = 0.41;
    	colorBackground[] = {-1,-1,-1,0};
    };

    class rscButtonAgree: RscButton {
    	idc = 1600;
		action = "closeDialog 0;";
		colorFocused[] = { 0.6, 0, 0, 1 };
		colorBackgroundActive[] = { 0.6, 0, 0, 1 };
		colorBackground[] = {0.6,0,0,1};
		text = "Agree";
		x = 0.42;
		y = 0.62;
		w = 0.175;
		h = 0.08;
    };	
  };
};
