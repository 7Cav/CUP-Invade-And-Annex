params ["_veh", objNull, [objNull]];

private _timer = 600;

while {(alive _veh) && (alive (gunner _veh))} do
{	
	if (_timer == 300) then
	{
		_veh setVehicleAmmo 1;		
	};	
	
	if (_timer == 0) then
	{
		_veh setVehicleAmmo 1;
		_veh setDamage 0;
		_veh setFuel 1;		
		
		_timer = 600;
	};	
	
	_timer = _timer - 1;
	
	sleep 1;
};