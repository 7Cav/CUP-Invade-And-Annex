// Currently  Vanilla Atlas 4 Flat Bed

[_this select 0] call vehicle_fnc_respawnVehicleInitialize;
[_this select 0, 60] call vehicle_fnc_respawnVehicleWhenKilled;
[_this select 0, 1500, 1800] call vehicle_fnc_respawnVehicleWhenAbandoned;