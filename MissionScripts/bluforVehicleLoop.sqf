while {true} do
{	
	{
		_currentVehData = _x;
		_veh = _currentVehData select 0;
		_respawn = _currentVehData select 10;
		_abandoned = _currentVehData select 11;
		_abandonedDistance = _currentVehData select 12;
		_currentIndex = _forEachIndex;
		
		if (!(alive _veh)) then
		{		
			_respawnCounter = _currentVehData select 7;
			
			if (_respawnCounter == 0) then
			{
				deleteVehicle _veh;
				sleep 1;
			
				_currentVehData set [7,_respawn];	
				_currentVehData set [8,_abandoned];
				(_currentVehData select 9) setMarkerAlpha 0;
				
				_pos = _currentVehData select 1;
				_dir = _currentVehData select 2;
				_className = _currentVehData select 3;
				_appearance = _currentVehData select 4;
				_pylons = _currentVehData select 5;
				_pylonPaths = _currentVehData select 6;				
				
				_veh = createVehicle [_className, _pos, [], 0, "NONE"];				
				_veh setPosATL _pos;
				
				_veh spawn compile _appearance;
				
				{ 
					_veh removeWeaponGlobal getText (configFile >> "CfgMagazines" >> _x >> "pylonWeapon");
				} 
				forEach getPylonMagazines _veh;
				{
					_veh setPylonLoadOut [_forEachIndex + 1, _x, true, _pylonPaths select _forEachIndex];
				} forEach _pylons;				
				
				_veh setDir _dir;		

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
									, [_x, _variants, _exchangePadExit, _currentIndex]
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
				
				_currentVehData set [0,_veh];
			}
			else
			{
				_respawnCounter = _respawnCounter - 1;
				_currentVehData set [7,_respawnCounter];
				
				_pos = _currentVehData select 1;
				_className = _currentVehData select 3;
				
				_marker = _currentVehData select 9;
				_marker setMarkerAlpha 1;
				_marker setMarkerPos _pos;
				_marker setMarkerText format["%1 - RESPAWN %2s",getText(configfile >> "CfgVehicles" >> _className >> "displayName"), _respawnCounter];
				_marker setMarkerColor "ColorCivilian";
			};
		}
		else
		{
			_hasCrew = false;
			
			{
				scopeName "crewLoop";
				if (alive _x) then
				{
					_hasCrew = true;
					breakOut "crewLoop";
				};
			} forEach (crew _veh);
			
			if (not _hasCrew) then
			{
				_isAbandoned = true;
				{
					scopeName "playerLoop";
					if ((alive _x) and ((_x distance _veh) < _abandonedDistance)) then
					{
						_isAbandoned = false;
						breakOut "playerLoop";
					};
				} forEach allPlayers;
				
				if (_isAbandoned) then
				{
					_abandonedCounter = _currentVehData select 8;
					
					if (_abandonedCounter == 0) then
					{
						_pos = _currentVehData select 1;
						_dir = _currentVehData select 2;
					
						_veh setPosATL _pos;
						_veh setDir _dir;
						_veh setVehicleAmmo 1;
						_veh setFuel 1;
						_veh setDamage 0;						
						_currentVehData set [8,_abandoned];
					}
					else
					{
						_abandonedCounter = _abandonedCounter - 1;
						_currentVehData set [8,_abandonedCounter];
						(_currentVehData select 9) setMarkerText format["%1 - ABANDONED %2s",getText(configfile >> "CfgVehicles" >> _currentVehData select 3 >> "displayName"),_abandonedCounter];
					};
				}
				else
				{
					(_currentVehData select 9) setMarkerText format["%1",getText(configfile >> "CfgVehicles" >> _currentVehData select 3 >> "displayName")];
					_currentVehData set [8,_abandoned];
				};
				
				(_currentVehData select 9) setMarkerAlpha 1;
				(_currentVehData select 9) setMarkerColor "ColorBlack";
				(_currentVehData select 9) setMarkerPos (getPos _veh);
			}
			else
			{
				(_currentVehData select 9) setMarkerAlpha 0;
			};
		};
		
	} forEach blufor_vehicle_deploymentData;
	
	sleep 1;
};