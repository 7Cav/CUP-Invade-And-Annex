params ["_vehicle"];

if !(isServer) exitWith {};

[_vehicle,
    {
    params ["_vehicle"];
	_vehicle addWeaponTurret ["FIR_SUU25", [0]];
	_vehicle addWeaponTurret ["FIR_SUU25", [-1]];
    for "_i" from 1 to 4 do {_vehicle addMagazineTurret ["FIR_SUU25_P_8rnd_M",[0]]}; //Adds n magazines
    for "_i" from 1 to 4 do {_vehicle addMagazineTurret ["FIR_SUU25_P_8rnd_M",[-1]]}; //Adds n magazines
    _vehicle loadMagazine [[0], "FIR_SUU25", "FIR_SUU25_P_8rnd_M"]; //Loads turret magazine
    [_vehicle, 100] call ace_cargo_fnc_setSpace; //Sets cargo space
    [_vehicle, -1] call ace_cargo_fnc_setSize; //Sets cargo size

    clearWeaponCargoGlobal _vehicle;
    clearMagazineCargoGlobal _vehicle;
    clearItemCargoGlobal _vehicle;
    clearBackpackCargoGlobal _vehicle;

    private _inventory = [ //Defines vehicle inventory
        ["B_Parachute", 50],
        ["ToolKit", 1]
    ];

    {
        _x params ["_ammo", "_amount"];
        _vehicle addItemCargoGlobal [_ammo, _amount];
    } forEach _inventory; //Adds vehicle inventory

    }
] call vehicle_fnc_respawnVehicleInitialize;

[_vehicle, 60] call vehicle_fnc_respawnVehicleWhenKilled;

[_vehicle, 1000, 600] call vehicle_fnc_respawnVehicleWhenAbandoned;
