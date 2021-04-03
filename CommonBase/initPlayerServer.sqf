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

if ((getPlayerUID _playerUnit) in zeusGUIDs) then
{		
	_zeusGroup = createGroup sideLogic;
	_curator = _zeusGroup createUnit ["ModuleCurator_F", [0, 0, 0], [], 0, "NONE"];		
	_playerUnit assignCurator _curator;
	_curator setVariable ["Addons",3,true];
};