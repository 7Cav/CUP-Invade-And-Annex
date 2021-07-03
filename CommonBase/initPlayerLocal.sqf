waitUntil {(!(isNull player))};
waitUntil { local player };
waitUntil { getPlayerUID player != "" };

player addEventHandler ["Fired", {
	if ((getPos (_this select 0)) inArea "sector_home") then
	{
		deleteVehicle (_this select 6);
		titleText ["Firing weapons and placing / throwing explosives at base is STRICTLY PROHIBITED!", "PLAIN", 3];
	};
}];

while { not (player getVariable ["bis_dg_ini", false]) } do
{
	["InitializePlayer", [player, true]] call BIS_fnc_dynamicGroups;
	sleep 1;
};

if ("Alpha" in (roleDescription player)) then
{
	player assignTeam "RED";
};

if ("Bravo" in (roleDescription player)) then
{
	player assignTeam "BLUE";
};

[missionNamespace, "arsenalOpened", {
	disableSerialization;
	_display = _this select 0;
	(_display displayCtrl 44150) ctrlRemoveAllEventHandlers "buttonclick";
	(_display displayCtrl 44150) ctrlEnable false;
	_display displayAddEventHandler ["KeyDown", "if ((_this select 1) in [19,29]) then {true}"];
}] call BIS_fnc_addScriptedEventHandler;

[player] execVM "MissionScripts\gearMonitor.sqf";

[] execVM "MissionScripts\forceTracker.sqf";

player setUnitTrait ["engineer",true];

joinFireteamActionMenuKeyPressed = false;
earplugsIn = false;
(findDisplay 46) displayAddEventHandler ["KeyDown", {
    params ["_displayorcontrol", "_key", "_shift", "_ctrl", "_alt"];
	joinFireteamActionMenuKeyPressed = false;
    if (_key == 20) then {
        joinFireteamActionMenuKeyPressed = true;
    };
    false
}];
(findDisplay 46) displayAddEventHandler ["KeyUp", {
    params ["_displayorcontrol", "_key", "_shift", "_ctrl", "_alt"];	
    if (_key == 20) then {
        joinFireteamActionMenuKeyPressed = false;
    };
    false
}];

player addEventHandler ["Killed", 
	{		
		_unit = _this select 0;
		_unit setVariable ["Saved_Loadout",getUnitLoadout _unit];		
	}
];

player addEventHandler ["Respawn", 
	{		
		_unit = _this select 0;		
		
		_loadout = _unit getVariable ["Saved_Loadout",[]];
		_unit setUnitLoadout _loadout;
		
		[_unit] execVM "MissionScripts\gearMonitor.sqf";
		
		if ("Alpha" in (roleDescription player)) then
		{
			player assignTeam "RED";
		};

		if ("Bravo" in (roleDescription player)) then
		{
			player assignTeam "BLUE";
		};
		
		_unit addAction ["JOIN FIRETEAM RED",{(_this select 1) assignTeam "RED";},nil,1.5,true,true,"","joinFireteamActionMenuKeyPressed"];
		_unit addAction ["JOIN FIRETEAM BLUE",{(_this select 1) assignTeam "BLUE";},nil,1.5,true,true,"","joinFireteamActionMenuKeyPressed"];
		_unit addAction ["JOIN FIRETEAM GREEN",{(_this select 1) assignTeam "GREEN";},nil,1.5,true,true,"","joinFireteamActionMenuKeyPressed"];
		_unit addAction ["JOIN FIRETEAM YELLOW",{(_this select 1) assignTeam "YELLOW";},nil,1.5,true,true,"","joinFireteamActionMenuKeyPressed"];
		_unit addAction ["JOIN FIRETEAM WHITE",{(_this select 1) assignTeam "DEFAULT";},nil,1.5,true,true,"","joinFireteamActionMenuKeyPressed"];
		_unit addAction ["EARPLUGS IN",{(_this select 1) setVariable ["earplugsVolume",soundVolume,false];1 fadeSound 0.2;earplugsIn = true;},nil,1.5,true,true,"","joinFireteamActionMenuKeyPressed and !earplugsIn"];
		_unit addAction ["EARPLUGS OUT",{1 fadeSound ((_this select 1) getVariable ["earplugsVolume",1]);earplugsIn = false;},nil,1.5,true,true,"","joinFireteamActionMenuKeyPressed and earplugsIn"];
		
		_unit setVariable["IsDragging",false,true];
		_unit setVariable["IsDragged",false,true];

		_unit setVariable["IsCarrying",false,true];
		_unit setVariable["IsCarried",false,true];

		_unit setVariable["Loaded",objNull,true];

		_unit setVariable["IsReviving",false,true];
		_unit setVariable["IsRevived",false,true];	
	}
];

addMissionEventHandler ["Draw3D",
	{
		{
			if ((_x != player) && ((_x distance player) < 50)) then
			{
				_teamColor = assignedTeam _x; // Retrieve assigned team color
				_markerColor = [1,1,1]; // convert it to RGB
				switch (_teamColor) do {
					case "RED" : {_markerColor = [1,0,0]};
					case "GREEN" : {_markerColor = [0,1,0]};
					case "BLUE" : {_markerColor = [0,0,1]};
					case "YELLOW" : {_markerColor = [1,1,0]};
				};
				// Passed parameters to the 3D icon draw function : 
				// - unit type icon from the Cfg
				// - the assigned team color R,G,B at a moderate 0.5 transparency
				// - the unit's X,Y height of 1 meter
				// - normal width
				// - normal height
				// - no rotation
				// - player's in-game name under the icon
				if (_x in (units group player)) then
				{
					drawIcon3D[getText (configFile >> "CfgVehicles" >> typeOf _x >> "icon"),[_markerColor select 0,_markerColor select 1,_markerColor select 2,0.7],[getPosATLVisual _x select 0,getPosATLVisual _x select 1,((getPosATLVisual _x) select 2) + 1],1,1,0, name _x];				
				}
				else
				{					
					drawIcon3D["",[0.6, 0.6, 0.6,1],[getPosATLVisual _x select 0,getPosATLVisual _x select 1,((getPosATLVisual _x) select 2) + 1],1,1,0, name _x];				
				};				
			};		
		} forEach allPlayers;

		if ((((getMarkerPos "halo_insert") select 0) > 0) and ((halo_flag distance player) < 50)) then
		{
			drawIcon3D[getText (configFile >> "CfgVehicles" >> "B_Parachute" >> "icon"),[1, 1, 1,1],[getPosATLVisual halo_flag select 0,getPosATLVisual halo_flag select 1,((getPosATLVisual halo_flag) select 2) + 1],1,1,0, "PARACHUTE SELF-INSERT"];
		};
	}
];

player addAction ["JOIN FIRETEAM RED",{(_this select 1) assignTeam "RED";},nil,1.5,true,true,"","joinFireteamActionMenuKeyPressed"];
player addAction ["JOIN FIRETEAM BLUE",{(_this select 1) assignTeam "BLUE";},nil,1.5,true,true,"","joinFireteamActionMenuKeyPressed"];
player addAction ["JOIN FIRETEAM GREEN",{(_this select 1) assignTeam "GREEN";},nil,1.5,true,true,"","joinFireteamActionMenuKeyPressed"];
player addAction ["JOIN FIRETEAM YELLOW",{(_this select 1) assignTeam "YELLOW";},nil,1.5,true,true,"","joinFireteamActionMenuKeyPressed"];
player addAction ["JOIN FIRETEAM WHITE",{(_this select 1) assignTeam "DEFAULT";},nil,1.5,true,true,"","joinFireteamActionMenuKeyPressed"];
player addAction ["EARPLUGS IN",{(_this select 1) setVariable ["earplugsVolume",soundVolume,false];1 fadeSound 0.2;earplugsIn = true;},nil,1.5,true,true,"","joinFireteamActionMenuKeyPressed and !earplugsIn"];
player addAction ["EARPLUGS OUT",{1 fadeSound ((_this select 1) getVariable ["earplugsVolume",1]);earplugsIn = false;},nil,1.5,true,true,"","joinFireteamActionMenuKeyPressed and earplugsIn"];

enableWeaponDisassembly false;

[player] execVM "MissionScripts\cavRevive.sqf";

if ((getPlayerUID player) in zeusGUIDs) then
{		
	_zeusGroup = createGroup sideLogic;
	_curator = _zeusGroup createUnit ["ModuleCurator_F", [0, 0, 0], [], 0, "NONE"];		
	player assignCurator _curator;
	_curator setVariable ["Addons",3,true];
};

halo_flag addAction ["PARACHUTE SELF-INSERT",
					{						
						_dir = markerDir "halo_insert";	
						(_this select 1) setDir _dir;
						(_this select 1) setPos (getMarkerPos "halo_insert"); 						
						[(_this select 1), 400] call bis_fnc_halo;
						sleep 0.1;
						(_this select 1) setVectorDir [sin _dir, cos _dir, 0];						
					}, 
					nil,
					1.5,
					true,
					true,
					"",
					"((getMarkerPos ""halo_insert"") select 0) > 0"];

player createDiaryRecord ["Diary", 
	["HINTS",
	"<br/>- Press ""U"" to open the Group Management Menu.
	<br/>- Keep ""T"" pressed then Scroll Wheel to access the Fireteam Join Actions.
	<br/>- Anyone can Carry, Drag, Load, Unload incapacitated allies. Only the Platoon Medic and Atlas-1 members can revive.
	<br/>- Use the Direct Voice Chat key to talk to nearby people. Use the Push to Talk Key to communicate via Radio.
	"]
];					
player createDiaryRecord ["Diary", 
	["HOW TO PLAY",
	"<br/>Welcome to the 7th Cavalry Gaming Regiment Tactical Realism 1 Server!	
	<br/>
	<br/>Your mission is to secure all of the Sectors on a given map. Securing a Sector requires completing two sets of objectives inside that Sector : Defeating the enemy Frontline Forces and fulfilling Side Objectives.
	<br/>
	<br/>A Sector can have one or more Side Objectives, ranging from Elimination of Supporting Assets such as a Mortar Section, Destruction of Critical Infrastructure such as Communication Towers or Neutralization of Specialized Troops such as a Sniper Team.
	<br/>
	<br/>IMPORTANT NOTE : For a Side Objective to be considered completed, any buildings, vehicles or static weapons associated with the Objective must be destroyed COMPLETELY. Use of demolitions is HIGHLY recommended.
	"]
];

createDialog "Intro_Dialog";