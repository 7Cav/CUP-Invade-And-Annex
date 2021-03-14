blufor_vehicle_deploymentData = [];

blufor_vehicle_variants_level_1_deploymentData = [];
blufor_vehicle_variants_level_2_deploymentData = [];
blufor_vehicle_variants_level_3_deploymentData = [];
blufor_vehicle_variants_level_4_deploymentData = [];
blufor_vehicle_variants_level_5_deploymentData = [];
blufor_vehicle_variants_attackRotaryWing_deploymentData = [];
blufor_vehicle_variants_attackFixedWing_deploymentData = [];
blufor_vehicle_variants_transportRotaryWing_deploymentData = [];
blufor_vehicle_variants_transportFixedWing_deploymentData = [];
blufor_vehicle_variants_vehicleTransportRotaryWing_deploymentData = [];
blufor_vehicle_variants_vehicleTransportFixedWing_deploymentData = [];
blufor_vehicle_variants_forwardLogistics_deploymentData = [];
blufor_vehicle_variants_baseLogistics_deploymentData = [];
blufor_vehicle_variants_medical_deploymentData = [];
blufor_crate_variants_supply_deploymentData = [];
blufor_crate_variants_medical_deploymentData = [];

blufor_vehicle_level_1_classes = [];
blufor_vehicle_level_2_classes = [];
blufor_vehicle_level_3_classes = [];
blufor_vehicle_level_4_classes = [];
blufor_vehicle_level_5_classes = [];

blufor_vehicle_attackRotaryWing_classes = [];
blufor_vehicle_attackFixedWing_classes = [];

blufor_vehicle_transportRotaryWing_classes = [];
blufor_vehicle_transportFixedWing_classes = [];

blufor_vehicle_vehicleTransportRotaryWing_classes = [];
blufor_vehicle_vehicleTransportFixedWing_classes = [];

blufor_vehicle_forwardLogistics_classes = [];
blufor_vehicle_baseLogistics_classes = [];
blufor_vehicle_medical_classes = [];

blufor_crate_supply_classes = [];
blufor_crate_medical_classes = [];

blufor_vehicle_quickRecovery_classes = ["B_Boat_Transport_01_F"];

_variantDataList = [
	["blufor_vehicle_variant_level_1"
		,blufor_vehicle_variants_level_1_deploymentData
		,blufor_vehicle_level_1_classes
	]
	, ["blufor_vehicle_variant_level_2"
		,blufor_vehicle_variants_level_2_deploymentData
		,blufor_vehicle_level_2_classes
	]
	, ["blufor_vehicle_variant_level_3"
		,blufor_vehicle_variants_level_3_deploymentData
		,blufor_vehicle_level_3_classes
	]
	, ["blufor_vehicle_variant_level_4"
		,blufor_vehicle_variants_level_4_deploymentData
		,blufor_vehicle_level_4_classes
	]
	, ["blufor_vehicle_variant_level_5"
		,blufor_vehicle_variants_level_5_deploymentData
		,blufor_vehicle_level_5_classes
	]
	, ["blufor_vehicle_variant_attackRotaryWing"
		,blufor_vehicle_variants_attackRotaryWing_deploymentData
		,blufor_vehicle_attackRotaryWing_classes
	]
	, ["blufor_vehicle_variant_attackFixedWing"
		,blufor_vehicle_variants_attackFixedWing_deploymentData
		,blufor_vehicle_attackFixedWing_classes
	]
	, ["blufor_vehicle_variant_transportRotaryWing"
		,blufor_vehicle_variants_transportRotaryWing_deploymentData
		,blufor_vehicle_transportRotaryWing_classes
	]
	, ["blufor_vehicle_variant_transportFixedWing"
		,blufor_vehicle_variants_transportFixedWing_deploymentData
		,blufor_vehicle_transportFixedWing_classes
	]
	, ["blufor_vehicle_variant_vehicleTransportRotaryWing"
		,blufor_vehicle_variants_vehicleTransportRotaryWing_deploymentData
		,blufor_vehicle_vehicleTransportRotaryWing_classes
	]
	, ["blufor_vehicle_variant_vehicleTransportFixedWing"
		,blufor_vehicle_variants_vehicleTransportFixedWing_deploymentData
		,blufor_vehicle_vehicleTransportFixedWing_classes
	]
	, ["blufor_vehicle_variant_forwardLogistics"
		,blufor_vehicle_variants_forwardLogistics_deploymentData
		,blufor_vehicle_forwardLogistics_classes
	]
	, ["blufor_vehicle_variant_baseLogistics"
		,blufor_vehicle_variants_baseLogistics_deploymentData
		,blufor_vehicle_baseLogistics_classes
	]
	, ["blufor_vehicle_variant_medical"
		,blufor_vehicle_variants_medical_deploymentData
		,blufor_vehicle_medical_classes
	]
	, ["blufor_crate_variant_supply"
		,blufor_crate_variants_supply_deploymentData
		,blufor_crate_supply_classes
	]
	, ["blufor_crate_variant_medical"
		,blufor_crate_variants_medical_deploymentData
		,blufor_crate_medical_classes
	]
];

{
	_variantTypes = _x select 0;
	_variantDeploymentData = _x select 1;
	_classesList = _x select 2;
	
	_vehicleCounter = 1;
	while {_vehicleCounter < 999} do
	{
		_veh = missionNamespace getVariable [format["%1_%2",_variantTypes, _vehicleCounter],objNull];
		
		if (typeOf(_veh) != "") then
		{
			_vehicleData = [];
		
			_className = typeOf _veh;
			
			_appearance = [_veh,""] call BIS_fnc_exportVehicle;
			
			_pylons = GetPylonMagazines _veh;
			_pylonPaths = (configProperties [configFile >> "CfgVehicles" >> typeOf _veh >> "Components" >> "TransportPylonsComponent" >> "Pylons", "isClass _x"]) apply {getArray (_x >> "turret")};	
					
			_vehicleData pushBack _className;
			_vehicleData pushBack _appearance;
			_vehicleData pushBack _pylons;
			_vehicleData pushBack _pylonPaths;

			_variantDeploymentData pushBack _vehicleData;
			
			_classesList pushBack _className;
			
			deleteVehicle _veh;
		};	
		
		_vehicleCounter = _vehicleCounter + 1;
	};
} forEach _variantDataList;

_vehicleCounter = 1;
_index = 0;
while {_vehicleCounter < 999} do
{
	_veh = missionNamespace getVariable [format["blufor_vehicle_%1",_vehicleCounter],objNull];
	
	if (typeOf(_veh) != "") then
	{
		_vehicleData = [];
	
		_className = typeOf _veh;
		
		_appearance = [_veh,""] call BIS_fnc_exportVehicle;
		
		_pylons = GetPylonMagazines _veh;
		_pylonPaths = (configProperties [configFile >> "CfgVehicles" >> typeOf _veh >> "Components" >> "TransportPylonsComponent" >> "Pylons", "isClass _x"]) apply {getArray (_x >> "turret")};	
				
		_marker = createMarker [format["bluforVeh_%1_text",_vehicleCounter],getPos _veh];
		_marker setMarkerType "hd_dot";
		_marker setMarkerAlpha 0;
		
		_dir = getDir _veh;			
		
		_vehicleData pushBack _veh;
		_vehicleData pushBack (getPosATL _veh);
		_vehicleData pushback _dir;
		_vehicleData pushBack _className;
		_vehicleData pushBack _appearance;
		_vehicleData pushBack _pylons;
		_vehicleData pushBack _pylonPaths;	

		_respawnTimer = 60;	
		if (_veh isKindOf "Air") then
		{
			_respawnTimer = 600;
		};
		_vehicleData pushBack _respawnTimer;	
		_abandonedTimer = 1800;
		if ((typeOf _veh) in blufor_vehicle_quickRecovery_classes) then
		{
			_abandonedTimer = 60;
		};
		_vehicleData pushBack _abandonedTimer;
		
		_vehicleData pushBack _marker;		
		
		_vehicleData pushBack _respawnTimer;
		_vehicleData pushBack _abandonedTimer;		
		_abandonedDistance = 1000;
		if ((typeOf _veh) in blufor_vehicle_quickRecovery_classes) then
		{
			_abandonedDistance = 10;
		};
		_vehicleData pushback _abandonedDistance; 
		
		blufor_vehicle_deploymentData pushBack _vehicleData;	

		[_veh] execVM "MissionScripts\bluforVehicleInventory.sqf";		
		[_veh] execVM "MissionScripts\bluforCrewRestrictions.sqf";
		[_veh] execVM "MissionScripts\vehicleNoFire.sqf";	

		if ((typeOf _veh) == "CUP_B_AAV_USMC") then
		{
			_veh removeWeaponTurret [(_veh weaponsTurret [0]) select 1, [0]];	
			_veh selectWeaponTurret [(_veh weaponsTurret [0]) select 0, [0]];
		};
		
		_veh addEventHandler ["Killed",
			{
				{
					_x setDamage 1;
				} forEach crew (_this select 0);
			}
		];
				
		_vehicleExchangeList = [
			[blufor_vehicle_level_1_classes
			, blufor_vehicle_variants_level_1_deploymentData
			, "groundVehicle_exchangePad_entry"
			, "groundVehicle_exchangePad_exit"]
			
			,[blufor_vehicle_level_2_classes
			, blufor_vehicle_variants_level_2_deploymentData
			, "groundVehicle_exchangePad_entry"
			, "groundVehicle_exchangePad_exit"]
			
			,[blufor_vehicle_level_3_classes
			, blufor_vehicle_variants_level_3_deploymentData
			, "groundVehicle_exchangePad_entry"
			, "groundVehicle_exchangePad_exit"]
			
			,[blufor_vehicle_level_4_classes
			, blufor_vehicle_variants_level_4_deploymentData
			, "groundVehicle_exchangePad_entry"
			, "groundVehicle_exchangePad_exit"]
			
			,[blufor_vehicle_level_5_classes
			, blufor_vehicle_variants_level_5_deploymentData
			, "groundVehicle_exchangePad_entry"
			, "groundVehicle_exchangePad_exit"]			
			
			,[blufor_vehicle_attackRotaryWing_classes
			, blufor_vehicle_variants_attackRotaryWing_deploymentData
			, "rotaryWing_exchangePad_entry"
			, "rotaryWing_exchangePad_exit"]
			
			,[blufor_vehicle_transportRotaryWing_classes
			, blufor_vehicle_variants_transportRotaryWing_deploymentData
			, "rotaryWing_exchangePad_entry"
			, "rotaryWing_exchangePad_exit"]
			
			,[blufor_vehicle_vehicleTransportRotaryWing_classes
			, blufor_vehicle_variants_vehicleTransportRotaryWing_deploymentData
			, "rotaryWing_exchangePad_entry"
			, "rotaryWing_exchangePad_exit"]
			
			,[blufor_vehicle_attackFixedWing_classes
			, blufor_vehicle_variants_attackFixedWing_deploymentData
			, "fixedWing_exchangePad_entry"
			, "fixedWing_exchangePad_exit"]
			
			,[blufor_vehicle_transportFixedWing_classes
			, blufor_vehicle_variants_transportFixedWing_deploymentData
			, "fixedWing_exchangePad_entry"
			, "fixedWing_exchangePad_exit"]
			
			,[blufor_vehicle_vehicleTransportFixedWing_classes
			, blufor_vehicle_variants_vehicleTransportFixedWing_deploymentData
			, "fixedWing_exchangePad_entry"
			, "fixedWing_exchangePad_exit"]			
		];		
		
		{
			scopeName "exchangeLoop";
			_exchangeData = _x;
			_classes = _x select 0;
			_variants = _x select 1;
			_exchangePadEntry = _x select 2;
			_exchangePadExit = _x select 3;
			if (_className in _classes) then
			{				
				{		
					[_veh
						, [
							format["<t color='#FF0000'>Exchange for %1</t>", getText(configfile >> "CfgVehicles" >> _x >> "displayName")]
							, "MissionScripts\bluforVehicleExchangeClient.sqf"
							, [_x, _variants, _exchangePadExit, _index]
							, 99
							, true
							, true
							, ""
							, format["(getPos _target) inArea %1", str(_exchangePadEntry)
							, 5]
						]
					] remoteExec ["addAction",0,true];
				} forEach _classes;
				breakOut "exchangeLoop";
			};
		} forEach _vehicleExchangeList;	
		
		_index = _index + 1;
	};	
	
	_vehicleCounter = _vehicleCounter + 1;
};