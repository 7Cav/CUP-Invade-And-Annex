params ["_vehicle"];

if !(isServer) exitWith {};

[_vehicle,
    {
    [_vehicle, 0] call ace_cargo_fnc_setSpace; //Sets cargo space
    [_vehicle, 20] call ace_cargo_fnc_setSize; //Sets cargo size
    [_vehicle, 1, "ACE_Wheel", true] call ace_repair_fnc_addSpareParts; //Adds spare wheel
    _vehicle setPlateNumber "1/7 Cav"; //Set plate number

    clearWeaponCargoGlobal _vehicle;
    clearMagazineCargoGlobal _vehicle;
    clearItemCargoGlobal _vehicle;
    clearBackpackCargoGlobal _vehicle;

    }
] call vehicle_fnc_respawnVehicleInitialize;

[_vehicle, 60] call vehicle_fnc_respawnVehicleWhenKilled;

[_vehicle, 200, 120] call vehicle_fnc_respawnVehicleWhenAbandoned;
