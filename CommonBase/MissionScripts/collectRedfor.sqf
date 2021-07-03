redfor_squad_level_1_deploymentData = [];
redfor_squad_level_2_deploymentData = [];
redfor_squad_level_3_deploymentData = [];

redfor_crewman_level_1_deploymentData = [];
redfor_crewman_level_2_deploymentData = [];
redfor_crewman_level_3_deploymentData = [];

redfor_officer_level_1_deploymentData = [];
redfor_officer_level_2_deploymentData = [];
redfor_officer_level_3_deploymentData = [];

redfor_commandos_level_1_deploymentData = [];
redfor_commandos_level_2_deploymentData = [];
redfor_commandos_level_3_deploymentData = [];

redfor_snipers_level_1_deploymentData = [];
redfor_snipers_level_2_deploymentData = [];
redfor_snipers_level_3_deploymentData = [];

redfor_mbt_level_1_deploymentData = [];
redfor_mbt_level_2_deploymentData = [];
redfor_mbt_level_3_deploymentData = [];

redfor_ifv_level_1_deploymentData = [];
redfor_ifv_level_2_deploymentData = [];
redfor_ifv_level_3_deploymentData = [];

redfor_apc_level_1_deploymentData = [];
redfor_apc_level_2_deploymentData = [];
redfor_apc_level_3_deploymentData = [];

redfor_lightVehicle_level_1_deploymentData = [];
redfor_lightVehicle_level_2_deploymentData = [];
redfor_lightVehicle_level_3_deploymentData = [];

redfor_antiVehicle_deploymentData = [];

redfor_antiAir_deploymentData = [];

redfor_mortar_deploymentData = [];
redfor_commTower_deploymentData = [];
redfor_hqTent_deploymentData = [];
redfor_supplyVehicle_deploymentData = [];
redfor_compoundWall_deploymentData = [];

fnc_collect_vehicle = {
	params["_vehicleVariableStiring","_deploymentData"];
	
	_veh = missionNamespace getVariable [_vehicleVariableStiring,objNull];	
	
	if (typeOf(_veh) != "") then
	{
		_className = typeOf _veh;
		_appearance = [_veh,""] call BIS_fnc_exportVehicle;
		_pylons = GetPylonMagazines _veh;		
		_pylonPaths = (configProperties [configFile >> "CfgVehicles" >> typeOf _veh >> "Components" >> "TransportPylonsComponent" >> "Pylons", "isClass _x"]) apply {getArray (_x >> "turret")};	
				
		_deploymentData pushBack _className;
		_deploymentData pushBack _appearance;
		_deploymentData pushBack _pylons;
		_deploymentData pushBack _pylonPaths;
		
		deleteVehicle _veh;
	};
};

fnc_collect_squad = {
	params["_squadVariableString","_deploymentData", "_removeSecondaryRocket"];
	
	_squadMemberCounter = 1;
	while {_squadMemberCounter < 999} do
	{
		_squadMember = missionNamespace getVariable [format["%1_%2", _squadVariableString, _squadMemberCounter],objNull];
		if (typeOf _squadMember != "") then
		{
			_className = typeOf _squadMember;	
			_primaryWeaponMagazine = (((weaponsItems _squadMember) select 0) select 4) select 0;			
			_squadMember removePrimaryWeaponItem _primaryWeaponMagazine;	
			if (_removeSecondaryRocket) then
			{
				if ((((weaponsItems _squadMember) select 1) select 0) != "") then
				{
					_secondaryWeaponMagazine = (((weaponsItems _squadMember) select 1) select 4) select 0;	
					_squadMember removeSecondaryWeaponItem _secondaryWeaponMagazine;
				};		
			};			
			_loadout = getUnitLoadout _squadMember;
			_deploymentData pushBack [_className,_loadout];
			deleteVehicle _squadMember;
		};
		
		_squadMemberCounter = _squadMemberCounter + 1;
	};	
};

fnc_collect_individual = {
	params["_individualVariableString","_deploymentData"];
	
	_individual = missionNamespace getVariable [_individualVariableString,objNull];
	_individual_className = typeOf _individual;
	_primaryWeaponMagazine = (((weaponsItems _individual) select 0) select 4) select 0;
	_individual removePrimaryWeaponItem _primaryWeaponMagazine;
	_individual_loadout = getUnitLoadout _individual;
	_deploymentData pushBack _individual_className;
	_deploymentData pushBack _individual_loadout;
	deleteVehicle _individual;
};

["redfor_squad_level_1", redfor_squad_level_1_deploymentData, true] call fnc_collect_squad;
["redfor_squad_level_2", redfor_squad_level_2_deploymentData, true] call fnc_collect_squad;
["redfor_squad_level_3", redfor_squad_level_3_deploymentData, true] call fnc_collect_squad;

["redfor_crewman_level_1", redfor_crewman_level_1_deploymentData] call fnc_collect_individual;
["redfor_crewman_level_2", redfor_crewman_level_2_deploymentData] call fnc_collect_individual;
["redfor_crewman_level_3", redfor_crewman_level_3_deploymentData] call fnc_collect_individual;

["redfor_officer_level_1", redfor_officer_level_1_deploymentData] call fnc_collect_individual;
["redfor_officer_level_2", redfor_officer_level_2_deploymentData] call fnc_collect_individual;
["redfor_officer_level_3", redfor_officer_level_3_deploymentData] call fnc_collect_individual;

["redfor_commando_level_1", redfor_commandos_level_1_deploymentData, false] call fnc_collect_squad;
["redfor_commando_level_2", redfor_commandos_level_2_deploymentData, false] call fnc_collect_squad;
["redfor_commando_level_3", redfor_commandos_level_3_deploymentData, false] call fnc_collect_squad;

["redfor_sniper_level_1", redfor_snipers_level_1_deploymentData, false] call fnc_collect_squad;
["redfor_sniper_level_2", redfor_snipers_level_2_deploymentData, false] call fnc_collect_squad;
["redfor_sniper_level_3", redfor_snipers_level_3_deploymentData, false] call fnc_collect_squad;

["redfor_mbt_level_1", redfor_mbt_level_1_deploymentData] call fnc_collect_vehicle;
["redfor_mbt_level_2", redfor_mbt_level_2_deploymentData] call fnc_collect_vehicle;
["redfor_mbt_level_3", redfor_mbt_level_3_deploymentData] call fnc_collect_vehicle;

["redfor_ifv_level_1", redfor_ifv_level_1_deploymentData] call fnc_collect_vehicle;
["redfor_ifv_level_2", redfor_ifv_level_2_deploymentData] call fnc_collect_vehicle;
["redfor_ifv_level_3", redfor_ifv_level_3_deploymentData] call fnc_collect_vehicle;

["redfor_apc_level_1", redfor_apc_level_1_deploymentData] call fnc_collect_vehicle;
["redfor_apc_level_2", redfor_apc_level_2_deploymentData] call fnc_collect_vehicle;
["redfor_apc_level_3", redfor_apc_level_3_deploymentData] call fnc_collect_vehicle;

["redfor_lightVehicle_level_1", redfor_lightVehicle_level_1_deploymentData] call fnc_collect_vehicle;
["redfor_lightVehicle_level_2", redfor_lightVehicle_level_2_deploymentData] call fnc_collect_vehicle;
["redfor_lightVehicle_level_3", redfor_lightVehicle_level_3_deploymentData] call fnc_collect_vehicle;

["redfor_antiVehicle", redfor_antiVehicle_deploymentData] call fnc_collect_vehicle;

["redfor_antiAir", redfor_antiAir_deploymentData] call fnc_collect_vehicle;

["redfor_mortar", redfor_mortar_deploymentData] call fnc_collect_vehicle;

["redfor_commTower", redfor_commTower_deploymentData] call fnc_collect_vehicle;

["redfor_hqTent", redfor_hqTent_deploymentData] call fnc_collect_vehicle;

["redfor_supplyVehicle", redfor_supplyVehicle_deploymentData] call fnc_collect_vehicle;

["redfor_supplyVehicle", redfor_supplyVehicle_deploymentData] call fnc_collect_vehicle;

_compoundWall = missionNamespace getVariable ["redfor_compoundWall",objNull];
redfor_compoundWall_deploymentData = [typeOf _compoundWall, ((0 boundingBoxReal _compoundWall) select 1) select 0];
deleteVehicle _compoundWall;