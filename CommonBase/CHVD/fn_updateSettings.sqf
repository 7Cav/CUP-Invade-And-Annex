params [["_updateType", 0, [0]], ["_inUAV", (UAVControl (getConnectedUAV player) select 1 != ""), [true]]];

if (not CHVD_enabled) exitWith {};

private _settings = [_updateType, _inUAV] call CHVD_fnc_getSettings;
if (count _settings == 0) exitWith {};

setViewDistance (_settings select 0);
setObjectViewDistance (_settings select 1);

if (_updateType == 0) then { [_inUAV] call CHVD_fnc_updateTerrain };