params["_group","_sector"];

while {({alive _x} count units _group) > 0} do
{	
	if (!((getPos (leader _group)) inArea _sector)) then	
	{
		_randPos = [getMarkerPos _sector, 0,((markerSize _sector) select 0) / 2, 2, 0, 0.30] call BIS_fnc_findSafePos;
		_waypoint = _group addWaypoint [_randPos, 0];
		_waypoint setWaypointType "MOVE";
	};

	sleep 10;
};