enableDynamicSimulationSystem false;

createCenter east;
createCenter sideLogic;

setViewDistance 3000;
setObjectViewDistance [3000,3000];

zeusGUIDs = [];
#include "\serverscripts\zeus\guids.sqf"
addMissionEventHandler ["PlayerDisconnected",
{
	params ["_id", "_uid", "_name", "_jip", "_owner", "_idstr"];
	
	_unit = _uid call BIS_fnc_getUnitByUID;
	_zeusModule = getAssignedCuratorLogic _unit;
	_zeusGroup = group _zeusModule;
	unassignCurator _zeusModule;
	deleteVehicle _zeusModule;
	deleteGroup _zeusGroup;	
}];

["Initialize", [true]] call BIS_fnc_dynamicGroups;

forceLevel = 0;

[] call compile preprocessFileLineNumbers "mapSpecificSetup.sqf";

[] call compile preprocessFileLineNumbers "MissionScripts\collectSectors.sqf";
[] call compile preprocessFileLineNumbers "MissionScripts\collectBlufor.sqf";
[] call compile preprocessFileLineNumbers "MissionScripts\collectRedfor.sqf";

[] execVM "MissionScripts\cleanup.sqf";
[] execVM "MissionScripts\fogKiller.sqf";
[] execVM "MissionScripts\spottingAugment.sqf";

[] execVM "MissionScripts\missionLoop.sqf";

[] execVM "MissionScripts\linkPlayersToZeus.sqf";