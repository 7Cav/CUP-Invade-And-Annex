//Control
#define CT_STATIC	0	0x00
#define CT_STRUCTURED_TEXT	13	0x0D
#define CT_BUTTON	1	
//Style
#define ST_SINGLE	0	0x00
#define ST_PICTURE	48	0x30

class AFAR_Button {
access=0;
type=1;
text="";
colorText[]={0,0,0,1};
colorDisabled[]={0,0,0,0};
colorBackground[]={0,1,0,0.2};
colorBackgroundDisabled[]={0,0,0};
colorBackgroundActive[]={0,0,0,0};
colorFocused[]={0,0,0,0};
colorShadow[]={0,0,0,0};
colorBorder[]={0,0,0,0};
soundEnter[]={"",0,0};
soundPush[]={"",0,0};
soundClick[]={"",0,0};
soundEscape[]={"",0,0};
style=2;
x=0;
y=0;
w=0;
h=0;
shadow=0;
font="LCD14";
sizeEx=0.0.022*safezoneH;
offsetX=0.003;
offsetY=0.003;
offsetPressedX=0;
offsetPressedY=0;
borderSize=0;};
class AFAR_Text {
deletable=0;
fade=0;
access=0;
type=13;
idc=80085;
style=0;
colorText[]={0,0,0,0};
class Attributes{
font="LCD14";
color="#000000";
align="left";
shadow=0;};
x=0.33*safezoneW+safezoneX;
y=0.38*safezoneH+safezoneY;
w=0.13*safezoneW;
h=0.086*safezoneH;
text="";
size=0.022*safezoneH;
shadow=0;};