
// Armor crewman

private _state = param [0, "", [""]];

if (_state == "init") then
{
    call fnc_arsenalTanker;
    
    player setvariable ["ACE_IsEngineer", 1];

};

if (_state == "respawn") then {

    player setvariable ["ACE_IsEngineer", 1];

};