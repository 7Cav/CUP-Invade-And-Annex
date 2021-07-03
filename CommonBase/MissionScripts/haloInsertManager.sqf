while {true} do
{
	if (CurrentSector != "") then
	{
		_airTransportAvailable = false;	
		{
			scopeName "vehicleLoop";
			_veh = _x select 0;
			_class = _x select 3;
			
			if ((alive _veh) and (alive (driver _veh)) and ((_class in blufor_vehicle_transportRotaryWing_classes) or (_class in blufor_vehicle_transportFixedWing_classes))) then
			{
				_airTransportAvailable = true;
				breakOut "vehicleLoop";
			};
		} forEach blufor_vehicle_deploymentData;
		
		if (!_airTransportAvailable) then
		{
			_currentSectorPos = getMarkerPos CurrentSector;
			_homeSectorPos = getMarkerPos "sector_home";
			_dir = _homeSectorPos getDir _currentSectorPos;			
			"halo_insert" setMarkerDir _dir;		
			"halo_insert" setMarkerPos (_currentSectorPos getPos [1500,_dir-180]);		
		}
		else
		{
			"halo_insert" setMarkerPos [0,0];
		};
	};	
	
	sleep 5;
};