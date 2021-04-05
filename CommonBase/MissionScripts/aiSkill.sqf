params ["_unit"];

private _skill = 0;

switch (typeOf _unit) do
{	
	case (redfor_commando_deploymentData select 0) : {_skill = 1;};
	case (redfor_sniper_deploymentData select 0) : {_skill = 1;};
	default {_skill = redforSkill;};
};

_unit setSkill ["aimingspeed",     _skill];
_unit setSkill ["aimingaccuracy",  _skill];
_unit setSkill ["aimingshake",     _skill];
_unit setSkill ["spottime",        1];
_unit setSkill ["spotdistance",    1];
_unit setSkill ["commanding",      1];
_unit setSkill ["general",         1];