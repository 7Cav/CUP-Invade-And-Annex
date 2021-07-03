_unit = _this select 0;

if ((typeOf _unit) in blufor_vehicle_medical_classes) then
{
	_unit addEventHandler ["GetIn",
	{					
		if ((typeof (_this select 2) != "B_medic_F") and ((_this select 1) != "cargo")) then {
			(_this select 2) action ["getout", _this select 0];				
		};			
	}];
	_unit addEventHandler ["SeatSwitched",
	{			
		if (typeof (_this select 2) != "B_medic_F") then {
			_crew = _this select 1;
			if (assignedVehicleRole _crew select 0 != "Cargo") then {
				_crew action ["getout", _this select 0];		
			};
		};
		
		if (typeof (_this select 2) != "B_medic_F") then {
			_crew = _this select 2;
			if (assignedVehicleRole _crew select 0 != "Cargo") then {
				_crew action ["getout", _this select 0];		
			};
		};			
	}];
};

if ((typeOf _unit) in blufor_vehicle_attackRotaryWing_classes) then
{
	_unit addEventHandler ["GetIn",
	{			
		_unit = _this select 2;
		_seat = _this select 1;
		_veh = _this select 0;			

		if (((roleDescription _unit) find "Attack Rotary Wing" == -1) and (_seat != "Cargo")) then
		{
			_unit action ["getout", _veh];	
		};			
	}];	
	_unit addEventHandler ["SeatSwitched",
	{		
		_veh = _this select 0;
		_seat1 = _this select 1;
		_seat2 = _this select 1;
		
		if ((roleDescription _seat1) find "Attack Rotary Wing" == -1) then
		{
			if (assignedVehicleRole _seat1 select 0 != "Cargo") then
			{
				_seat1 action ["getout",_veh];
			};
			if (assignedVehicleRole _seat2 select 0 != "Cargo") then
			{
				_seat2 action ["getout",_veh];
			};
		};			
	}];
};

if ((typeOf _unit) in blufor_vehicle_attackFixedWing_classes) then
{
	_unit addEventHandler ["GetIn",
	{			
		_unit = _this select 2;
		_seat = _this select 1;
		_veh = _this select 0;			

		if (((roleDescription _unit) find "Attack Fixed Wing" == -1) and (_seat != "Cargo")) then
		{
			_unit action ["getout", _veh];	
		};			
	}];	
	_unit addEventHandler ["SeatSwitched",
	{		
		_veh = _this select 0;
		_seat1 = _this select 1;
		_seat2 = _this select 1;
		
		if ((roleDescription _seat1) find "Attack Fixed Wing" == -1) then
		{
			if (assignedVehicleRole _seat1 select 0 != "Cargo") then
			{
				_seat1 action ["getout",_veh];
			};
			if (assignedVehicleRole _seat2 select 0 != "Cargo") then
			{
				_seat2 action ["getout",_veh];
			};
		};			
	}];
};

if ((typeOf _unit) in blufor_vehicle_transportRotaryWing_classes) then
{
	_unit addEventHandler ["GetIn",
	{
		_unit = _this select 2;
		_seat = _this select 1;
		_veh = _this select 0;

		if (((roleDescription _unit) find "Transport Rotary Wing" == -1) and (_seat == "Driver")) then
		{
			_unit action ["getout", _veh];	
		};		

		if ((roleDescription _unit) find "Transport Rotary Wing" == -1) then
		{
			if ((assignedVehicleRole _unit) select 0 == "turret") then
			{
				if (((assignedVehicleRole _unit) select 1) select 0 == 0) then
				{
					_unit action ["getout", _veh];	
				};
			};
		};
	}];	
	_unit addEventHandler ["SeatSwitched",
	{		
		_veh = _this select 0;
		_seat1 = _this select 1;
		_seat2 = _this select 1;
		
		if ((roleDescription _seat1) find "Transport Rotary Wing" == -1) then
		{
			if (assignedVehicleRole _seat1 select 0 == "Driver") then
			{
				_seat1 action ["getout",_veh];
			};
			if (assignedVehicleRole _seat2 select 0 == "Driver") then
			{
				_seat2 action ["getout",_veh];
			};
		};			
	}];
};

if ((typeOf _unit) in blufor_vehicle_baseLogistics_classes) then
{
	_unit addEventHandler ["GetIn",
	{					
		if ((typeof (_this select 2) != "B_Pilot_F") and (typeof (_this select 2) != "B_Helipilot_F") and ((_this select 1) != "cargo")) then {
			(_this select 2) action ["getout", _this select 0];				
		};			
	}];
	_unit addEventHandler ["SeatSwitched",
	{			
		if ((typeof (_this select 2) != "B_Pilot_F") and (typeof (_this select 2) != "B_Helipilot_F")) then {
			_crew = _this select 1;
			if (assignedVehicleRole _crew select 0 != "Cargo") then {
				_crew action ["getout", _this select 0];		
			};
		};
		
		if ((typeof (_this select 2) != "B_Pilot_F") and (typeof (_this select 2) != "B_Helipilot_F")) then {
			_crew = _this select 2;
			if (assignedVehicleRole _crew select 0 != "Cargo") then {
				_crew action ["getout", _this select 0];		
			};
		};			
	}];
};

if (((typeOf _unit) in blufor_vehicle_transportFixedWing_classes) 
	or ((typeOf _unit) in blufor_vehicle_vehicleTransportFixedWing_classes))then
{
	_unit addEventHandler ["GetIn",
	{			
		_unit = _this select 2;
		_seat = _this select 1;
		_veh = _this select 0;			

		if (((roleDescription _unit) find "Transport Fixed Wing" == -1) and (_seat != "Cargo")) then
		{
			_unit action ["getout", _veh];	
		};			
	}];	
	_unit addEventHandler ["SeatSwitched",
	{		
		_veh = _this select 0;
		_seat1 = _this select 1;
		_seat2 = _this select 1;
		
		if ((roleDescription _seat1) find "Transport Fixed Wing" == -1) then
		{
			if (assignedVehicleRole _seat1 select 0 != "Cargo") then
			{
				_seat1 action ["getout",_veh];
			};
			if (assignedVehicleRole _seat2 select 0 != "Cargo") then
			{
				_seat2 action ["getout",_veh];
			};
		};			
	}];
};