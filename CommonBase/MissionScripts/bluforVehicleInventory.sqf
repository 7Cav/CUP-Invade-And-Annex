params ["_unit"];

clearweaponcargoGlobal _unit;
clearmagazinecargoGlobal _unit;
clearitemcargoGlobal _unit;
clearbackpackcargoGlobal _unit;	

_unit addItemCargoGlobal ["ToolKit",1];

if ((typeOf _unit) in blufor_vehicle_baseLogistics_classes) then
{
	[_unit] execVM "MissionScripts\arsenal.sqf";		
	
	while {alive _unit} do
	{
		_unit setAmmoCargo 1;		
		_unit setRepairCargo 1;		
		_unit setFuelCargo 1;
	
		_unit setFuel 1;	
		
		sleep 60;
	};	
};

if ((typeOf _unit) in blufor_crate_supply_classes) then
{	
	[_unit] execVM "MissionScripts\arsenal.sqf";		
	
	while {alive _unit} do
	{
		_unit setAmmoCargo 1;		
		_unit setRepairCargo 1;		
		_unit setFuelCargo 1;
	
		_unit setFuel 1;	
		
		sleep 60;
	};	
};

if ((typeOf _unit) in blufor_vehicle_medical_classes) then
{	
	_unit addItemCargoGlobal ["FirstAidKit",100];
};