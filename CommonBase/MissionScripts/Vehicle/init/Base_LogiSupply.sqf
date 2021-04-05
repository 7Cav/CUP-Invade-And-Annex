[_this select 0, {    
    [(_this select 0)] remoteExec ["CLIENT_InitializeSupplyModule", 0, true];
    [(_this select 0)] call SERVER_CurateEditableObjects;
    [(_this select 0), 80] call ace_cargo_fnc_setSize;
}] call vehicle_fnc_respawnVehicleInitialize;
[_this select 0, 420] call vehicle_fnc_respawnVehicleWhenKilled;
[_this select 0, 50, 900] call vehicle_fnc_respawnVehicleWhenAbandoned;