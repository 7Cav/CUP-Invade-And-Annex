_playerUnit = _this select 0;

waitUntil {(!(isNull _playerUnit))};
waitUntil { getPlayerUID _playerUnit != "" };

if (typeOf _playerUnit == "B_Survivor_F") then
{	
	if (!((getPlayerUID _playerUnit) in zeusGUIDs)) then
	{
		["end1",false] remoteExec ["BIS_fnc_endMission",owner _playerUnit];
	};
};