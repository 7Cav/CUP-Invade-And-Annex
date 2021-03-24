enableDynamicSimulationSystem false;

createCenter east;

setViewDistance 6000;
setObjectViewDistance [6000,6000];

setDate [2020, 6, 26, floor(random 24), 00];

redforSkill = 0.7;

redfor_infantry_SpottingAugmentDistance = 700;
redfor_commando_SpottingAugmentDistance = 700;
redfor_sniper_SpottingAugmentDistance = 1000;

redfor_vehicle_level_1_SpottingAugmentDistance = 700;
redfor_vehicle_level_2_SpottingAugmentDistance = 1000;
redfor_vehicle_level_3_SpottingAugmentDistance = 1500;
redfor_vehicle_level_4_SpottingAugmentDistance = 2000;
redfor_vehicle_level_5_SpottingAugmentDistance = 2500;

redfor_vehicle_aa_SpottingAugmentDistance = 1000;
redfor_vehicle_av_SpottingAugmentDistance = 700;

redfor_compound_radius = 25;

redfor_vehicleLevelScaling = true;

VehicleExchangeRequested = false;
VehicleExchangeData = [];

_collectSectorsHandle = [] execVM "MissionScripts\collectSectors.sqf";
waitUntil {scriptDone _collectSectorsHandle};
_collectBluforHandle = [] execVM "MissionScripts\collectBlufor.sqf";
waitUntil {scriptDone _collectBluforHandle};
_collectRedforHandle = [] execVM "MissionScripts\collectRedfor.sqf";
waitUntil {scriptDone _collectRedforHandle};

[] execVM "MissionScripts\cleanup.sqf";
[] execVM "MissionScripts\cleanupACE.sqf";
[] execVM "MissionScripts\fogKiller.sqf";
[] execVM "MissionScripts\spottingAugment.sqf";

[] execVM "MissionScripts\missionLoop.sqf";

[] execVM "MissionScripts\retrieveZeusGUIDs.sqf";

[] execVM "MissionScripts\linkPlayersToZeus.sqf";

[] execVM "MissionScripts\bluforVehicleExchangeServer.sqf";