     ______	      ________  	_______	     	  ________
    /      \\	     |	      ||       /      \\	 |        \\
   /    ^   \\	     |   -----||      /    ^   \\	 |    ^    \\
  /    /\    \\	     |    ____||     /    /\    \\	 |	   //
 /____/ /\____\\     |___|\___\|    /____/ /\____\\	 |    |\   \\
 \____\/  \____\\ ()) \__\|	()) \____\/  \____\\ ()) |____| \___\\ ())

  ______________________________________
 |	        			|
 |	   A D D O N - F R E E		|
 |	    A R M A   R A D I O		|
 |					|
 |	       	BY: PHRONK		| v0.97		01MAR2021
_|______________________________________|_______________________
[ D E S C R I P T I O N ]					|
-----------------------						|
  Scripted radio comms system using in-game VON, which doesn't	|
  require addons nor complex setup.				|
								|
								|
								|
[ F E A T U R E S ]						|
-------------------------					|
• All Content is Already in ArmA 3:				|
	-Clients don't need to download or setup anything	|
	-Less files added means more optimized mission filesize!|
	-Radio sounds are audio files pulled through the game	|
	-Character using radio animation is an Arma 3 animation	|
	-Default ArmA 3 "ItemRadio" is used for radio comms	|
	-ArmA 3 Livonia DLC radio backpacks used for radio comms|
								|
• Radio Effects:						|
	-Press & hold a 'PushToTalk' key to talk on radio	|
	-Pressing a 'PushToTalk' key will play a radio sound	|
	-Pressing a 'PushToTalk' key will play radio animation	|
	-Pressing a 'PushToTalk' key will alert nearby enemy AI	|
	-Releasing a 'PushToTalk' key will play a squelch sound |
	-Speaking on VON channels broadcasts a radio squelch and|
	noise sound for players with a radio			|
								|
• Radio Interface:						|
	-Pressing 'Diary' key will bring up radio		|
	-Radio can be dragged around screen wherever you want it| *NEW*
	-Click the center knob on radio to cycle thru channels	|
	-Click the top-left knob on radio to adjust radio volume| *NEW*
	-Click the 'Mode' button on radio UI for AFAR settings	|
	-Press 'Esc' key to put away radio.			|
								|
• Automatic TFAR / ACRE2 Detection:				|
	-Script wont initialize if TFAR/ACRE2 is enabled by host|
								|
• Radio Item Must Be Equipped To Communicate:			|
	-Player without a radio cannot talk on radio channels	|
	-Player without radio can still speak in Direct channel	|
	-Player cannot talk underwater without a rebreather	|
	-Handheld radio's maximum range is 3200 meters		| *NEW*
	-RTO backpack radio's maximum range is 9600 meters	| *NEW*
	-Players become less audible the farther away they are	| *NEW*
	-Terrain interference can greatly reduce audibility	| *NEW*
								|
• Side Channel: (DISABLED BY DEFAULT IN 'CFG.SQF')		|
	-Allows all players on same Side to communicate		|
								|
• Command Channel:						|
	-Radio works only for group leaders			|
								|
• Group Channel:						|
	-Radio works only all players in your group		|
								|
• Vehicle Channel:						|
	-Radio works with land, sea, and air vehicles		|
	-Allows talking with other players in your vehicle	|
								|
• "Air" Channel:						|
	-Name of channel can be changed in the 'CFG.SQF'	|
	-Each faction has their own "Air" channel		|
	-Radio works for:					|
		-Players with a radio backpack equipped		|
		-Pilots						|
		-Copilots					|
		-Gunners					|
								|
• Spectator Channel:						|
	-Spectators/dead players have their own channel		|
	-Only works in missions which use EGSpectator		|
								|
• AI enemies near talking player become alerted (OPTIONAL):	|
	-AI enemies within 9 meters of player are alerted	|
	-Can be disabled via the 'CFG.sqf'			|
								|
• Respawn Friendly						|
	-Script will not break upon dying / respawning.		|
								|
• Compatible with Arma's Revive template:			|
	-Incapacitated players cannot communicate via radio	|
	-Incapacitated players can still talk on Direct channel	|
	-Setting can be toggled via 'CFG.SQF'			|
	-Dead players cannot communicate at all			|
								|
• Compatible with Arma's End Game Spectator template		|
								|
• Compatible with Arma's Dynamic Groups system			|
								|
• Easy to Install & Configure:					|
	-Enable/disable Side channel				|
	-Configure channel permissions for each channel		|
	-Rename the "Air" channel				|
	-Array of units starting with RTO backpack		|
	-Allow/disallow incapacitated players from using radios	|
	-Allow/disallow player voices alerting nearby AI	|
	-Toggle radio animation when talking			|
	-Toggle in-game chat UI					|
	-(Can also locally adjust cosmetic options in radio UI)	|
								|
								|
 NOTE: If you ever experience the persistent radio static bug,	|
 just drop your radio and pick it back up.			|
    								|
________________________________________________________________|_______________________
[ C H A N G E - L O G ]									|
-------------------------								|
• Added: Distance and terrain factors impact radio interference				|
• Added: Volume control knob to radio interface						|
• Added: "vol.sqf" script to handle local radio volume for players			|
• Added: "volu.sqf" script to scale squelch and noise volumes				|
• Added: Volume knob handles radio VON, squelches and noise				|
• Added: Custom squelch-out noise for receiving players (+4kb)				|
• Added: Beep noise when clicking "Mode" button on radio interface			|
• Added: Radio interface can now be dragged around screen, position is cached		|
• Added: Dropping radio will reset cached radio UI position				|
											|
• Changed: Radio range is dictated by radio used, instead of channel			|
• Improved: Positioning/scale of radio interface across more screen varieties		|
• Merged: Scripted radio screen controls into "dialogs.hpp"				|
• Tweaked: Buttons are highlighted first few times you open the radio			|
• Tweaked: Squelches are only audible to client who is transmitting			|
• Tweaked: Increased long-range radio range from 8000m to 9600m				|
• Tweaked: Reduced short-range radio range from 3500m to 3200m				|
• Tweaked: Moved spawning of global squelch/noise code to "d.sqf"			|
• Tweaked: Opening radio while dead now switches you to Spectator channel		|
• Tweaked: '_p' is no longer a private variable in "M_In.sqf"				|
• Tweaked: Condensed help text in radio UI						|
											|
• Fixed: Check for radio or RTO backpack was broken in "d.sqf"				|
• Fixed: Talking in Spectator channel while respawning would soft-break AFAR		|
• Fixed: Opening radio when in Global channel would block channel switching		|
• Fixed: AFAR init muted Speech volume, which muted sounds like Tactical Ping		|
• Fixed: Players without a radio still heard VOIP in channels other than Direct		|
• Fixed: Radio no longer on top of "Press 'Esc' key to put away radio" text		|
											|
• Optimized: Changed backpack to unitBackpack in multiple scripts			|
• Optimized: Squelch-outs no longer checks receiver's incapacitated state		|
• Optimized: All controls are committed within a forEach, instead of individually	|
• Optimized: Replaced code to check for radio with 'r_rC' function in "out.sqf"		|
											|
• Replaced: 3D radio with a 2D image of a AN/PRC-148 Thales radio (+65kb)		|
• Replaced: Global squelch-out sound with more realistic end of transmission noise	|
• Removed: "Toggle 3D pop-up radio" option from AFAR options menu			|
• Removed: RscTitles reference from "Description.ext"					|
• Removed: "titles.hpp"									|
• Removed: "3DLR.sqf"									|
• Removed: r_3DR global variable							|
• Removed: Placeholder comments in UI code						|
											|
________________________________________________________________________________________|
[ T O    D O    L I S T ]								|
-------------------------								|
• Increase radio range when in military vehicles					|
• Voice clipping									|
• Experiment with programmable radio idea						|
• Release a separate standalone mod version (Low priority)				|
											|
________________________________________________________________________________________|
[ K N O W N   B U G S ]									|
-------------------------								|
 • Desync can cause delays in code execution						|
 • Displays other than 46 and 312 will pause your AFAR eventHandlers until it exits	|
________________________________________________________________________________________|
[ I N S T A L L A T I O N ]
-------------------------
0. Move the "AFAR" folder from downloaded file, to your mission	folder.
EXAMPLE: "My Documents\ArmA 3 - Other Profiles\<profile>\missions\myMission.VR"



1. Copy & Paste below code into your mission's "init.sqf":

[]spawn compileFinal(preprocessFile"AFAR\init.sqf");



2. Copy & Paste below code into your mission's "Description.ext" file:

#include "AFAR\ui\defines.hpp"
#include "AFAR\ui\dialogs.hpp"

class CfgSounds {
#include "AFAR\f\SFX.hpp"
sounds[]={};
};




________________________________________________________________________
[ C R E D I T S ]							|
-------------------------						|
	Phronk: Script Creator						|
	Bohemia Interactive: Radio audio / 3D model+texture / animation	|
									|
	[CONTRIBUTIONS]							|
	1. DirtySanchez reorganized AFAR and improved security		|
	2. Metalman10 [EXP] optimized initialization of functions	|
	3. Dedmen added important VON script commands to Arma 3		|
									|
	[TESTERS]							|
	1. Genesis92x							|
	2. Harris							|
	3. LightHouse							|
	4. MorpheousMike						|
	5. Moser							|
	5. newgen							|
	6. PRYMSUSPEC							|
	7. [TFR] Task Force Ronin  (Arma Community)			|
									|
________________________________________________________________________|
[ C O N T A C T ]							|
-------------------------						|
Need help?  Want to report a bug?  Want to donate?  Here's my info:	|
	1. PM Me: 	https://forums.bohemia.net/profile/785811-phronk|
	2. Donate:	https://www.paypal.me/Phronk			|
									|
________________________________________________________________________|
[ D I S C L A I M E R ]							|
----------------------------						|
As author of this script, I grant permission to all scripters/mission	|
designers to modify this script to their liking for PERSONAL USE.  	|
This includes granted permission to individuals and ArmA groups to host |
a mission using the script on a server.  HOWEVER, I DO NOT consent	|
publishing ANY VERSION of the script as their own.  """"""		|
									|
If you've made major changes to the script and wish to publish it,	|
PLEASE ASK ME FOR FOR PERMISSION TO BE GRANTED FIRST!			|
									|
Thank you and enjoy!							|
Phronk   (A.K.A.  Hustler)						|
________________________________________________________________________|