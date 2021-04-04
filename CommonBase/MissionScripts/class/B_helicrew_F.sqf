
// Heli crew

private _state = param [0, "", [""]];

if (_state == "init") then {

    call scripts_fnc_arsenalHeliCrew;

    player setvariable ["ACE_IsEngineer", 2];

};

if (_state == "respawn") then {

    player setvariable ["ACE_IsEngineer", 2];

};