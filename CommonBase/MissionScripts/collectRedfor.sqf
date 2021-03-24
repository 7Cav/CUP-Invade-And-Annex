redfor_squad_deploymentData = [];
redfor_crewman_deploymentData = [];
redfor_officer_deploymentData = [];
redfor_commando_deploymentData = [];
redfor_sniper_deploymentData = [];
redfor_vehicle_level_1_deploymentData = [];
redfor_vehicle_level_2_deploymentData = [];
redfor_vehicle_level_3_deploymentData = [];
redfor_vehicle_level_4_deploymentData = [];
redfor_vehicle_level_5_deploymentData = [];
redfor_vehicle_aa_deploymentData = [];
redfor_vehicle_av_deploymentData = [];
redfor_mortar_deploymentData = [];
redfor_commTower_deploymentData = [];
redfor_hqTent_deploymentData = [];
redfor_supplyVehicle_deploymentData = [];
redfor_compoundWall_deploymentData = [];

fnc_collect_vehicle = {
	params["_veh"];

	_data = [];
	
	if (typeOf(_veh) != "") then
	{
		_className = typeOf _veh;
		_appearance = [_veh,""] call BIS_fnc_exportVehicle;
		_pylons = GetPylonMagazines _veh;		
		_pylonPaths = (configProperties [configFile >> "CfgVehicles" >> typeOf _veh >> "Components" >> "TransportPylonsComponent" >> "Pylons", "isClass _x"]) apply {getArray (_x >> "turret")};	
				
		_data pushBack _className;
		_data pushBack _appearance;
		_data pushBack _pylons;
		_data pushBack _pylonPaths;
	};
	
	_data
};

_squadMemberCounter = 1;
while {_squadMemberCounter < 999} do
{
	_squadMember = missionNamespace getVariable [format["redfor_squad_%1",_squadMemberCounter],objNull];
	if (typeOf _squadMember != "") then
	{
		_className = typeOf _squadMember;		
		_loadout = getUnitLoadout _squadMember;
		redfor_squad_deploymentData pushBack [_className,_loadout];
		deleteVehicle _squadMember;
	};
	
	_squadMemberCounter = _squadMemberCounter + 1;
};

_crewman = missionNamespace getVariable ["redfor_crewman",objNull];
_crewman_className = typeOf _crewman;
_crewman_loadout = getUnitLoadout _crewman;
redfor_crewman_deploymentData pushBack _crewman_className;
redfor_crewman_deploymentData pushBack _crewman_loadout;
deleteVehicle _crewman;

_officer = missionNamespace getVariable ["redfor_officer",objNull];
_officer_className = typeOf _officer;
_officer_loadout = getUnitLoadout _officer;
redfor_officer_deploymentData pushBack _officer_className;
redfor_officer_deploymentData pushBack _officer_loadout;
deleteVehicle _officer;

_squadMemberCounter = 1;
while {_squadMemberCounter < 999} do
{
	_squadMember = missionNamespace getVariable [format["redfor_commando_%1",_squadMemberCounter],objNull];
	if (typeOf _squadMember != "") then
	{
		_className = typeOf _squadMember;		
		_loadout = getUnitLoadout _squadMember;
		redfor_commando_deploymentData pushBack [_className,_loadout];
		deleteVehicle _squadMember;
	};
	
	_squadMemberCounter = _squadMemberCounter + 1;
};

_squadMemberCounter = 1;
while {_squadMemberCounter < 999} do
{
	_squadMember = missionNamespace getVariable [format["redfor_sniper_%1",_squadMemberCounter],objNull];
	if (typeOf _squadMember != "") then
	{
		_className = typeOf _squadMember;		
		_loadout = getUnitLoadout _squadMember;
		redfor_sniper_deploymentData pushBack [_className,_loadout];
		deleteVehicle _squadMember;
	};
	
	_squadMemberCounter = _squadMemberCounter + 1;
};

_lvl1Veh = missionNamespace getVariable ["redfor_vehicle_level_1",objNull];
redfor_vehicle_level_1_deploymentData = [_lvl1Veh] call fnc_collect_vehicle;
deleteVehicle _lvl1Veh;

_lvl2Veh = missionNamespace getVariable ["redfor_vehicle_level_2",objNull];
redfor_vehicle_level_2_deploymentData = [_lvl2Veh] call fnc_collect_vehicle;
deleteVehicle _lvl2Veh;

_lvl3Veh = missionNamespace getVariable ["redfor_vehicle_level_3",objNull];
redfor_vehicle_level_3_deploymentData = [_lvl3Veh] call fnc_collect_vehicle;
deleteVehicle _lvl3Veh;

_lvl4Veh = missionNamespace getVariable ["redfor_vehicle_level_4",objNull];
redfor_vehicle_level_4_deploymentData = [_lvl4Veh] call fnc_collect_vehicle;
deleteVehicle _lvl4Veh;

_lvl5Veh = missionNamespace getVariable ["redfor_vehicle_level_5",objNull];
redfor_vehicle_level_5_deploymentData = [_lvl5Veh] call fnc_collect_vehicle;
deleteVehicle _lvl5Veh;

_aaVeh = missionNamespace getVariable ["redfor_vehicle_aa",objNull];
redfor_vehicle_aa_deploymentData = [_aaVeh] call fnc_collect_vehicle;
deleteVehicle _aaVeh;

_avVeh = missionNamespace getVariable ["redfor_vehicle_av",objNull];
redfor_vehicle_av_deploymentData = [_avVeh] call fnc_collect_vehicle;
deleteVehicle _avVeh;

_mortar = missionNamespace getVariable ["redfor_mortar",objNull];
redfor_mortar_deploymentData = [_mortar] call fnc_collect_vehicle;
deleteVehicle _mortar;

_commTower = missionNamespace getVariable ["redfor_commTower",objNull];
redfor_commTower_deploymentData = [_commTower] call fnc_collect_vehicle;
deleteVehicle _commTower;

_hqTent = missionNamespace getVariable ["redfor_hqTent",objNull];
redfor_hqTent_deploymentData = [_hqTent] call fnc_collect_vehicle;
deleteVehicle _hqTent;

_supplyVehicle = missionNamespace getVariable ["redfor_supplyVehicle",objNull];
redfor_supplyVehicle_deploymentData = [_supplyVehicle] call fnc_collect_vehicle;
deleteVehicle _supplyVehicle;

_compoundWall = missionNamespace getVariable ["redfor_compoundWall",objNull];
redfor_compoundWall_deploymentData = [typeOf _compoundWall, ((0 boundingBoxReal _compoundWall) select 1) select 0];
deleteVehicle _compoundWall;