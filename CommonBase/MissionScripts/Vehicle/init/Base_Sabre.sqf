params ["_vehicle"];

if !(isServer) exitWith {};

[_vehicle,
    {
    params ["_vehicle"];
    _vehicle addMagazine "rhs_mag_M1147"; //Adds HE_Frag
    for "_i" from 1 to 1 do {_vehicle addMagazine "rhs_mag_200rnd_127x99_SLAP_mag_Tracer_Red"}; //Adds n magazines
    [_vehicle, 4] call ace_cargo_fnc_setSpace; //Sets cargo space
    [_vehicle, -1] call ace_cargo_fnc_setSize; //Sets cargo size
    ["ACE_Track", _vehicle, 4] call ace_cargo_fnc_removeCargoItem;
    for "_i" from 1 to 2 do {
    ["ACE_Track", _vehicle, true] call ace_cargo_fnc_loadItem;
    };
    _vehicle setPlateNumber "1/7 Cav"; //Set plate number

	[
	_vehicle,
	[],
	["DUKE_Hide",1,"IFF_Panels_Hide",0,"Miles_Hide",1]
	] call BIS_fnc_initVehicle; //Handles vehicle appearnence

    clearWeaponCargoGlobal _vehicle;
    clearMagazineCargoGlobal _vehicle;
    clearItemCargoGlobal _vehicle;
    clearBackpackCargoGlobal _vehicle;

    private _inventory = [ //Defines vehicle inventory
        ["rhs_weap_M136_hp", 4],
        ["ACE_quikclot", 32],
        ["ACE_tourniquet", 8],
        ["ACE_splint", 8],
        ["ACE_EarPlugs", 4],
        ["ToolKit", 2],
        ["rhs_mag_30Rnd_556x45_M855A1_Stanag", 32]

    ];

    {
        _x params ["_ammo", "_amount"];
        _vehicle addItemCargoGlobal [_ammo, _amount];
    } forEach _inventory; //Adds vehicle inventory

    }
] call vehicle_fnc_respawnVehicleInitialize;

[_vehicle, 60] call vehicle_fnc_respawnVehicleWhenKilled;

[_vehicle, 1000, 600] call vehicle_fnc_respawnVehicleWhenAbandoned;
