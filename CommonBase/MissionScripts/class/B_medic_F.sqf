
// Atlas 1/2

private _state = param [0, "", [""]];

if (_state == "init") then {

    call scripts_fnc_arsenalMedic;

    player setvariable ["ace_isMedic", 2];

};

if (_state == "respawn") then {

    player setvariable ["ace_isMedic", 2];

};