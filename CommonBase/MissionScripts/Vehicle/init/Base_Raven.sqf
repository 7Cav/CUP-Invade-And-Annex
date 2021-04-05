params ["_vehicle"];

if !(isServer) exitWith {};

[_vehicle,
	{
	params ["_vehicle"];
	_vehicle setvariable ["ace_medical_isMedicalVehicle", true, true];
	[_vehicle] call ace_fastroping_fnc_equipFRIES; //Equips heli w/ fries
    [_vehicle, 4] call ace_cargo_fnc_setSpace; //Sets cargo space
    [_vehicle, -1] call ace_cargo_fnc_setSize; //Sets cargo size

    clearWeaponCargoGlobal _vehicle;
    clearMagazineCargoGlobal _vehicle;
    clearItemCargoGlobal _vehicle;
    clearBackpackCargoGlobal _vehicle;

    private _inventory = [ //Defines vehicle inventory
        ["ACE_personalAidKit", 16],
        ["ACE_surgicalKit", 4],
        ["ACE_salineIV", 32],
        ["ACE_morphine", 16],
        ["ACE_epinephrine", 16],
        ["ACE_elasticBandage", 128],
        ["ACE_quikclot", 128],
        ["ACE_CableTie", 16],
        ["ACE_tourniquet", 16],
        ["ACE_splint", 32],
        ["ACE_bodyBag", 8],
        ["ACE_EarPlugs", 8],
        ["ACE_rope36", 4],
        ["ToolKit", 1],
        ["rhs_weap_M136_hp", 2],
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

	}
] call vehicle_fnc_respawnVehicleInitialize;

[_vehicle, 60] call vehicle_fnc_respawnVehicleWhenKilled;

[_vehicle, 300] call vehicle_fnc_respawnVehicleWhenAbandoned;