params ["_unit"];

private _skill = 0;

_commandosDeploymentData = redfor_commandos_level_1_deploymentData;
_snipersDeploymentData = redfor_snipers_level_1_deploymentData;

if (forceLevel == 1) then
{
	_commandosDeploymentData = redfor_commandos_level_1_deploymentData;
	_snipersDeploymentData = redfor_snipers_level_1_deploymentData;
};

if (forceLevel == 2) then
{
	_commandosDeploymentData = redfor_commandos_level_2_deploymentData;
	_snipersDeploymentData = redfor_snipers_level_2_deploymentData;
};

if (forceLevel == 3) then
{
	_commandosDeploymentData = redfor_commandos_level_3_deploymentData;
	_snipersDeploymentData = redfor_snipers_level_3_deploymentData;
};

switch (typeOf _unit) do
{	
	case ((_commandosDeploymentData select 0) select 0) : {_skill = 1;};
	case ((_snipersDeploymentData select 0) select 0) : {_skill = 1;};
	default {_skill = redforSkill * forceLevel / 3;};
};

_unit setSkill ["aimingspeed",     _skill];
_unit setSkill ["aimingaccuracy",  _skill];
_unit setSkill ["aimingshake",     _skill];
_unit setSkill ["spottime",        1];
_unit setSkill ["spotdistance",    1];
_unit setSkill ["commanding",      1];
_unit setSkill ["general",         1];