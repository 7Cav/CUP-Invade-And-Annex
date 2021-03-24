while {true} do 
{
	if (VehicleExchangeRequested) then
	{	
		_oldVehicle = VehicleExchangeData select 0;
		_direction = VehicleExchangeData select 1;
		_damage = VehicleExchangeData select 2;
		_fuel = VehicleExchangeData select 3;
		_chosenVehicleClass = VehicleExchangeData select 4;
		_deploymentData = VehicleExchangeData select 5;
		_spawnMarker = VehicleExchangeData select 6;
		_indexInBluforVehicleList = VehicleExchangeData select 7;
		
		{
			_x action ["getout", _oldVehicle];	
		} foreach crew _oldVehicle;

		deleteVehicle _oldVehicle;

		_appearance = "";
		_pylons = [];
		_pylonPaths = [];
		{
			if ((_x select 0) == _chosenVehicleClass) then
			{
				_appearance = _x select 1;
				_pylons = _x select 2;
				_pylonPaths = _x select 3;
			};
		} forEach _deploymentData;

		_newVehicle = createVehicle [_chosenVehicleClass, [0,0,1000], [], 0, "NONE"];
		_newVehicle setPosATL [(getMarkerPos _spawnMarker) select 0, (getMarkerPos _spawnMarker) select 1, 0.5];
		_newVehicle setDir _direction;
		_newVehicle setDamage _damage;
		_newVehicle setFuel _fuel;

		_newVehicle spawn compile _appearance;
						
		{ 
			_newVehicle removeWeaponGlobal getText (configFile >> "CfgMagazines" >> _x >> "pylonWeapon");
		} 
		forEach getPylonMagazines _newVehicle;
		{
			_newVehicle setPylonLoadOut [_forEachIndex + 1, _x, true, _pylonPaths select _forEachIndex];
		} forEach _pylons;			

			
		_bluforVehicleListData = blufor_vehicle_deploymentData select _indexInBluforVehicleList;

		_bluforVehicleListData set [0, _newVehicle];
		_bluforVehicleListData set [3, _chosenVehicleClass];
		_bluforVehicleListData set [4, _appearance];
		_bluforVehicleListData set [5, _pylons];
		_bluforVehicleListData set [6, _pylonPaths];

		[_newVehicle] execVM "MissionScripts\bluforVehicleInventory.sqf";		
		[_newVehicle] execVM "MissionScripts\bluforCrewRestrictions.sqf";
		[_newVehicle] execVM "MissionScripts\vehicleNoFire.sqf";		

		_newVehicle addEventHandler ["Killed",
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
			
			,[blufor_vehicle_attackFixedWing_classes
			, blufor_vehicle_variants_attackFixedWing_deploymentData
			, "fixedWing_exchangePad_entry"
			, "fixedWing_exchangePad_exit"]
			
			,[blufor_vehicle_transportFixedWing_classes
			, blufor_vehicle_variants_transportFixedWing_deploymentData
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
			if (_chosenVehicleClass in _classes) then
			{
				{		
					[_newVehicle
						, [
							format["<t color='#FF0000'>Exchange for %1</t>", getText(configfile >> "CfgVehicles" >> _x >> "displayName")]
							, "MissionScripts\bluforVehicleExchangeClient.sqf"
							, [_x, _variants, _exchangePadExit, _indexInBluforVehicleList]
							, 99
							, true
							, true
							, ""
							, format["(getPos _target) inArea %1", str(_exchangePadEntry)
							, 10]
						]
					] remoteExec ["addAction",0,true];
				} forEach _classes;
				breakOut "exchangeLoop";
			};
		} forEach _vehicleExchangeList;	
	
		VehicleExchangeRequested = false;
		VehicleExchangeData = [];
	};

	sleep 1;
};