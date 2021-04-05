params ["_vehicle"];

if !(isServer) exitWith {};

[_vehicle,
    {
    params ["_vehicle"];    
    _vehicle removeMagazines "RHS_48Rnd_40mm_MK19_M1001"; //Removes canister ammo from Mk19 variants
    _vehicle removeMagazines "rhs_mag_100rnd_127x99_mag_Tracer_Red"; //Removes default magzines
    for "_i" from 1 to 8 do {_vehicle addMagazine "rhs_mag_200rnd_127x99_mag_Tracer_Red"}; //Adds n magazines
    _vehicle loadMagazine [[0], "RHS_M2", "rhs_mag_200rnd_127x99_mag_Tracer_Red"]; //Loads turret magazine
    [_vehicle, 6] call ace_cargo_fnc_setSpace; //Sets cargo space
    [_vehicle, 80] call ace_cargo_fnc_setSize; //Sets cargo size
    ["ACE_Wheel", _vehicle, 4] call ace_cargo_fnc_removeCargoItem;
    for "_i" from 1 to 2 do {
        ["ACE_Wheel", _vehicle, true] call ace_cargo_fnc_loadItem;
    };
    _vehicle setPlateNumber "1/7 Cav"; //Set plate number

	[
	_vehicle,
	[], 
	["hide_rhino",1,"hide_ogpkover",0,"hide_ogpknet",1,"hide_ogpkbust",0,"DUKE_Hide",1]
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
        ["ToolKit", 1],
        ["ACE_Clacker", 1],
        ["SatchelCharge_Remote_Mag", 1],
        ["rhs_mag_30Rnd_556x45_M855A1_Stanag", 32],
        ["rhsusf_200Rnd_556x45_mixed_soft_pouch", 8],
        ["rhsusf_100Rnd_762x51_m62_tracer", 8],
        ["rhs_mag_M433_HEDP", 12],
        ["rhs_mag_m713_Red", 4],
        ["ACE_HuntIR_M203", 2],
        ["ACE_40mm_Flare_ir", 4]
    ];

    {
        _x params ["_ammo", "_amount"];
        _vehicle addItemCargoGlobal [_ammo, _amount];
    } forEach _inventory; //Adds vehicle inventory

    for "_i" from 1 to 1 do {
        _crate = "Box_NATO_Ammo_F" createVehicle getMarkerPos "respawn_west";
    
        clearWeaponCargoGlobal _crate;
        clearMagazineCargoGlobal _crate;
        clearItemCargoGlobal _crate;
        clearBackpackCargoGlobal _crate;

        _crate addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red", 24]; 
        _crate addMagazineCargoGlobal ["rhsusf_200rnd_556x45_mixed_soft_pouch_coyote", 10]; 
        _crate addMagazineCargoGlobal ["rhsusf_100Rnd_762x51_m62_tracer", 10]; 
        _crate addMagazineCargoGlobal ["rhs_mag_m67", 10]; 
        _crate addMagazineCargoGlobal ["SmokeShell", 10]; 
        _crate addMagazineCargoGlobal ["SmokeShellRed", 10]; 
        _crate addMagazineCargoGlobal ["SmokeShellBlue", 10];
        _crate addMagazineCargoGlobal ["rhs_mag_M441_HE", 20]; 
        _crate addMagazineCargoGlobal ["rhs_mag_m714_White", 10];
        _crate addMagazineCargoGlobal ["rhs_mag_m713_Red", 10];
        
        [_crate, _vehicle, true] call ace_cargo_fnc_loadItem
    }

    }
] call vehicle_fnc_respawnVehicleInitialize;

[_vehicle, 60] call vehicle_fnc_respawnVehicleWhenKilled;

[_vehicle, 1000, 600] call vehicle_fnc_respawnVehicleWhenAbandoned;
