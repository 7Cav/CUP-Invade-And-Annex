params["_sector"
	, "_sectorRoadsList"
	, "_objectiveGenericAreas"
	, "_aaSpecificPositions"
	, "_avSpecificPositions"
	, "_mortarSpecificPositions"
	, "_supplySpecificPositions"
	, "_hqSpecificPositions"
	, "_commsSpecificPositions"
	, "_commandosSpecificPositions"
	, "_snipersSpecificPositions"];

_sector setMarkerAlpha 0.5;
_sector + "_text" setMarkerAlpha 1;

"objectiveTracker_main" setMarkerAlpha 0;
"objectiveTracker_side_aa" setMarkerAlpha 0;
"objectiveTracker_side_av" setMarkerAlpha 0;
"objectiveTracker_side_mortars" setMarkerAlpha 0;
"objectiveTracker_side_supply" setMarkerAlpha 0;
"objectiveTracker_side_hq" setMarkerAlpha 0;
"objectiveTracker_side_comms" setMarkerAlpha 0;
"objectiveTracker_side_officer" setMarkerAlpha 0;
"objectiveTracker_side_commandos" setMarkerAlpha 0;
"objectiveTracker_side_snipers" setMarkerAlpha 0;

fnc_deploy_infantry = {
	params ["_sector","_squadLoadouts","_infantryList","_deploymentTypes"];
	
	_grp = createGroup [east,true];		
			
	_deploymentType = selectRandom _deploymentTypes;	
	
	if (_deploymentType == "garrison") then
	{
		if (count garrisonableBuildings > 0) then
		{
			_randIndex = floor(random(count garrisonableBuildings));
			_garrisonBuilding = garrisonableBuildings select _randIndex;
			_garrisonBuildingPositions = garrisonPositions select _randIndex;
			_garrisonBuildingLocation = getPos _garrisonBuilding;
			
			{
				_randPos = floor(random(count _garrisonBuildingPositions));
				_garrisonPosition = _garrisonBuildingPositions select _randPos;
				_garrisonBuildingPositions deleteAt _randPos;
				
				_class = _x select 0;
				_loadout = _x select 1;
				
				_unit = _grp createUnit [_class,[0,0,0],[],0,"NONE"];						
				_unit setPosATL _garrisonPosition;			
				_unit setUnitLoadout _loadout;		
				[_unit] execVM "MissionScripts\aiSkill.sqf";				
				_unit disableAI "PATH";	
				_unit setUnitPos "UP";					
				_infantryList pushBack _unit;
				{
					_x addCuratorEditableObjects [[_unit],true];
				} forEach allCurators;
			} forEach _squadLoadouts;
			
			_grp setFormDir ((getMarkerPos _sector) getDir _garrisonBuildingLocation);
			
			if (count _garrisonBuildingPositions < count redfor_squad_deploymentData) then
			{
				garrisonPositions deleteAt _randIndex;
				garrisonableBuildings deleteAt _randIndex;
			};
		}
		else
		{
			_deploymentType = "open";
		};
	};	
	
	if (_deploymentType == "open") then
	{		
		_randPos = [getMarkerPos _sector, 0,((markerSize _sector) select 0) / 2, 2, 0, 0.30] call BIS_fnc_findSafePos;
		{
			_class = _x select 0;
			_loadout = _x select 1;
			
			_unit = _grp createUnit [_class,[0,0,0],[],0,"NONE"];
			_randDir = floor(random 360);
			_unit setPosATL (_randPos getPos [2, _randDir]);
			_unit setUnitLoadout _loadout;		
			[_unit] execVM "MissionScripts\aiSkill.sqf";
			_infantryList pushBack _unit;
			{
				_x addCuratorEditableObjects [[_unit],true];
			} forEach allCurators;
		}
		forEach _squadLoadouts;
		
		_grp setFormDir ((getMarkerPos _sector) getDir _randPos);
		_grp setBehaviour "COMBAT";
	};
};

fnc_deploy_officerAndRetinue = {
	params ["_sector","_squadLoadouts","_officerLoadout","_officerList"];
	
	_grp = createGroup [east,true];
	
	if (count garrisonableBuildings > 0) then
	{
		_randIndex = floor(random(count garrisonableBuildings));
		_garrisonBuilding = garrisonableBuildings select _randIndex;
		_garrisonBuildingPositions = garrisonPositions select _randIndex;
		_garrisonBuildingLocation = getPos _garrisonBuilding;
		
		{
			_randPos = floor(random(count _garrisonBuildingPositions));
			_garrisonPosition = _garrisonBuildingPositions select _randPos;
			_garrisonBuildingPositions deleteAt _randPos;
			
			_class = _x select 0;
			_loadout = _x select 1;
			
			_unit = _grp createUnit [_class,[0,0,0],[],0,"NONE"];						
			_unit setPosATL _garrisonPosition;			
			_unit setUnitLoadout _loadout;		
			[_unit] execVM "MissionScripts\aiSkill.sqf";				
			_unit disableAI "PATH";	
			_unit setUnitPos "UP";
			{
				_x addCuratorEditableObjects [[_unit],true];
			} forEach allCurators;
		} forEach (_squadLoadouts select [0, count _squadLoadouts-1]);
		
		_randPos = floor(random(count _garrisonBuildingPositions));
		_garrisonPosition = _garrisonBuildingPositions select _randPos;
		_garrisonBuildingPositions deleteAt _randPos;
		
		_class = _officerLoadout select 0;
		_loadout = _officerLoadout select 1;
		
		_unit = _grp createUnit [_class,[0,0,0],[],0,"NONE"];						
		_unit setPosATL _garrisonPosition;			
		_unit setUnitLoadout _loadout;		
		[_unit] execVM "MissionScripts\aiSkill.sqf";				
		_unit disableAI "PATH";	
		_unit setUnitPos "UP";					
		_officerList pushBack _unit;
		{
			_x addCuratorEditableObjects [[_unit],true];
		} forEach allCurators;
		
		_grp setFormDir ((getMarkerPos _sector) getDir _garrisonBuildingLocation);
		
		if (count _garrisonBuildingPositions < count redfor_squad_deploymentData) then
		{
			garrisonPositions deleteAt _randIndex;
			garrisonableBuildings deleteAt _randIndex;
		};
	}
	else
	{		
		_randPos = [getMarkerPos _sector, 0,((markerSize _sector) select 0) / 2, 2, 0, 0.30] call BIS_fnc_findSafePos;
		{
			_class = _x select 0;
			_loadout = _x select 1;
			
			_unit = _grp createUnit [_class,[0,0,0],[],0,"NONE"];
			_randDir = floor(random 360);
			_unit setPosATL (_randPos getPos [2, _randDir]);
			_unit setUnitLoadout _loadout;		
			[_unit] execVM "MissionScripts\aiSkill.sqf";			
			{
				_x addCuratorEditableObjects [[_unit],true];
			} forEach allCurators;
		}
		forEach _squadLoadouts;
		
		_class = _officerLoadout select 0;
		_loadout = _officerLoadout select 1;
		
		_unit = _grp createUnit [_class,[0,0,0],[],0,"NONE"];	
		_randDir = floor(random 360);
		_unit setPosATL (_randPos getPos [2, _randDir]);	
		_unit setUnitLoadout _loadout;		
		[_unit] execVM "MissionScripts\aiSkill.sqf";					
		_officerList pushBack _unit;
		{
			_x addCuratorEditableObjects [[_unit],true];
		} forEach allCurators;
		
		_grp setFormDir ((getMarkerPos _sector) getDir _randPos);
		_grp setBehaviour "COMBAT";
	};	
};

fnc_deploy_vehicle = {
	params["_placementAreaPosition", "_placementAreaRadius", "_roadsList", "_crewmanData","_vehicleData","_vehicleList"];
	
	_possiblePositions = [];
		
	_randSafePos = [_placementAreaPosition, 0,_placementAreaRadius, 10, 0, 0.15] call BIS_fnc_findSafePos;
	if (((_randSafePos select 0) != (worldSize/2)) and ((_randSafePos select 1) != (worldSize/2))) then
	{
		_possiblePositions pushBack _randSafePos;
	};
	
	_roadIndex = -1;	
	if (count _roadsList > 0) then
	{
		_roadIndex = floor(random(count _roadsList));
		_roadSegment = _roadsList select _roadIndex;
		
		_possiblePositions pushBack (getPos _roadSegment);
	};
			
	if (count _possiblePositions > 0) then
	{
		_pos = selectRandom _possiblePositions;
		
		if (_roadIndex != -1) then
		{
			if (_pos isEqualTo (getPos (_roadsList select _roadIndex))) then
			{
				_roadsList deleteAt _roadIndex;
			};
		};
	
		_vehClass = _vehicleData select 0;	
		_vehAppearance = _vehicleData select 1;
		_vehPylons = _vehicleData select 2;
		_vehPylonPaths = _vehicleData select 3;
		_vehTurretMagazines = _vehicleData select 4;
		
		_veh = createVehicle [_vehClass, [0,0,2000], [], 0, "NONE"];
		_veh setPosATL [_pos select 0, _pos select 1, 0.5];
		{
			_x addCuratorEditableObjects [[_veh],true];
		} forEach allCurators;
		
		_veh spawn compile _vehAppearance;
		
		{ 
			_veh removeWeaponGlobal getText (configFile >> "CfgMagazines" >> _x >> "pylonWeapon");
		} 
		forEach getPylonMagazines _veh;
		{
			_veh setPylonLoadOut [_forEachIndex + 1, _x, true, _vehPylonPaths select _forEachIndex];
		} forEach _vehPylons;
			
		_veh setDir (_placementAreaPosition getDir _pos);
		
		_veh lock 3;
		
		_grp = createGroup [east,true];	
		
		_crewmanClass = _crewmanData select 0;
		_crewmanLoadout = _crewmanData select 1;	
		
		if ((_veh emptyPositions "Commander") > 0) then
		{
			_unit = _grp createUnit [_crewmanClass,_pos,[],0,"NONE"];
			_unit setUnitLoadout _crewmanLoadout;
			[_unit] execVM "MissionScripts\aiSkill.sqf";
			{
				_x addCuratorEditableObjects [[_unit],true];
			} forEach allCurators;
			
			_unit moveInCommander _veh;
		};
		
		if ((_veh emptyPositions "Gunner") > 0) then
		{		
			_unit = _grp createUnit [_crewmanClass,_pos,[],0,"NONE"];
			_unit setUnitLoadout _crewmanLoadout;
			[_unit] execVM "MissionScripts\aiSkill.sqf";
			{
				_x addCuratorEditableObjects [[_unit],true];
			} forEach allCurators;
			
			_unit moveInGunner _veh;
		};
		
		if ((_veh emptyPositions "Driver") > 0) then
		{
			_unit = _grp createUnit [_crewmanClass,_pos,[],0,"NONE"];
			_unit setUnitLoadout _crewmanLoadout;
			[_unit] execVM "MissionScripts\aiSkill.sqf";
			{
				_x addCuratorEditableObjects [[_unit],true];
			} forEach allCurators;
			
			_unit moveInDriver _veh;
		};
		
		_veh allowCrewInImmobile true;
		_veh setUnloadInCombat [false, false];
		
		_grp addVehicle _veh;	
			
		[_veh] execVM "MissionScripts\redforReplenish.sqf";	
		
		_veh addEventHandler ["Killed",
			{
				{
					_x setDamage 1;
				} forEach crew (_this select 0);
			}
		];
				
		_grp setBehaviour "COMBAT";
		_grp setCombatMode "YELLOW";
		
		_vehicleList pushBack _veh;
	};	
};

fnc_deploy_vehicle_fixedPosition = {
	params["_position", "_direction","_crewmanData","_vehicleData","_vehicleList"];	
			
	_vehClass = _vehicleData select 0;	
	_vehAppearance = _vehicleData select 1;
	_vehPylons = _vehicleData select 2;
	_vehPylonPaths = _vehicleData select 3;
	_vehTurretMagazines = _vehicleData select 4;
	
	_veh = createVehicle [_vehClass, [0,0,2000], [], 0, "NONE"];
	_veh setPosATL [_position select 0, _position select 1, 0.1];
	{
		_x addCuratorEditableObjects [[_veh],true];
	} forEach allCurators;
	
	_veh spawn compile _vehAppearance;
	
	{ 
		_veh removeWeaponGlobal getText (configFile >> "CfgMagazines" >> _x >> "pylonWeapon");
	} 
	forEach getPylonMagazines _veh;
	{
		_veh setPylonLoadOut [_forEachIndex + 1, _x, true, _vehPylonPaths select _forEachIndex];
	} forEach _vehPylons;
		
	_veh setDir _direction;
	
	_veh lock 3;
	
	_grp = createGroup [east,true];	
	
	_crewmanClass = _crewmanData select 0;
	_crewmanLoadout = _crewmanData select 1;	
	
	if ((_veh emptyPositions "Gunner") > 0) then
	{		
		_unit = _grp createUnit [_crewmanClass,_position,[],0,"NONE"];
		_unit setUnitLoadout _crewmanLoadout;
		[_unit] execVM "MissionScripts\aiSkill.sqf";
		{
			_x addCuratorEditableObjects [[_unit],true];
		} forEach allCurators;
		
		_unit moveInGunner _veh;
	};	
	
	_veh allowCrewInImmobile true;
	_veh setUnloadInCombat [false, false];
	
	_grp addVehicle _veh;	
		
	[_veh] execVM "MissionScripts\redforReplenish.sqf";	
	
	_veh addEventHandler ["Killed",
		{
			{
				_x setDamage 1;
			} forEach crew (_this select 0);
		}
	];
	
	if (_vehClass == redfor_mortar_deploymentData select 0) then
	{
		_grp setBehaviour "CARELESS";
	}
	else
	{
		_grp setBehaviour "COMBAT";
	};	

	_vehicleList pushBack _veh;	
};

fnc_deploy_compound = {
	params["_position","_radius","_wallData"];	
				
	_class = _wallData select 0;
	_sizeStep = _wallData select 1;	
	
	_xStart = (_position select 0) - _radius;
	_xEnd = (_position select 0) + _radius;
	
	_yStart = (_position select 1) - _radius; 
	_yEnd = (_position select 1) + _radius;	
	
	for "_i" from _xStart to _xEnd step _sizeStep do
	{
		if ((_i < floor((_xStart + _xEnd)/2) - 2 * _sizeStep) 
			or (_i > floor((_xStart + _xEnd)/2) + 2 * _sizeStep)) then		
		{
			_wall = createVehicle [_class, [0,0,2000], [], 0, "NONE"];
			_wall setPosATL [_i, _yStart, 0];
			_wall setDir 0;
			
			_wall = createVehicle [_class, [0,0,2000], [], 0, "NONE"];
			_wall setPosATL [_i, _yEnd, 0];			
			_wall setDir 0;
		};
	};
	
	for "_j" from _yStart to _yEnd step _sizeStep do
	{
		if ((_j < floor((_yStart + _yEnd)/2) - 2 * _sizeStep) 
			or (_j > floor((_yStart + _yEnd)/2) + 2 * _sizeStep)) then		
		{
			_wall = createVehicle [_class, [0,0,2000], [], 0, "NONE"];
			_wall setPosATL [_xStart, _j, 0];
			_wall setDir 90;
			
			_wall = createVehicle [_class, [0,0,2000], [], 0, "NONE"];
			_wall setPosATL [_xEnd, _j, 0];
			_wall setDir 90;
		};		
	};
};

_redforInfantry = [];
_redforVehicles = [];
_redforAA = [];
_redforAV = [];
_redforMortars = [];
_redforSupplyDepot = [];
_redforHQTents = [];
_redforCommTowers = [];
_redforOfficer = [];
_redforCommandos = [];
_redforSnipers = [];

_frontlineForcesDefeatedMessage = false;
_aaDefeatedMessage = false;
_avDefeatedMessage = false;
_mortarsDefeatedMessage = false;
_supplyDepotDefeatedMessage = false;
_hqDefeatedMessage = false;
_commTowersDefeatedMessage = false;
_officerDefeatedMessage = false;
_commandosDefeatedMessage = false;
_snipersDefeatedMessage = false;

_frontlineForcesDefeated = false;							
_aaDefeated = false;
_avDefeated = false;
_mortarsDefeated = false;
_supplyDepotDefeated = false;
_hqDefeated = false;
_commTowersDefeated = false;
_officerDefeated = false;
_commandosDefeated = false;
_snipersDefeated = false;

_frontLineActive = true;
_aaActive = false;
_avActive = false;
_mortarsActive = false;
_supplyActive = false;
_hqActive = false;
_commTowersActive = false;
_officerActive = false;
_commandosActive = false;
_snipersActive = false;

_playerCount = count allPlayers;
_redforSquadCount = ceil(2 * _playerCount / (count redfor_squad_deploymentData));
_redforVehicleCount = ceil(_playerCount / (count redfor_squad_deploymentData));
_redforVehicleLevels = [redfor_vehicle_level_1_deploymentData];
	
_priorityObjectiveList = [];
_genericObjectiveList = ["mortars", "supply", "hq", "comms", "officer", "commandos", "snipers"];
_playerCountForObjective = (_playerCount) min 90;
_activeObjectiveCount = floor(random(ceil(_playerCountForObjective / 10))) + 1;

_redforDeployedVehicleLevels = [redfor_vehicle_level_1_deploymentData];

if (redfor_vehicleLevelScaling) then
{
	_maximumPlayerCountLevel = (floor(_playerCount / 20)+1) min 5;
	_maximumBluforVehicleLevel = 0;
	
	{
		_vehicle = _x select 0;
		_class = typeOf _vehicle;
		
		if ({alive _x} count (crew _vehicle) > 0) then
		{
			if ((_class in blufor_vehicle_level_1_classes)
				or (_class in blufor_vehicle_level_2_classes)
				or (_class in blufor_vehicle_level_3_classes)
				or (_class in blufor_vehicle_level_4_classes)
				or (_class in blufor_vehicle_level_5_classes)) then
			{
				_priorityObjectiveList pushBack "av";
			}
			else
			{
				_genericObjectiveList pushBack "av";
			};
			
			if ((_class in blufor_vehicle_attackRotaryWing_classes)
				or (_class in blufor_vehicle_attackFixedWing_classes)) then
			{
				_priorityObjectiveList pushBack "aa";
			}
			else
			{
				_genericObjectiveList pushBack "aa";
			};
			
			_bluforVehicleLevels = [
				[blufor_vehicle_level_1_classes, 1]
				, [blufor_vehicle_level_2_classes, 2]
				, [blufor_vehicle_level_3_classes, 3]
				, [blufor_vehicle_level_4_classes, 4]
				, [blufor_vehicle_level_5_classes, 5]
			];
			
			{
				_levelClasses = _x select 0;
				_level = _x select 1;
				
				if (_class in _levelClasses) then
				{
					if (_maximumBluforVehicleLevel < _level) then
					{
						_maximumBluforVehicleLevel = _level;
					};
				};
			} forEach _bluforVehicleLevels;
		};
	} forEach blufor_vehicle_deploymentData;
	
	_maximumRedforVehicleLevel = _maximumBluforVehicleLevel max _maximumPlayerCountLevel;

	_redforVehicleLevels = [		
		[redfor_vehicle_level_2_deploymentData, 2]
		, [redfor_vehicle_level_3_deploymentData, 3]
		, [redfor_vehicle_level_4_deploymentData, 4]
		, [redfor_vehicle_level_5_deploymentData, 5]
	];

	{
		if ((count (_x select 0) > 0) and (_maximumRedforVehicleLevel >= (_x select 1))) then
		{
			_redforDeployedVehicleLevels pushBack (_x select 0);
		};
	} forEach _redforVehicleLevels;
}
else
{
	_redforVehicleLevels = [		
		redfor_vehicle_level_2_deploymentData
		, redfor_vehicle_level_3_deploymentData
		, redfor_vehicle_level_4_deploymentData
		, redfor_vehicle_level_5_deploymentData
	];

	{
		if (count _x > 0) then
		{
			_redforDeployedVehicleLevels pushBack _x;
		};
	} forEach _redforVehicleLevels;
};

while {_activeObjectiveCount > 0} do
{
	if (count _priorityObjectiveList > 0) then
	{
		_randomIndex = floor(random (count _priorityObjectiveList));	
	
		switch(_priorityObjectiveList select _randomIndex) do
		{
			case "aa" : {_aaActive = true};
			case "av" : {_avActive = true};
			case "mortars" : {_mortarsActive = true};
			case "supply" : {_supplyActive = true};
			case "hq" : {_hqActive = true};
			case "comms" : {_commTowersActive = true};
			case "officer" : {_officerActive = true};
			case "commandos" : {_commandosActive = true};
			case "snipers" : {_snipersActive = true};
		};
		
		_priorityObjectiveList deleteAt _randomIndex;
		
		_activeObjectiveCount = _activeObjectiveCount - 1;
	}
	else
	{
		_randomIndex = floor(random (count _genericObjectiveList));	
	
		switch(_genericObjectiveList select _randomIndex) do
		{
			case "aa" : {_aaActive = true};
			case "av" : {_avActive = true};
			case "mortars" : {_mortarsActive = true};
			case "supply" : {_supplyActive = true};
			case "hq" : {_hqActive = true};
			case "comms" : {_commTowersActive = true};
			case "officer" : {_officerActive = true};
			case "commandos" : {_commandosActive = true};
			case "snipers" : {_snipersActive = true};
		};
		
		_genericObjectiveList deleteAt _randomIndex;
		
		_activeObjectiveCount = _activeObjectiveCount - 1;
	};	
};

_terrainObjecTypes = ["TREE", "SMALL TREE", "BUSH", "BUILDING", "HOUSE", "FOREST BORDER", "FOREST TRIANGLE", "FOREST SQUARE", "CHURCH", "CHAPEL", "CROSS", "BUNKER", "FORTRESS", "FOUNTAIN", "VIEW-TOWER", "LIGHTHOUSE", "QUAY", "FUELSTATION", "HOSPITAL", "FENCE", "WALL", "HIDE", "BUSSTOP", "ROAD", "FOREST", "TRANSMITTER", "STACK", "RUIN", "TOURISM", "WATERTOWER", "TRACK", "MAIN ROAD", "ROCK", "ROCKS", "POWER LINES", "RAILWAY", "POWERSOLAR", "POWERWAVE", "POWERWIND", "SHIPWRECK", "TRAIL"];

"objectiveTracker_main" setMarkerAlpha 1;
"objectiveTracker_main" setMarkerColor "ColorOPFOR";
"objectiveTracker_main" setMarkerText "DEFEAT FRONTLINE FORCES";

_sideObectiveCounter = 0;

if (_aaActive) then
{
	_deploymentTypes = [];
	
	if (count _aaSpecificPositions > 0) then
	{
		_deploymentTypes pushBack "specific";
	};
	
	if (count _objectiveGenericAreas > 0) then
	{
		_deploymentTypes pushBack "generic";
	};
	
	if (count _deploymentTypes > 0) then
	{
		_deploymentType = selectRandom _deploymentTypes;
	
		if (_deploymentType == "specific") then
		{		
			_randomPositionGroup = floor(random(count _aaSpecificPositions));
			_specificPositions = _aaSpecificPositions select _randomPositionGroup;
			
			for "_i" from 1 to 3 do
			{
				_randomIndex = floor(random (count _specificPositions));
				_aaPosition = _specificPositions select _randomIndex;
				_specificPositions deleteAt _randomIndex;
				
				_position = _aaPosition select 0;
				_direction = _aaPosition select 1;
				
				[[_position select 0, _position select 1]
					, _direction
					, redfor_crewman_deploymentData
					, redfor_vehicle_aa_deploymentData
					, _redforAA] call fnc_deploy_vehicle_fixedPosition;
			};		
		};
		
		if (_deploymentType == "generic") then
		{		
			_randomIndex = floor(random (count _objectiveGenericAreas));
			_aaArea = _objectiveGenericAreas select _randomIndex;
			_objectiveGenericAreas deleteAt _randomIndex;
						
			{_x hideObjectGlobal true} count nearestTerrainObjects [_aaArea, _terrainObjecTypes, redfor_compound_radius * 1.5, false, false];

			_aaPositions = [
				[[(_aaArea select 0), (_aaArea select 1) + 0.5 * redfor_compound_radius], 0]
				, [[(_aaArea select 0), (_aaArea select 1) - 0.5 * redfor_compound_radius], 180]
				, [[(_aaArea select 0) + 0.5 * redfor_compound_radius, (_aaArea select 1)], 90]
				, [[(_aaArea select 0) - 0.5 * redfor_compound_radius, (_aaArea select 1)], 270]
			];

			for "_i" from 1 to 3 do
			{
				_randomIndex = floor(random (count _aaPositions));
				_aaPosition = _aaPositions select _randomIndex;
				_aaPositions deleteAt _randomIndex;
				
				[_aaPosition select 0
					, _aaPosition select 1
					, redfor_crewman_deploymentData
					, redfor_vehicle_aa_deploymentData
					, _redforAA] call fnc_deploy_vehicle_fixedPosition;
			};		
		};		
	
		"objectiveTracker_side_aa" setMarkerAlpha 1;
		"objectiveTracker_side_aa" setMarkerColor "ColorOPFOR";
		"objectiveTracker_side_aa" setMarkerText "ELIMINATE ANTI-AIR SECTION";
	
	}
	else
	{
		_aaActive = false;
	};	
};

if (_avActive) then
{
	_deploymentTypes = [];
	
	if (count _avSpecificPositions > 0) then
	{
		_deploymentTypes pushBack "specific";
	};
	
	if (count _objectiveGenericAreas > 0) then
	{
		_deploymentTypes pushBack "generic";
	};
	
	if (count _deploymentTypes > 0) then
	{
		_deploymentType = selectRandom _deploymentTypes;
		
		if (_deploymentType == "specific") then
		{	
			_randomPositionGroup = floor(random(count _avSpecificPositions));
			_specificPositions = _avSpecificPositions select _randomPositionGroup;
			
			for "_i" from 1 to 3 do
			{
				_randomIndex = floor(random (count _specificPositions));
				_avPosition = _specificPositions select _randomIndex;
				_specificPositions deleteAt _randomIndex;
				
				_position = _avPosition select 0;
				_direction = _avPosition select 1;
				
				[[_position select 0, _position select 1]
					, _direction
					, redfor_crewman_deploymentData
					, redfor_vehicle_av_deploymentData
					, _redforAV] call fnc_deploy_vehicle_fixedPosition;
			};
		};
		
		if (_deploymentType == "generic") then
		{	
			_randomIndex = floor(random (count _objectiveGenericAreas));
			_avArea = _objectiveGenericAreas select _randomIndex;
			_objectiveGenericAreas deleteAt _randomIndex;
			
			{_x hideObjectGlobal true} count nearestTerrainObjects [_avArea, _terrainObjecTypes, redfor_compound_radius * 1.5, false, false];

			_avPositions = [
				[[(_avArea select 0), (_avArea select 1) + 0.5 * redfor_compound_radius], 0]
				, [[(_avArea select 0), (_avArea select 1) - 0.5 * redfor_compound_radius], 180]
				, [[(_avArea select 0) + 0.5 * redfor_compound_radius, (_avArea select 1)], 90]
				, [[(_avArea select 0) - 0.5 * redfor_compound_radius, (_avArea select 1)], 270]
			];

			for "_i" from 1 to 3 do
			{
				_randomIndex = floor(random (count _avPositions));
				_avPosition = _avPositions select _randomIndex;
				_avPositions deleteAt _randomIndex;
				
				[_avPosition select 0
					, _avPosition select 1
					, redfor_crewman_deploymentData
					, redfor_vehicle_av_deploymentData
					, _redforAV] call fnc_deploy_vehicle_fixedPosition;
			};
		};
		
		"objectiveTracker_side_av" setMarkerAlpha 1;
		"objectiveTracker_side_av" setMarkerColor "ColorOPFOR";
		"objectiveTracker_side_av" setMarkerText "ELIMINATE ANTI-VEHICLE SECTION";
	}
	else
	{
		_avActive = false;
	};	
};

if (_mortarsActive) then
{
	_deploymentTypes = [];
	
	if (count _mortarSpecificPositions > 0) then
	{
		_deploymentTypes pushBack "specific";
	};
	
	if (count _objectiveGenericAreas > 0) then
	{
		_deploymentTypes pushBack "generic";
	};
	
	if (count _deploymentTypes > 0) then
	{
		_deploymentType = selectRandom _deploymentTypes;
		
		if (_deploymentType == "specific") then
		{		
			_randomPositionGroup = floor(random(count _mortarSpecificPositions));
			_specificPositions = _mortarSpecificPositions select _randomPositionGroup;
			
			for "_i" from 1 to 3 do
			{
				_randomIndex = floor(random (count _specificPositions));
				_mortarPosition = _specificPositions select _randomIndex;
				_specificPositions deleteAt _randomIndex;
				
				_position = _mortarPosition select 0;
				_direction = _mortarPosition select 1;
				
				[[_position select 0, _position select 1]
					, _direction
					, redfor_crewman_deploymentData
					, redfor_mortar_deploymentData
					, _redforMortars] call fnc_deploy_vehicle_fixedPosition;
			};
		};
		
		if (_deploymentType == "generic") then
		{		
			_randomIndex = floor(random (count _objectiveGenericAreas));
			_mortarArea = _objectiveGenericAreas select _randomIndex;
			_objectiveGenericAreas deleteAt _randomIndex;
	
			{_x hideObjectGlobal true} count nearestTerrainObjects [_mortarArea, _terrainObjecTypes, redfor_compound_radius * 1.5, false, false];

			[_mortarArea, redfor_compound_radius, redfor_compoundWall_deploymentData] call fnc_deploy_compound;

			_mortarPositions = [
				[[(_mortarArea select 0), (_mortarArea select 1) + 0.5 * redfor_compound_radius], 0]
				, [[(_mortarArea select 0), (_mortarArea select 1) - 0.5 * redfor_compound_radius], 180]
				, [[(_mortarArea select 0) + 0.5 * redfor_compound_radius, (_mortarArea select 1)], 90]
				, [[(_mortarArea select 0) - 0.5 * redfor_compound_radius, (_mortarArea select 1)], 270]
			];

			for "_i" from 1 to 3 do
			{
				_randomIndex = floor(random (count _mortarPositions));
				_mortarPosition = _mortarPositions select _randomIndex;
				_mortarPositions deleteAt _randomIndex;

				[_mortarPosition select 0
					, _mortarPosition select 1
					, redfor_crewman_deploymentData
					, redfor_mortar_deploymentData
					, _redforMortars] call fnc_deploy_vehicle_fixedPosition;
			};
		};
		
		"objectiveTracker_side_mortars" setMarkerAlpha 1;
		"objectiveTracker_side_mortars" setMarkerColor "ColorOPFOR";
		"objectiveTracker_side_mortars" setMarkerText "ELIMINATE MORTAR SECTION";
	}
	else
	{
		_mortarsActive = false;
	};

	[_redforMortars] execVM "MissionScripts\redforMortars.sqf";
};

if (_supplyActive) then
{
	_deploymentTypes = [];
	
	if (count _supplySpecificPositions > 0) then
	{
		_deploymentTypes pushBack "specific";
	};
	
	if (count _objectiveGenericAreas > 0) then
	{
		_deploymentTypes pushBack "generic";
	};
	
	if (count _deploymentTypes > 0) then
	{
		_deploymentType = selectRandom _deploymentTypes;
	
		if (_deploymentType == "specific") then
		{		
			_randomPositionGroup = floor(random(count _supplySpecificPositions));
			_specificPositions = _supplySpecificPositions select _randomPositionGroup;
			
			for "_i" from 1 to 3 do
			{
				_randomIndex = floor(random (count _specificPositions));
				_supplyPosition = _specificPositions select _randomIndex;
				_specificPositions deleteAt _randomIndex;
				
				_position = _supplyPosition select 0;
				_direction = _supplyPosition select 1;
				
				[[_position select 0, _position select 1]
					, _direction
					, redfor_crewman_deploymentData
					, redfor_supplyVehicle_deploymentData
					, _redforSupplyDepot] call fnc_deploy_vehicle_fixedPosition;
			};
		};
		
		if (_deploymentType == "generic") then
		{		
			_randomIndex = floor(random (count _objectiveGenericAreas));
			_supplyDepotArea = _objectiveGenericAreas select _randomIndex;
			_objectiveGenericAreas deleteAt _randomIndex;
			
			{_x hideObjectGlobal true} count nearestTerrainObjects [_supplyDepotArea, _terrainObjecTypes, redfor_compound_radius * 1.5, false, false];

			[_supplyDepotArea, redfor_compound_radius, redfor_compoundWall_deploymentData] call fnc_deploy_compound;

			_supplyDepotPositions = [
				[[(_supplyDepotArea select 0), (_supplyDepotArea select 1) + 0.5 * redfor_compound_radius], 0]
				, [[(_supplyDepotArea select 0), (_supplyDepotArea select 1) - 0.5 * redfor_compound_radius], 180]
				, [[(_supplyDepotArea select 0) + 0.5 * redfor_compound_radius, (_supplyDepotArea select 1)], 90]
				, [[(_supplyDepotArea select 0) - 0.5 * redfor_compound_radius, (_supplyDepotArea select 1)], 270]
			];

			for "_i" from 1 to 3 do
			{
				_randomIndex = floor(random (count _supplyDepotPositions));
				_supplyDepotPosition = _supplyDepotPositions select _randomIndex;
				_supplyDepotPositions deleteAt _randomIndex;

				[_supplyDepotPosition select 0
					, _supplyDepotPosition select 1
					, redfor_crewman_deploymentData
					, redfor_supplyVehicle_deploymentData
					, _redforSupplyDepot] call fnc_deploy_vehicle_fixedPosition;
			};
		};
		
		"objectiveTracker_side_supply" setMarkerAlpha 1;
		"objectiveTracker_side_supply" setMarkerColor "ColorOPFOR";
		"objectiveTracker_side_supply" setMarkerText "DESTROY SUPPLY DEPOT";
	}
	else
	{
		_supplyActive = false;
	};
};

if (_hqActive) then
{

	_deploymentTypes = [];
	
	if (count _hqSpecificPositions > 0) then
	{
		_deploymentTypes pushBack "specific";
	};
	
	if (count _objectiveGenericAreas > 0) then
	{
		_deploymentTypes pushBack "generic";
	};
	
	if (count _deploymentTypes > 0) then
	{
		_deploymentType = selectRandom _deploymentTypes;
	
		if (_deploymentType == "specific") then
		{		
			_randomPositionGroup = floor(random(count _hqSpecificPositions));
			_specificPositions = _hqSpecificPositions select _randomPositionGroup;
			
			for "_i" from 1 to 3 do
			{
				_randomIndex = floor(random (count _specificPositions));
				_hqPosition = _specificPositions select _randomIndex;
				_specificPositions deleteAt _randomIndex;
				
				_position = _hqPosition select 0;
				_direction = _hqPosition select 1;
				
				[[_position select 0, _position select 1]
					, _direction
					, redfor_crewman_deploymentData
					, redfor_hqTent_deploymentData
					, _redforHQTents] call fnc_deploy_vehicle_fixedPosition;
			};
		};
		
		if (_deploymentType == "generic") then
		{		
			_randomIndex = floor(random (count _objectiveGenericAreas));
			_hqTentsArea = _objectiveGenericAreas select _randomIndex;
			_objectiveGenericAreas deleteAt _randomIndex;
			
			{_x hideObjectGlobal true} count nearestTerrainObjects [_hqTentsArea, _terrainObjecTypes, redfor_compound_radius * 1.5, false, false];

			[_hqTentsArea, redfor_compound_radius, redfor_compoundWall_deploymentData] call fnc_deploy_compound;

			_hqTentsPositions = [
				[[(_hqTentsArea select 0), (_hqTentsArea select 1) + 0.5 * redfor_compound_radius], 0]
				, [[(_hqTentsArea select 0), (_hqTentsArea select 1) - 0.5 * redfor_compound_radius], 180]
				, [[(_hqTentsArea select 0) + 0.5 * redfor_compound_radius, (_hqTentsArea select 1)], 90]
				, [[(_hqTentsArea select 0) - 0.5 * redfor_compound_radius, (_hqTentsArea select 1)], 270]
			];

			for "_i" from 1 to 3 do
			{
				_randomIndex = floor(random (count _hqTentsPositions));
				_hqTentPosition = _hqTentsPositions select _randomIndex;
				_hqTentsPositions deleteAt _randomIndex;

				[_hqTentPosition select 0
					, _hqTentPosition select 1
					, redfor_crewman_deploymentData
					, redfor_hqTent_deploymentData
					, _redforHQTents] call fnc_deploy_vehicle_fixedPosition;
			};
		};
		
		"objectiveTracker_side_hq" setMarkerAlpha 1;
		"objectiveTracker_side_hq" setMarkerColor "ColorOPFOR";
		"objectiveTracker_side_hq" setMarkerText "DESTROY HEADQUARTERS";
	}
	else
	{
		_hqActive = false;
	};	
};

if (_commTowersActive) then
{
	_deploymentTypes = [];
	
	if (count _commsSpecificPositions > 0) then
	{
		_deploymentTypes pushBack "specific";
	};
	
	if (count _objectiveGenericAreas > 0) then
	{
		_deploymentTypes pushBack "generic";
	};
	
	if (count _deploymentTypes > 0) then
	{
		_deploymentType = selectRandom _deploymentTypes;
		
		if (_deploymentType == "specific") then
		{		
			_randomPositionGroup = floor(random(count _commsSpecificPositions));
			_specificPositions = _commsSpecificPositions select _randomPositionGroup;
			
			for "_i" from 1 to 3 do
			{
				_randomIndex = floor(random (count _specificPositions));
				_commsPosition = _specificPositions select _randomIndex;
				_specificPositions deleteAt _randomIndex;
				
				_position = _commsPosition select 0;
				_direction = _commsPosition select 1;
				
				[[_position select 0, _position select 1]
					, _direction
					, redfor_crewman_deploymentData
					, redfor_commTower_deploymentData
					, _redforCommTowers] call fnc_deploy_vehicle_fixedPosition;
			};
		};
		
		if (_deploymentType == "generic") then
		{		
			_randomIndex = floor(random (count _objectiveGenericAreas));
			_commTowersArea = _objectiveGenericAreas select _randomIndex;
			_objectiveGenericAreas deleteAt _randomIndex;
			
			{_x hideObjectGlobal true} count nearestTerrainObjects [_commTowersArea, _terrainObjecTypes, redfor_compound_radius * 1.5, false, false];

			[_commTowersArea, redfor_compound_radius, redfor_compoundWall_deploymentData] call fnc_deploy_compound;

			_commTowersPositions = [
				[[(_commTowersArea select 0), (_commTowersArea select 1) + 0.5 * redfor_compound_radius], 0]
				, [[(_commTowersArea select 0), (_commTowersArea select 1) - 0.5 * redfor_compound_radius], 180]
				, [[(_commTowersArea select 0) + 0.5 * redfor_compound_radius, (_commTowersArea select 1)], 90]
				, [[(_commTowersArea select 0) - 0.5 * redfor_compound_radius, (_commTowersArea select 1)], 270]
			];

			for "_i" from 1 to 3 do
			{
				_randomIndex = floor(random (count _commTowersPositions));
				_commTowerPosition = _commTowersPositions select _randomIndex;
				_commTowersPositions deleteAt _randomIndex;

				[_commTowerPosition select 0
					, _commTowerPosition select 1
					, redfor_crewman_deploymentData
					, redfor_commTower_deploymentData
					, _redforCommTowers] call fnc_deploy_vehicle_fixedPosition;
			};
		};
		
		"objectiveTracker_side_comms" setMarkerAlpha 1;
		"objectiveTracker_side_comms" setMarkerColor "ColorOPFOR";
		"objectiveTracker_side_comms" setMarkerText "DESTROY COMM TOWERS";
	}
	else
	{		
		_commTowersActive = false;
	};
};

garrisonableBuildings = [];
garrisonPositions = [];
allBuildings = ((getMarkerPos _sector) nearObjects ["Building", (markerSize _sector) select 0]) select {(count ([_x] call BIS_fnc_buildingPositions) >= 1)};

{
	if (count ([_x] call BIS_fnc_buildingPositions) >= count redfor_squad_deploymentData) then
	{
		garrisonableBuildings pushback _x;
		garrisonPositions pushBack ([_x] call BIS_fnc_buildingPositions);
	};		
} forEach allBuildings;

if (_officerActive) then
{
	[_sector, redfor_squad_deploymentData, redfor_officer_deploymentData, _redforOfficer] call fnc_deploy_officerAndRetinue;
	
	"objectiveTracker_side_officer" setMarkerAlpha 1;
	"objectiveTracker_side_officer" setMarkerColor "ColorOPFOR";
	"objectiveTracker_side_officer" setMarkerText "NEUTRALIZE OFFICER";
};

if (_commandosActive) then
{
	_deploymentType = selectRandom ["generic", "specific"];
	
	if (_deploymentType == "specific") then
	{
		if (count _commandosSpecificPositions > 0) then
		{
			_randomPositionGroup = floor(random(count _commandosSpecificPositions));
			_specificPosition = _commandosSpecificPositions select _randomPositionGroup;
			
			_position = _specificPosition select 0;
			
			[[[_position select 0, _position select 1], 4], redfor_commando_deploymentData, _redforCommandos, ["open"]] call fnc_deploy_infantry;
			{		
				_x addEventHandler ["Killed", {
					 removeAllWeapons (_this select 0);
				}];
			} forEach _redforCommandos;
		}
		else
		{
			_deploymentType = "generic";
		};
	};
	
	if (_deploymentType == "generic") then
	{
		[_sector, redfor_commando_deploymentData, _redforCommandos, ["garrison","open"]] call fnc_deploy_infantry;	
		{		
			_x addEventHandler ["Killed", {
				 removeAllWeapons (_this select 0);
			}];
		} forEach _redforCommandos;
	};	
	
	"objectiveTracker_side_commandos" setMarkerAlpha 1;
	"objectiveTracker_side_commandos" setMarkerColor "ColorOPFOR";
	"objectiveTracker_side_commandos" setMarkerText "NEUTRALIZE COMMANDO TEAM";
};

if (_snipersActive) then
{
	_deploymentType = selectRandom ["generic", "specific"];
	
	if (_deploymentType == "specific") then
	{
		if (count _snipersSpecificPositions > 0) then
		{
			_randomPositionGroup = floor(random(count _snipersSpecificPositions));
			_specificPosition = _snipersSpecificPositions select _randomPositionGroup;
			
			_position = _specificPosition select 0;
			
			[[[_position select 0, _position select 1], 4], redfor_sniper_deploymentData, _redforSnipers, ["open"]] call fnc_deploy_infantry;
			{		
				_x addEventHandler ["Killed", {
					 removeAllWeapons (_this select 0);
				}];
			} forEach _redforSnipers;
		}
		else
		{
			_deploymentType = "generic";
		};
	};
	
	if (_deploymentType == "generic") then
	{
		[_sector, redfor_sniper_deploymentData, _redforSnipers, ["open"]] call fnc_deploy_infantry;	
		{		
			_x addEventHandler ["Killed", {
				 removeAllWeapons (_this select 0);
			}];
		} forEach _redforSnipers;
	};	
	
	"objectiveTracker_side_snipers" setMarkerAlpha 1;
	"objectiveTracker_side_snipers" setMarkerColor "ColorOPFOR";
	"objectiveTracker_side_snipers" setMarkerText "NEUTRALIZE SNIPER TEAM";
};

for "_i" from 1 to _redforVehicleCount do
{
	_vehicleDeploymentData = selectRandom _redforDeployedVehicleLevels;	
	[getMarkerPos _sector, ((markerSize _sector) select 0)/2, _sectorRoadsList, redfor_crewman_deploymentData, _vehicleDeploymentData, _redforVehicles] call fnc_deploy_vehicle;		
};

for "_i" from 1 to _redforSquadCount do
{
	_deploymentTypes = ["garrison","open"];
	[_sector, redfor_squad_deploymentData, _redforInfantry, _deploymentTypes] call fnc_deploy_infantry;	
};

while {true} do
{
	scopeName "engagementLoop";

	_frontlineForcesDefeated = (({alive _x} count _redforInfantry <= 0.15 * (count _redforInfantry))
							and ({alive gunner _x} count _redforVehicles <= 0.15 * (count _redforVehicles)));	
	if (_aaActive) then
	{
		_aaDefeated = ({alive _x} count _redforAA == 0);	
	}
	else
	{
		_aaDefeated = true;	
		_aaDefeatedMessage = true;
	};	
	
	if (_avActive) then
	{
		_avDefeated = ({alive _x} count _redforAV == 0);	
	}
	else
	{
		_avDefeated = true;	
		_avDefeatedMessage = true;
	};	
	
	if (_mortarsActive) then
	{
		_mortarsDefeated = ({alive _x} count _redforMortars == 0);		
	}
	else
	{
		_mortarsDefeated = true;	
		_mortarsDefeatedMessage = true;
	};	
	
	if (_supplyActive) then
	{
		_supplyDepotDefeated = ({alive _x} count _redforSupplyDepot == 0);	
	}
	else
	{
		_supplyDepotDefeated = true;	
		_supplyDepotDefeatedMessage = true;
	};	
	
	if (_hqActive) then
	{
		_hqDefeated = ({alive _x} count _redforHQTents == 0);	
	}
	else
	{
		_hqDefeated = true;	
		_hqDefeatedMessage = true;
	};	
	
	if (_commTowersActive) then
	{
		_commTowersDefeated = ({alive _x} count _redforCommTowers == 0);	
	}
	else
	{
		_commTowersDefeated = true;	
		_commTowersDefeatedMessage = true;
	};	
	
	if (_officerActive) then
	{
		_officerDefeated = ({alive _x} count _redforOfficer == 0);	
	}
	else
	{
		_officerDefeated = true;	
		_officerDefeatedMessage = true;
	};	
	
	if (_commandosActive) then
	{
		_commandosDefeated = ({alive _x} count _redforCommandos == 0);
	}
	else
	{
		_commandosDefeated = true;	
		_commandosDefeatedMessage = true;
	};	
	
	if (_snipersActive) then
	{
		_snipersDefeated = ({alive _x} count _redforSnipers == 0);
	}
	else
	{
		_snipersDefeated = true;	
		_snipersDefeatedMessage = true;
	};	
	
	if (_frontlineForcesDefeated and !_frontlineForcesDefeatedMessage) then
	{
		["TaskUpdated",["","FRONTLINE FORCES DEFEATED"]] remoteExec ["BIS_fnc_showNotification",0];
		_frontlineForcesDefeatedMessage = true;
		"objectiveTracker_main" setMarkerColor "ColorBLUFOR";
		"objectiveTracker_main" setMarkerText "FRONTLINE FORCES DEFEATED";
		sleep 2;
	};	
	
	if (_aaDefeated and !_aaDefeatedMessage) then
	{
		["TaskUpdated",["","ANTI-AIR SECTION ELIMINATED"]] remoteExec ["BIS_fnc_showNotification",0];
		_aaDefeatedMessage = true;
		"objectiveTracker_side_aa" setMarkerColor "ColorBLUFOR";
		"objectiveTracker_side_aa" setMarkerText "ANTI-AIR SECTION ELIMINATED";
		sleep 2;
	};	
	
	if (_avDefeated and !_avDefeatedMessage) then
	{
		["TaskUpdated",["","ANTI-VEHICLE SECTION ELIMINATED"]] remoteExec ["BIS_fnc_showNotification",0];
		_avDefeatedMessage = true;
		"objectiveTracker_side_av" setMarkerColor "ColorBLUFOR";
		"objectiveTracker_side_av" setMarkerText "ANTI-VEHICLE SECTION ELIMINATED";
		sleep 2;
	};	
	
	if (_mortarsDefeated and !_mortarsDefeatedMessage) then
	{
		["TaskUpdated",["","MORTAR SECTION ELIMINATED"]] remoteExec ["BIS_fnc_showNotification",0];
		_mortarsDefeatedMessage = true;
		"objectiveTracker_side_mortars" setMarkerColor "ColorBLUFOR";
		"objectiveTracker_side_mortars" setMarkerText "MORTAR SECTION ELIMINATED";
		sleep 2;
	};	
	
	if (_supplyDepotDefeated and !_supplyDepotDefeatedMessage) then
	{
		["TaskUpdated",["","SUPPLY DEPOT DESTROYED"]] remoteExec ["BIS_fnc_showNotification",0];
		_supplyDepotDefeatedMessage = true;
		"objectiveTracker_side_supply" setMarkerColor "ColorBLUFOR";
		"objectiveTracker_side_supply" setMarkerText "SUPPLY DEPOT DESTROYED";
		sleep 2;
	};	
	
	if (_hqDefeated and !_hqDefeatedMessage) then
	{
		["TaskUpdated",["","HEADQUARTERS DESTROYED"]] remoteExec ["BIS_fnc_showNotification",0];
		_hqDefeatedMessage = true;
		"objectiveTracker_side_hq" setMarkerColor "ColorBLUFOR";
		"objectiveTracker_side_hq" setMarkerText "HEADQUARTERS DESTROYED";
		sleep 2;
	};	
	
	if (_commTowersDefeated and !_commTowersDefeatedMessage) then
	{
		["TaskUpdated",["","COMM TOWERS DESTROYED"]] remoteExec ["BIS_fnc_showNotification",0];
		_commTowersDefeatedMessage = true;
		"objectiveTracker_side_comms" setMarkerColor "ColorBLUFOR";
		"objectiveTracker_side_comms" setMarkerText "COMM TOWERS DESTROYED";
		sleep 2;
	};
	
	if (_officerDefeated and !_officerDefeatedMessage) then
	{
		["TaskUpdated",["","OFFICER NEUTRALIZED"]] remoteExec ["BIS_fnc_showNotification",0];
		_officerDefeatedMessage = true;
		"objectiveTracker_side_officer" setMarkerColor "ColorBLUFOR";
		"objectiveTracker_side_officer" setMarkerText "OFFICER NEUTRALIZED";
		sleep 2;
	};
	
	if (_commandosDefeated and !_commandosDefeatedMessage) then
	{
		["TaskUpdated",["","COMMANDO TEAM NEUTRALIZED"]] remoteExec ["BIS_fnc_showNotification",0];
		_commandosDefeatedMessage = true;
		"objectiveTracker_side_commandos" setMarkerColor "ColorBLUFOR";
		"objectiveTracker_side_commandos" setMarkerText "COMMANDO TEAM NEUTRALIZED";
		sleep 2;
	};
	
	if (_snipersDefeated and !_snipersDefeatedMessage) then
	{
		["TaskUpdated",["","SNIPER TEAM NEUTRALIZED"]] remoteExec ["BIS_fnc_showNotification",0];
		_snipersDefeatedMessage = true;
		"objectiveTracker_side_snipers" setMarkerColor "ColorBLUFOR";
		"objectiveTracker_side_snipers" setMarkerText "SNIPER TEAM NEUTRALIZED";
		sleep 2;
	};
	
	if (_frontlineForcesDefeated 
			and _aaDefeated
			and _avDefeated
			and _mortarsDefeated
			and _supplyDepotDefeated
			and _hqDefeated
			and _commTowersDefeated
			and _officerDefeated
			and _commandosDefeated
			and _snipersDefeated) then
	{
		breakOut "engagementLoop";
	};	
	
	sleep 5;
};

{
	_x setDamage 1;
} forEach _redforInfantry;

{
	_x setDamage 1;
} forEach _redforVehicles;

_sector setMarkerAlpha 0;
_sector + "_text" setMarkerAlpha 0;

_sectorInder = sectorList find _sector;

sectorList deleteAt _sectorInder;

sectorRoadsList deleteAt _sectorInder;

sectorObjectiveGenericAreaList deleteAt _sectorInder;

sectorSpecificAAPositionsList deleteAt _sectorInder;
sectorSpecificAVPositionsList deleteAt _sectorInder;
sectorSpecificMortarPositionsList deleteAt _sectorInder;
sectorSpecificSupplyPositionsList deleteAt _sectorInder;
sectorSpecificHQPositionsList deleteAt _sectorInder;
sectorSpecificCommsPositionsList deleteAt _sectorInder;
sectorSpecificCommandosPositionsList deleteAt _sectorInder;
sectorSpecificSnipersPositionsList deleteAt _sectorInder;

"objectiveTracker_main" setMarkerAlpha 0;
"objectiveTracker_side_aa" setMarkerAlpha 0;
"objectiveTracker_side_av" setMarkerAlpha 0;
"objectiveTracker_side_mortars" setMarkerAlpha 0;
"objectiveTracker_side_supply" setMarkerAlpha 0;
"objectiveTracker_side_hq" setMarkerAlpha 0;
"objectiveTracker_side_comms" setMarkerAlpha 0;
"objectiveTracker_side_officer" setMarkerAlpha 0;
"objectiveTracker_side_commandos" setMarkerAlpha 0;
"objectiveTracker_side_snipers" setMarkerAlpha 0;

["TaskSucceeded",["",format["BLUFOR SECURED %1",markerText _sector]]] remoteExec ["BIS_fnc_showNotification",0];

SectorComplete = true;