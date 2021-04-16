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
	"<br/>GUNSLINGER-6 : LR - CH 2 (Battlegroup) LR - CH 3 (Platoon), SR - BL 3 CH 6
	<br/>GUNSLINGER-5 : LR - CH 2 (Battlegroup) LR - CH 3 (Platoon), SR - BL 3 CH 6
	<br/>GUNSLINGER-7 : LR - CH 2 (Battlegroup) LR - CH 3 (Platoon), SR - BL 3 CH 6
	<br/>INFIDEL-1 : LR - CH 3 (Platoon) LR - CH 7 (Call For Fire), SR - BL 3 CH 6
	<br/>
	<br/>GUNSLINGER-1 : LR - CH 3 (Platoon), SR - BL3 CH 1
	<br/>GUNSLINGER-2 : LR - CH 3 (Platoon), SR - BL3 CH 2
	<br/>GUNSLINGER-3 : LR - CH 3 (Platoon), SR - BL3 CH 3
	<br/>GUNSLINGER-4 : LR - CH 3 (Platoon), SR - BL3 CH 4	
	<br/>ATLAS-1 : LR - CH 3 (Platoon), SR - BL3 CH 5
	<br/>	
	<br/>SABER-1 : LR CH - 2 (Battlegroup) LR CH - 4 (Section), SR - BL5 CH 1	
	<br/>SABER-2 : LR CH - 4 (Section), SR - BL5 CH 1	
	<br/>		
	<br/>ATLAS-4 : LR - CH 2 (Battlegroup) LR - CH 8 (Call for Resupply), SR - BL 6 CH 2
	<br/>
	<br/>BUFFALO-1 : LR - CH 6 (Air), SR - BL 6 CH 3
	<br/>BUFFALO-2 : LR - CH 6 (Air), SR - BL 6 CH 4
	<br/>TITAN-1 : LR - CH 6 (Air), SR - BL 6 CH 5	
	<br/>
	<br/>RAIDER-1 : LR - CH 6 (Air) LR - CH 7 (Call for Fire), SR - BL 6 CH 7	
	<br/>HOG-1 : LR - CH 6 (Air) LR - CH 7 (Call for Fire), SR - BL 6 CH 9	
	<br/>
	<br/>LONGSHOT-1 : LR - CH 2 (Battlegroup), SR - BL 7 CH 1
	"]
];

player createDiaryRecord ["Diary", 
	["HOW TO PLAY", 
	"<br/>Welcome to the 7th Cavalry Gaming Regiment's RHS Invade and Annex Server!
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
	<br/>A Sector can have one or more Side Objectives. 
	<br/>You will need to perform reconmainssance to determine what Side Objectives are to be completed in the Sector.	
	<br/>
	<br/>TRANSPORTING VEHICLES VIA AIR
	<br/>
	<br/>In order to expedite the movement of vehicles around the map it is possible to ACE Load any vehicle into any Vehicle-in-Vehicle (VIV) variant of Transport aircraft.
	<br/>VIV Helicopters can ACE Load one vehicle, VIV Planes can ACE Load two vehicles.
	"]
];

attendance_flag addAction["=START ATTENDANCE TRACKING=","MissionScripts\startAttendanceTracking.sqf","",1.5,true,true,"","(call BIS_fnc_admin) == 2",10];
attendance_flag addAction["=STOP ATTENDANCE TRACKING=","MissionScripts\stopAttendanceTracking.sqf","",1.5,true,true,"","(call BIS_fnc_admin) == 2",10];
attendance_flag addAction["=SHOW ATTENDANCE - PAGE 1=","MissionScripts\showAttendance.sqf",1,1.5,true,true,"","(call BIS_fnc_admin) == 2",10];
attendance_flag addAction["=SHOW ATTENDANCE - PAGE 2=","MissionScripts\showAttendance.sqf",2,1.5,true,true,"","(call BIS_fnc_admin) == 2",10];
attendance_flag addAction["=SHOW ATTENDANCE - PAGE 3=","MissionScripts\showAttendance.sqf",3,1.5,true,true,"","(call BIS_fnc_admin) == 2",10];
attendance_flag addAction["=SHOW ATTENDANCE - PAGE 4=","MissionScripts\showAttendance.sqf",4,1.5,true,true,"","(call BIS_fnc_admin) == 2",10];
attendance_flag addAction["=SHOW ATTENDANCE - PAGE 5=","MissionScripts\showAttendance.sqf",5,1.5,true,true,"","(call BIS_fnc_admin) == 2",10];
attendance_flag addAction["=SHOW ATTENDANCE - PAGE 6=","MissionScripts\showAttendance.sqf",6,1.5,true,true,"","(call BIS_fnc_admin) == 2",10];
attendance_flag addAction["=SHOW ATTENDANCE - PAGE 7=","MissionScripts\showAttendance.sqf",7,1.5,true,true,"","(call BIS_fnc_admin) == 2",10];
attendance_flag addAction["=SHOW ATTENDANCE - PAGE 8=","MissionScripts\showAttendance.sqf",8,1.5,true,true,"","(call BIS_fnc_admin) == 2",10];
attendance_flag addAction["=SHOW ATTENDANCE - PAGE 9=","MissionScripts\showAttendance.sqf",9,1.5,true,true,"","(call BIS_fnc_admin) == 2",10];
attendance_flag addAction["=SHOW ATTENDANCE - PAGE 10=","MissionScripts\showAttendance.sqf",10,1.5,true,true,"","(call BIS_fnc_admin) == 2",10];

addMissionEventHandler ["Draw3D",
	{		
		_minDistance = 5;
		_maxDistance = 200;
		
		if (player inArea "sector_home") then
		{
			if (((getPos player) distance (getMarkerPos "HUD_arsenals") >= _minDistance) and ((getPos player) distance (getMarkerPos "HUD_arsenals") <= _maxDistance)) then
			{
				_distance = (getPos player) distance (getMarkerPos "HUD_arsenals");
				drawIcon3D["\a3\ui_f\data\IGUI\cfg\Actions\Obsolete\ui_action_gear_ca.paa"
						, [1,1,1,1]
						, [getMarkerPos "HUD_arsenals" select 0, getMarkerPos "HUD_arsenals" select 1, (getMarkerPos "HUD_arsenals" select 2) + 2]
						, 1
						, 1
						, 0
						, "ARSENALS"];
			};	
			
			if (getMarkerPos "HUD_rotaryWingPool" select 0 != 0) then
			{
				if (((getPos player) distance (getMarkerPos "HUD_rotaryWingPool") >= _minDistance) and ((getPos player) distance (getMarkerPos "HUD_rotaryWingPool") <= _maxDistance)) then
				{
					drawIcon3D["\a3\ui_f\data\igui\cfg\simpleTasks\types\heli_ca.paa"
								, [1,1,1,1]
								, [getMarkerPos "HUD_rotaryWingPool" select 0, getMarkerPos "HUD_rotaryWingPool" select 1, (getMarkerPos "HUD_rotaryWingPool" select 2) + 2]
								, 1
								, 1
								, 0
								, "ROTARY WING POOL"];
				};
			};
			
			if (getMarkerPos "HUD_fixedWingCombatPool" select 0 != 0) then
			{
				if (((getPos player) distance (getMarkerPos "HUD_fixedWingCombatPool") >= _minDistance) and ((getPos player) distance (getMarkerPos "HUD_fixedWingCombatPool") <= _maxDistance)) then
				{
					drawIcon3D["\a3\ui_f\data\igui\cfg\MPTable\air_ca.paa"
								, [1,1,1,1]
								, [getMarkerPos "HUD_fixedWingCombatPool" select 0, getMarkerPos "HUD_fixedWingCombatPool" select 1, (getMarkerPos "HUD_fixedWingCombatPool" select 2) + 2]
								, 1
								, 1
								, 0
								, "COMBAT FIXED WING POOL"];		
				};
			};
			
			if (getMarkerPos "HUD_fixedWingTransportPool" select 0 != 0) then
			{
				if (((getPos player) distance (getMarkerPos "HUD_fixedWingTransportPool") >= _minDistance) and ((getPos player) distance (getMarkerPos "HUD_fixedWingTransportPool") <= _maxDistance)) then
				{
					drawIcon3D["\a3\ui_f\data\igui\cfg\MPTable\air_ca.paa"
								, [1,1,1,1]
								, [getMarkerPos "HUD_fixedWingTransportPool" select 0, getMarkerPos "HUD_fixedWingTransportPool" select 1, (getMarkerPos "HUD_fixedWingTransportPool" select 2) + 2]
								, 1
								, 1
								, 0
								, "TRANSPORT FIXED WING POOL"];		
				};
			};
			
			if (getMarkerPos "HUD_groundVehiclePool" select 0 != 0) then
			{
				if (((getPos player) distance (getMarkerPos "HUD_groundVehiclePool") >= _minDistance) and ((getPos player) distance (getMarkerPos "HUD_groundVehiclePool") <= _maxDistance)) then
				{
					drawIcon3D["\a3\ui_f\data\igui\cfg\simpleTasks\types\truck_ca.paa"
								, [1,1,1,1]
								, [getMarkerPos "HUD_groundVehiclePool" select 0, getMarkerPos "HUD_groundVehiclePool" select 1, (getMarkerPos "HUD_groundVehiclePool" select 2) + 2]
								, 1
								, 1
								, 0
								, "GROUND VEHICLE POOL"];				
				};
			};
			
			if (getMarkerPos "HUD_boatPool" select 0 != 0) then
			{
				if (((getPos player) distance (getMarkerPos "HUD_boatPool") >= _minDistance) and ((getPos player) distance (getMarkerPos "HUD_boatPool") <= _maxDistance)) then
				{
					drawIcon3D["\a3\ui_f\data\igui\cfg\simpleTasks\types\boat_ca.paa"
								, [1,1,1,1]
								, [getMarkerPos "HUD_boatPool" select 0, getMarkerPos "HUD_boatPool" select 1, (getMarkerPos "HUD_boatPool" select 2) + 2]
								, 1
								, 1
								, 0
								, "BOAT POOL"];				
				};
			};
		};		
	}
];

{
	[_x, typeOf player] execVM "MissionScripts\arsenal.sqf";
} forEach [arsenalBox_1, arsenalBox_2, arsenalBox_3, arsenalBox_4, arsenalBox_5, arsenalBox_6];

medical_tent addAction ["=FULL HEAL=",{(_this select 1) call ace_medical_treatment_fnc_fullHealLocal;}];

player addAction ["= SPAWN TRANSPORT =", {"rhsusf_m1043_w" createVehicle (getMarkerPos "transport_spawner");}, [], 1.5, true, true, "", "_this inArea 'transport_spawner'"];

private _supplyVehicle = missionNamespace getVariable ["forwardLogisticsVehicle",objNull];
private _supplyBox = missionNamespace getVariable ["forwardLogisticsBox",objNull];

while {isNull _supplyBox} do
{
	_supplyBox = missionNamespace getVariable ["forwardLogisticsBox",objNull];
	
	if (!isNull _supplyBox) then
	{
		[_supplyBox, typeOf player] execVM "MissionScripts\arsenal.sqf";
	};
	
	sleep 1;
};

while {isNull _supplyVehicle} do
{
	_supplyVehicle = missionNamespace getVariable ["forwardLogisticsVehicle",objNull];
	
	if (!isNull _supplyVehicle) then
	{
		[_supplyVehicle, typeOf player] execVM "MissionScripts\arsenal.sqf";
	};
	
	sleep 1;
};