params ["_unit"];

clearweaponcargoGlobal _unit;
clearmagazinecargoGlobal _unit;
clearitemcargoGlobal _unit;
clearbackpackcargoGlobal _unit;	

if (((typeOf _unit) in blufor_vehicle_forwardLogistics_classes)
	or ((typeOf _unit) in blufor_vehicle_baseLogistics_classes)) then
{
	[_unit, 30] call ace_cargo_fnc_setSpace;
	
	_unit setVariable ["ace_isRepairVehicle",1,true];						
	[_unit,10000] call ace_refuel_fnc_makeSource;				
	[_unit,10000] call ace_rearm_fnc_makeSource;	
	
	while {alive _unit} do
	{
		_items = _unit getVariable ["ACE_cargo_loaded", []];		

		_wheelCount = 0;			
		
		{
			if (_x == "ACE_Wheel") then
			{
				_wheelCount = _wheelCount + 1;					
			};				
		} forEach _items;
	
		if (_wheelCount < 4) then
		{
			["ACE_Wheel", _unit] call ace_cargo_fnc_loadItem;
		};

		_trackCount = 0;			
		
		{
			if (_x == "ACE_Track") then
			{
				_trackCount = _wheelCount + 1;					
			};				
		} forEach _items;
	
		if (_trackCount < 4) then
		{
			["ACE_Track", _unit] call ace_cargo_fnc_loadItem;
		};			
		
		[_unit,10000] call ace_rearm_fnc_makeSource;
		[_unit,10000] call ace_refuel_fnc_makeSource;
		_unit setFuel 1;
		
		sleep 60;
	};	
};

if ((typeOf _unit) in blufor_crate_supply_classes) then
{	
	[_unit, 10] call ace_cargo_fnc_setSize;
};

if ((typeOf _unit) in blufor_crate_medical_classes) then
{
	while {alive _unit}	do
	{
		_unit addItemCargoGlobal ["ACE_fieldDressing",200];
		_unit addItemCargoGlobal ["ACE_bloodIV",100];
		_unit addItemCargoGlobal ["ACE_epinephrine",200];
		_unit addItemCargoGlobal ["ACE_morphine",200];			
	
		sleep 300;
	};	
};

if (((typeOf _unit) in blufor_vehicle_level_1_classes)
	or ((typeOf _unit) in blufor_vehicle_level_2_classes)
	or ((typeOf _unit) in blufor_vehicle_level_3_classes)
	or ((typeOf _unit) in blufor_vehicle_level_4_classes)
	or ((typeOf _unit) in blufor_vehicle_level_5_classes)
	or ((typeOf _unit) in blufor_vehicle_forwardLogistics_classes)
	or ((typeOf _unit) in blufor_vehicle_medical_classes)) then
{
	[_unit, 50] call ace_cargo_fnc_setSize;
};

if ((typeOf _unit) in blufor_vehicle_vehicleTransportRotaryWing_classes) then
{
	[_unit, 50] call ace_cargo_fnc_setSpace;
};

if ((typeOf _unit) in blufor_vehicle_vehicleTransportFixedWing_classes) then
{
	[_unit, 100] call ace_cargo_fnc_setSpace;
};

if ((typeOf _unit) in blufor_vehicle_transportRotaryWing_classes) then
{
	[_unit, 10] call ace_cargo_fnc_setSpace;
};

if ((typeOf _unit) in blufor_vehicle_transportFixedWing_classes) then
{
	[_unit, 10] call ace_cargo_fnc_setSpace;
};