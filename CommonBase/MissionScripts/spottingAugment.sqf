fnc_getHeightIncrement = {
	params["_unit"];
	
	_increment = 0;
	
	if (vehicle _unit == _unit) then
	{
		if (stance _unit == "STAND") then
		{
			_increment = 1.8;
		};
		if (stance _unit == "CROUCH") then
		{
			_increment = 0.9;
		};
		if (stance _unit == "PRONE") then
		{
			_increment = 0.2;
		};
	}
	else
	{
		_increment = 2.1;
	};
	
	_increment
};

fnc_getSpottingAugmentDistance = {

	params["_unit"];
	
	_spottingAugmentDistance = redfor_infantry_level_1_SpottingAugmentDistance;	
	
	_commandosDeploymentData = redfor_commandos_level_1_deploymentData;
	_snipersDeploymentData = redfor_snipers_level_1_deploymentData;
	
	_commandoSpottingDistance = 100;
	_sniperSpottingDistance = 100;
	_infantrySpottingDistance = 100;
	
	if (forceLevel == 1) then
	{
		_commandosDeploymentData = redfor_commandos_level_1_deploymentData;
		_snipersDeploymentData = redfor_snipers_level_1_deploymentData;
		
		_commandoSpottingDistance = redfor_commando_level_1_SpottingAugmentDistance;
		_sniperSpottingDistance = redfor_sniper_level_1_SpottingAugmentDistance;
		_infantrySpottingDistance = redfor_infantry_level_1_SpottingAugmentDistance;
	};
	
	if (forceLevel == 2) then
	{
		_commandosDeploymentData = redfor_commandos_level_2_deploymentData;
		_snipersDeploymentData = redfor_snipers_level_2_deploymentData;
		
		_commandoSpottingDistance = redfor_commando_level_2_SpottingAugmentDistance;
		_sniperSpottingDistance = redfor_sniper_level_2_SpottingAugmentDistance;
		_infantrySpottingDistance = redfor_infantry_level_2_SpottingAugmentDistance;
	};
	
	if (forceLevel == 3) then
	{
		_commandosDeploymentData = redfor_commandos_level_3_deploymentData;
		_snipersDeploymentData = redfor_snipers_level_3_deploymentData;
		
		_commandoSpottingDistance = redfor_commando_level_3_SpottingAugmentDistance;
		_sniperSpottingDistance = redfor_sniper_level_3_SpottingAugmentDistance;
		_infantrySpottingDistance = redfor_infantry_level_3_SpottingAugmentDistance;
	};
	
	switch(typeOf(_unit)) do
	{		
		case (redfor_mbt_level_1_deploymentData select 0) : { _spottingAugmentDistance = redfor_mbt_level_1_SpottingAugmentDistance; };	
		case (redfor_mbt_level_2_deploymentData select 0) : { _spottingAugmentDistance = redfor_mbt_level_2_SpottingAugmentDistance; };	
		case (redfor_mbt_level_3_deploymentData select 0) : { _spottingAugmentDistance = redfor_mbt_level_3_SpottingAugmentDistance; };	
		
		case (redfor_ifv_level_1_deploymentData select 0) : { _spottingAugmentDistance = redfor_ifv_level_1_SpottingAugmentDistance; };	
		case (redfor_ifv_level_2_deploymentData select 0) : { _spottingAugmentDistance = redfor_ifv_level_2_SpottingAugmentDistance; };	
		case (redfor_ifv_level_3_deploymentData select 0) : { _spottingAugmentDistance = redfor_ifv_level_3_SpottingAugmentDistance; };			
		
		case (redfor_apc_level_1_deploymentData select 0) : { _spottingAugmentDistance = redfor_apc_level_1_SpottingAugmentDistance; };	
		case (redfor_apc_level_2_deploymentData select 0) : { _spottingAugmentDistance = redfor_apc_level_2_SpottingAugmentDistance; };	
		case (redfor_apc_level_3_deploymentData select 0) : { _spottingAugmentDistance = redfor_apc_level_3_SpottingAugmentDistance; };			
		
		case (redfor_lightVehicle_level_1_deploymentData select 0) : { _spottingAugmentDistance = redfor_lightVehicle_level_1_SpottingAugmentDistance; };	
		case (redfor_lightVehicle_level_2_deploymentData select 0) : { _spottingAugmentDistance = redfor_lightVehicle_level_2_SpottingAugmentDistance; };	
		case (redfor_lightVehicle_level_3_deploymentData select 0) : { _spottingAugmentDistance = redfor_lightVehicle_level_3_SpottingAugmentDistance; };			
				
		case (redfor_antiAir_deploymentData select 0) : { _spottingAugmentDistance = redfor_antiAir_SpottingAugmentDistance; };	
		
		case (redfor_antiVehicle_deploymentData select 0) : { _spottingAugmentDistance = redfor_antiVehicle_SpottingAugmentDistance; };		
		
		case ((_commandosDeploymentData select 0) select 0) : { _spottingAugmentDistance = _commandoSpottingDistance };
		
		case ((_snipersDeploymentData select 0) select 0) : { _spottingAugmentDistance = _sniperSpottingDistance };
		
		default { _spottingAugmentDistance = _infantrySpottingDistance; };
	};
	
	_spottingAugmentDistance
};

while {true} do {
	
	redfor_artillery_targets = [];
	
	_redforUnits = [];
	{
		if (side _x == east) then
		{
			_redforUnits pushBack _x;			
		};
	} forEach allUnits;
	
	_bluforUnits = [];
	{
		if (side _x == west) then
		{
			_bluforUnits pushBack (vehicle _x);
		};
	} forEach allUnits;	
	
	{		
		_currentUnit = _x;
				
		_spottingAugmentDistance = [vehicle _currentUnit] call fnc_getSpottingAugmentDistance;				
		{					
			_playerUnit = _x;		
			if ((vehicle _playerUnit) isKindOf "Air") then
			{
				if (typeOf (vehicle _currentUnit) == (redfor_antiAir_deploymentData select 0)) then
				{				
					_heightIncrementRedfor = [_currentUnit] call fnc_getHeightIncrement;
					_heightIncrementBlufor = [_playerUnit] call fnc_getHeightIncrement;				
					if (([objNull,"VIEW"] checkVisibility [[getPosASL _currentUnit select 0,getPosASL _currentUnit select 1,(getPosASL _currentUnit select 2) + _heightIncrementRedfor], [getPosASL _playerUnit select 0,getPosASL _playerUnit select 1,(getPosASL _playerUnit select 2) + _heightIncrementBlufor]]) > 0) then
					{	
						
						_distance = _currentUnit distance _playerUnit;
						_distanceFactor = 1 - (_distance/_spottingAugmentDistance);
						_spottingChance = random 1;	
						if (_distanceFactor >= 2 * _spottingChance) then
						{
							_currentUnit reveal [_playerUnit,4];
							_currentUnit reveal [vehicle _playerUnit,4];
						};									
					};
				};
			}
			else
			{
				if (_currentUnit distance _playerUnit <= _spottingAugmentDistance) then
				{				
					_heightIncrementRedfor = [_currentUnit] call fnc_getHeightIncrement;
					_heightIncrementBlufor = [_playerUnit] call fnc_getHeightIncrement;				
					if (([objNull,"VIEW"] checkVisibility [[getPosASL _currentUnit select 0,getPosASL _currentUnit select 1,(getPosASL _currentUnit select 2) + _heightIncrementRedfor], [getPosASL _playerUnit select 0,getPosASL _playerUnit select 1,(getPosASL _playerUnit select 2) + _heightIncrementBlufor]]) > 0) then
					{	
						
						_distance = _currentUnit distance _playerUnit;
						_distanceFactor = 1 - (_distance/_spottingAugmentDistance);
						_spottingChance = random 1;	
						if (_distanceFactor >= 2 * _spottingChance) then
						{
							{
								_x reveal [_playerUnit,4];
								_x reveal [vehicle _playerUnit,4];								
							} forEach _redforUnits;	
						};									
					};			
				};	
			};					
		} forEach _bluforUnits;
		
	} forEach _redforUnits;
	
	sleep 10;
};