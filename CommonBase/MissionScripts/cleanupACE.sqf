while {true} do {

	// Delete ACE Demolition Charges near respawn marker
	_clear = (getMarkerPos "respawn_west") nearObjects ["DemoCharge_Remote_Ammo",200];
	for "_i" from 0 to count _clear - 1 do {
		deleteVehicle (_clear select _i);		
	};	
	
	// Delete ACE Demolition Charges near respawn marker
	_clear = (getMarkerPos "respawn_west") nearObjects ["ACE_Explosives_Place_DemoCharge",200];
	for "_i" from 0 to count _clear - 1 do {
		deleteVehicle (_clear select _i);		
	};	
	
	// Delete ACE Large Entrenchment near respawn marker
	_clear = (getMarkerPos "respawn_west") nearObjects ["ACE_envelope_big",300];
	for "_i" from 0 to count _clear - 1 do {
		deleteVehicle (_clear select _i);		
	};	
	
	// Delete ACE Small Entrenchment near respawn marker
	_clear = (getMarkerPos "respawn_west") nearObjects ["ACE_envelope_small",300];
	for "_i" from 0 to count _clear - 1 do {
		deleteVehicle (_clear select _i);		
	};	
	
	// Delete craters from crashed aircraft	
	{deleteVehicle _x;} forEach (allMissionObjects "CraterLong"); // Delete craters

	sleep 15;
};