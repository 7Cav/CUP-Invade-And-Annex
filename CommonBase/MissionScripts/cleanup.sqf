while {true} do {
	sleep 900; // Wait 15 mins
	
	// Clean up any objects on the ground near respawn marker
	_clear = nearestObjects[(getMarkerPos "respawn_west"),["weaponholder"],300];
	for "_i" from 0 to count _clear - 1 do {
		deleteVehicle (_clear select _i);	
	
	// Clean up ACE Spare Wheels on the ground near respawn marker
	_clear = (getMarkerPos "respawn_west") nearObjects ["ACE_Wheel",300];
	for "_i" from 0 to count _clear - 1 do {
		deleteVehicle (_clear select _i);		
	};	
	
	// Clean up ACE Spare Tracks on the ground near respawn marker
	_clear = (getMarkerPos "respawn_west") nearObjects ["ACE_Track",300];
	for "_i" from 0 to count _clear - 1 do {
		deleteVehicle (_clear select _i);		
	};
	
	// Delete empty groups
	{
		if (count units _x == 0) then {
			deleteGroup _x;
		};
	} forEach allGroups;
};