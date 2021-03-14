waitUntil {(!(isNull player))};
waitUntil { local player };
waitUntil { getPlayerUID player != "" };

enableWeaponDisassembly false;

player addEventHandler ["Fired", {
	if ((getPos (_this select 0)) inArea "sector_home") then
	{
		deleteVehicle (_this select 6);
		titleText ["Firing weapons and placing / throwing explosives at base is STRICTLY PROHIBITED!", "PLAIN", 3];
	};
}];

player createDiaryRecord ["Diary", 
	["TEAMSPEAK", 
	"<br/> Server : ts3.7cav.us 
	<br/> Password : 7thCavalry"]
];

player createDiaryRecord ["Diary", 
	["FREQUENCIES", 
	"<br/> GODFATHER-6 : LR - CH 2 (Battlegroup), SR - BL 2 CH 1
	<br/> GODFATHER-5 : LR - CH 2 (Battlegroup), SR - BL 2 CH 1
	<br/> GODFATHER-7 : LR - CH 2 (Battlegroup), SR - BL 2 CH 1
	<br/> PEGASUS-6 : LR - CH 2 (Battlegroup) LR - CH 6 (Air), SR - BL 2 CH 1
	<br/>
	<br/> GUNSLINGER-6 : LR - CH 2 (Battlegroup) LR - CH 3 (Platoon), SR - BL 3 CH 6
	<br/> GUNSLINGER-5 : LR - CH 2 (Battlegroup) LR - CH 3 (Platoon), SR - BL 3 CH 6
	<br/> GUNSLINGER-7 : LR - CH 2 (Battlegroup) LR - CH 3 (Platoon), SR - BL 3 CH 6
	<br/> INFIDEL-1 : LR - CH 3 (Platoon) LR - CH 7 (Call For Fire), SR - BL 3 CH 6
	<br/>
	<br/> GUNSLINGER-1 : LR - CH 3 (Platoon), SR - BL3 CH 1
	<br/> GUNSLINGER-2 : LR - CH 3 (Platoon), SR - BL3 CH 2
	<br/> GUNSLINGER-3 : LR - CH 3 (Platoon), SR - BL3 CH 3
	<br/> GUNSLINGER-4 : LR - CH 3 (Platoon), SR - BL3 CH 4
	<br/> ATLAS-1 : LR - CH 3 (Platoon), SR - BL3 CH 5
	<br/>
	<br/> WATCHMAN-6 : LR - CH 2 (Battlegroup) LR - CH 4 (Platoon), SR - BL 4 CH 6
	<br/> WATCHMAN-5 : LR - CH 2 (Battlegroup) LR - CH 4 (Platoon), SR - BL 4 CH 6
	<br/> WATCHMAN-7 : LR - CH 2 (Battlegroup) LR - CH 4 (Platoon), SR - BL 4 CH 6
	<br/> INFIDEL-1 : LR - CH 4 (Platoon) LR - CH 7 (Call For Fire), SR - BL 4 CH 6
	<br/>
	<br/> WATCHMAN-1 : LR - CH 4 (Platoon), SR - BL 4 CH 1
	<br/> WATCHMAN-2 : LR - CH 4 (Platoon), SR - BL 4 CH 2
	<br/> WATCHMAN-3 : LR - CH 4 (Platoon), SR - BL 4 CH 3
	<br/> WATCHMAN-4 : LR - CH 4 (Platoon), SR - BL 4 CH 4
	<br/> ATLAS-2 : LR - CH 4 (Platoon), SR - BL 4 CH 5
	<br/>
	<br/> SABER-1 : LR CH - 1 (Battlegroup) LR CH - 5 (Section), SR - BL5 CH 1
	<br/> SABER-2 : LR CH - 1 (Battlegroup) LR CH - 5 (Section), SR - BL5 CH 2	
	<br/>
	<br/> SAPPER-1 : LR - CH 1 (Battlegroup), SR - BL 6 CH 1
	<br/> ATLAS-1 : LR - CH 1 (Battlegroup) LR - CH 8 (Call for Resupply), SR - BL 6 CH 2
	<br/>
	<br/> BUFFALO-1 : LR - CH 6 (Air), SR - BL 6 CH 3
	<br/> BUFFALO-2 : LR - CH 6 (Air), SR - BL 6 CH 4
	<br/> TITAN-1 : LR - CH 6 (Air), SR - BL 6 CH 5
	<br/> TITAN-2 : LR - CH 6 (Air), SR - BL 6 CH 6
	<br/>
	<br/> SPARROW-1 : LR - CH 6 (Air) LR - CH 7 (Call for Fire), SR - BL 6 CH 7
	<br/> SPARROW-2 : LR - CH 6 (Air) LR - CH 7 (Call for Fire), SR - BL 6 CH 8
	<br/> HOG-1 : LR - CH 6 (Air) LR - CH 7 (Call for Fire), SR - BL 6 CH 9
	<br/> HOG-2 : LR - CH 6 (Air) LR - CH 7 (Call for Fire), SR - BL 6 CH 9
	"]
];

player createDiaryRecord ["Diary", 
	["HOW TO PLAY", 
	"<br/>Welcome to the 7th Cavalry Gaming Regiment's CUP Invade and Annex Server!
	<br/>
	<br/>MISSION FLOW
	<br/>
	<br/>Your overall mission is to secure all Sectors on the Map.
	<br/>
	<br/>In order to secure a Sector you will need to :
	<br/>1) Defeat the majority of enemy forces deployed in the Sector
	<br/>2) Complete Side Objectives :
	<br/>- Elimination of a Mortar, Anti-Air or Anti-Vehicle Section
	<br/>- Destruction of a group of Supply Vehicles, Communication Towers or HQ Tents
	<br/>- Neutralization of an Officer, a Commando Team or a Sniper Team
	<br/>
	<br/>A Sector can have one or more Side Objectives or none at all! 
	<br/>You will need to perform reconmainssance to determine what Side Objectives are to be completed in the Sector, if any.
	<br/>
	<br/>VEHICLE EXCHANGE
	<br/>
	<br/>Where available, Vehicle Exchange Pads allow you to swap out one vehicle for an equivalent one in its class. 
	<br/>For example, you may be allowed to swap out your M1 Abrams MBT for a British Challenger 2 MBT.
	<br/>Simply move your chosen vehicle to the Entry Pad and Scroll Wheel Interact to exchange for a new vehicle.
	<br/>Your chosen vehicle will be available in the corresponding Exit Pad.
	<br/>
	<br/>TRANSPORTING VEHICLES VIA AIR
	<br/>
	<br/>In order to expedite the movement of vehicles around the map it is possible to ACE Load any vehicle into any Vehicle-in-Vehicle (VIV) variant of Transport aircraft.
	<br/>VIV Helicopters can ACE Load one vehicle, VIV Plans can ACE Load two vehicles.
	"]
];