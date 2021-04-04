
// Atlas 4

private _state = param [0, "", [""]];

if (_state == "init") then {

    call fnc_arsenalLogistics;

    player setvariable ["ACE_IsEngineer", 2];

};

if (_state == "respawn") then {
    
    player setvariable ["ACE_IsEngineer", 2];
    
};
