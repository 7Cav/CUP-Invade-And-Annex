enableDynamicSimulationSystem false;

createCenter east;
createCenter sideLogic;

setViewDistance 14000;
setObjectViewDistance [14000,14000];

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

/*
true/false for attendance tracking active/inactive
[
	[
		Player ID, ... , Player ID
	]
	,[
		[Player Name, Time Played], ..., [Player Name, Time Played]
	]
]
*/
AttendanceTrackingData = profileNamespace getVariable ["SavedAttendanceTrackingData", nil];
if (isNil "AttendanceTrackingData") then
{
	AttendanceTrackingData = [false,[[],[]]];
};
AttendanceTrackingActive = AttendanceTrackingData select 0;

ActivateNewTracking = false;
DeactivateCurrentTracking = false;

setDate [2020, 12, 9, floor(random 24), 00];

redforSkill = 0.7;

redfor_infantry_SpottingAugmentDistance = 700;
redfor_commando_SpottingAugmentDistance = 700;
redfor_sniper_SpottingAugmentDistance = 1000;

redfor_vehicle_level_1_SpottingAugmentDistance = 700;
redfor_vehicle_level_2_SpottingAugmentDistance = 1000;
redfor_vehicle_level_3_SpottingAugmentDistance = 1500;
redfor_vehicle_level_4_SpottingAugmentDistance = 2000;
redfor_vehicle_level_5_SpottingAugmentDistance = 2500;

redfor_vehicle_aa_SpottingAugmentDistance = 14000;
redfor_vehicle_av_SpottingAugmentDistance = 3000;

redfor_compound_radius = 25;

redfor_vehicleLevelScaling = true;

VehicleExchangeRequested = false;
VehicleExchangeData = [];

[] call compile preprocessFileLineNumbers "MissionScripts\collectSectors.sqf";
[] call compile preprocessFileLineNumbers "MissionScripts\collectBlufor.sqf";
[] call compile preprocessFileLineNumbers "MissionScripts\collectRedfor.sqf";

[] execVM "MissionScripts\cleanup.sqf";
[] execVM "MissionScripts\cleanupACE.sqf";
[] execVM "MissionScripts\fogKiller.sqf";
[] execVM "MissionScripts\spottingAugment.sqf";

[] execVM "MissionScripts\missionLoop.sqf";

[] execVM "MissionScripts\linkPlayersToZeus.sqf";

[] execVM "MissionScripts\bluforVehicleExchangeServer.sqf";

[] execVM "MissionScripts\attendanceTracker.sqf";