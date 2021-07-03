find_sector = {
	params["_previousSector"];

	_foundSector = "";	
	
	_farSectors = [];
	_nearSectors = [];
	
	if (_previousSector == "") then
	{
		_foundSector = selectRandom sectorList;
	}
	else
	{
		{
			if ((getMarkerPos _x) distance (getMarkerPos _previousSector) >= 2000 + ((getMarkerSize _x) select 0) + ((getMarkerSize _previousSector) select 0)) then
			{
				_farSectors pushBack _x;
			}
			else
			{
				_nearSectors pushBack _x;
			};
		} forEach sectorList;
		
		if (count _farSectors > 0) then
		{
			_distance = 99999;
		
			{
				if ((getMarkerPos _x) distance (getMarkerPos _previousSector) < _distance) then
				{
					_foundSector = _x;
					_distance = (getMarkerPos _x) distance (getMarkerPos _previousSector);
				};
			}
			forEach _farSectors;
		}
		else
		{
			_distance = 0;
			{
				if ((getMarkerPos _x) distance (getMarkerPos _previousSector) > _distance) then
				{
					_foundSector = _x;
					_distance = (getMarkerPos _x) distance (getMarkerPos _previousSector);
				};
			}
			forEach _nearSectors;
		};
	};
	
	_foundSector
};

_previousSector = "";

_bluforVehicleHandler = [] execVM "MissionScripts\bluforVehicleLoop.sqf";
_haloInsertHandler = [] execVM "MissionScripts\haloInsertManager.sqf";

CurrentSector = "";
_missionDone = false;

sleep 20;

while {!_missionDone} do
{
	CurrentSector = [_previousSector] call find_sector;
	
	if (CurrentSector == "") then
	{
		_missionDone = true;
	}
	else
	{	
		["TaskAssigned",["",format["ATTACK %1",markerText CurrentSector]]] remoteExec ["BIS_fnc_showNotification",0];			
		
		[1,["IMPORTANT! - Side Objective Buildings, Static Weapons or Vehicles must be destroyed COMPLETELY. Use of demolitions is HIGHLY recommended.", "PLAIN", 1]] remoteExec ["cutText",0];

		SectorComplete = false;
		_sectorIndex = sectorList find CurrentSector;
		_sectorEngagementHandle = [CurrentSector		
									, sectorRoadsList select _sectorIndex
									, sectorObjectiveGenericAreaList select _sectorIndex
									, sectorSpecificAAPositionsList select _sectorIndex
									, sectorSpecificAVPositionsList select _sectorIndex
									, sectorSpecificMortarPositionsList select _sectorIndex
									, sectorSpecificSupplyPositionsList select _sectorIndex
									, sectorSpecificHQPositionsList select _sectorIndex
									, sectorSpecificCommsPositionsList select _sectorIndex
									, sectorSpecificCommandosPositionsList select _sectorIndex
									, sectorSpecificSnipersPositionsList select _sectorIndex] execVM "MissionScripts\sectorEngagement.sqf";
	
		waitUntil {SectorComplete};		
	};
	
	_previousSector = CurrentSector;

	sleep 5;
};

terminate _bluforVehicleHandler;
terminate _haloInsertHandler;

"EveryoneWon" call BIS_fnc_endMissionServer;