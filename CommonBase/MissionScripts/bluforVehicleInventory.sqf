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
        ["ACE_40mm_Flare_ir", 4]
    ];

    {
        _x params ["_ammo", "_amount"];
        _unit addItemCargoGlobal [_ammo, _amount];
    } forEach _inventory; //Adds vehicle inventory
};

if ((typeOf _unit) in blufor_vehicle_transportFixedWing_classes) then
{
	[_unit, 10] call ace_cargo_fnc_setSpace;
	
	private _inventory = [ //Defines vehicle inventory
        ["B_Parachute", 50],
        ["ToolKit", 1]
    ];

    {
        _x params ["_ammo", "_amount"];
        _unit addItemCargoGlobal [_ammo, _amount];
    } forEach _inventory; //Adds vehicle inventory
};

if ((typeOf _unit) in blufor_vehicle_level_1_classes) then
{
	_unit setPlateNumber "1/7 Cav";
	
	private _inventory = [ //Defines vehicle inventory
        ["rhs_weap_M136_hp", 4],
        ["ACE_quikclot", 32],
        ["ACE_tourniquet", 8],
        ["ACE_splint", 8],
        ["ACE_EarPlugs", 4],
        ["ToolKit", 1],
        ["ACE_Clacker", 1],
        ["SatchelCharge_Remote_Mag", 1],
        ["rhs_mag_30Rnd_556x45_M855A1_Stanag", 32],
        ["rhsusf_200Rnd_556x45_mixed_soft_pouch", 8],
        ["rhsusf_100Rnd_762x51_m62_tracer", 8],
        ["rhs_mag_M433_HEDP", 12],
        ["rhs_mag_m713_Red", 4],        
        ["ACE_40mm_Flare_ir", 4]
    ];

    {
        _x params ["_ammo", "_amount"];
        _unit addItemCargoGlobal [_ammo, _amount];
    } forEach _inventory; //Adds vehicle inventory
};

if ((typeOf _unit) in blufor_vehicle_level_2_classes) then
{
	_unit setPlateNumber "1/7 Cav";
	
	private _inventory = [ //Defines vehicle inventory
        ["rhs_weap_M136_hp", 4],
        ["ACE_quikclot", 32],
        ["ACE_tourniquet", 8],
        ["ACE_splint", 8],
        ["ACE_EarPlugs", 4],
        ["ToolKit", 1],
        ["ACE_Clacker", 1],
        ["SatchelCharge_Remote_Mag", 1],
        ["rhs_mag_30Rnd_556x45_M855A1_Stanag", 32],
        ["rhsusf_200Rnd_556x45_mixed_soft_pouch", 8],
        ["rhsusf_100Rnd_762x51_m62_tracer", 8],
        ["rhs_mag_M433_HEDP", 12],
        ["rhs_mag_m713_Red", 4],        
        ["ACE_40mm_Flare_ir", 4]
    ];

    {
        _x params ["_ammo", "_amount"];
        _unit addItemCargoGlobal [_ammo, _amount];
    } forEach _inventory; //Adds vehicle inventory
};

if ((typeOf _unit) in blufor_vehicle_level_3_classes) then
{
	_unit setPlateNumber "1/7 Cav";
	
	private _inventory = [ //Defines vehicle inventory        
        ["rhs_weap_M136_hp", 2],
        ["ACE_quikclot", 32],
        ["ACE_tourniquet", 8],
        ["ACE_splint", 8],
        ["ACE_EarPlugs", 4],
        ["ToolKit", 1],
        ["ACE_Clacker", 1],
        ["SatchelCharge_Remote_Mag", 1],
        ["rhs_mag_30Rnd_556x45_M855A1_Stanag", 32],
        ["rhsusf_200Rnd_556x45_mixed_soft_pouch", 8],
        ["rhsusf_100Rnd_762x51_m62_tracer", 8],
        ["rhs_mag_M433_HEDP", 12],
        ["rhs_mag_m713_Red", 4],        
        ["ACE_40mm_Flare_ir", 4]
    ];

    {
        _x params ["_ammo", "_amount"];
        _unit addItemCargoGlobal [_ammo, _amount];
    } forEach _inventory; //Adds vehicle inventory
};

if ((typeOf _unit) in blufor_vehicle_level_4_classes) then
{
	_unit setPlateNumber "1/7 Cav";
	
	private _inventory = [ //Defines vehicle inventory        
        ["rhs_weap_M136_hp", 2],
        ["ACE_quikclot", 32],
        ["ACE_tourniquet", 8],
        ["ACE_splint", 8],
        ["ACE_EarPlugs", 4],
        ["ToolKit", 1],
        ["ACE_Clacker", 1],
        ["SatchelCharge_Remote_Mag", 1],
        ["rhs_mag_30Rnd_556x45_M855A1_Stanag", 32],
        ["rhsusf_200Rnd_556x45_mixed_soft_pouch", 8],
        ["rhsusf_100Rnd_762x51_m62_tracer", 8],
        ["rhs_mag_M433_HEDP", 12],
        ["rhs_mag_m713_Red", 4],        
        ["ACE_40mm_Flare_ir", 4]
    ];

    {
        _x params ["_ammo", "_amount"];
        _unit addItemCargoGlobal [_ammo, _amount];
    } forEach _inventory; //Adds vehicle inventory
};

if ((typeOf _unit) in blufor_vehicle_level_5_classes) then
{
	_unit setPlateNumber "1/7 Cav";
	
	private _inventory = [ //Defines vehicle inventory
        ["rhs_weap_M136_hp", 4],
        ["ACE_quikclot", 32],
        ["ACE_tourniquet", 8],
        ["ACE_splint", 8],
        ["ACE_EarPlugs", 4],
        ["ToolKit", 2],
        ["rhs_mag_30Rnd_556x45_M855A1_Stanag", 32]

    ];

    {
        _x params ["_ammo", "_amount"];
        _unit addItemCargoGlobal [_ammo, _amount];
    } forEach _inventory; //Adds vehicle inventory	
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