_mortars = _this select 0;

while {{alive gunner _x} count _mortars > 0} do
{
	_targetList = [];
	
	{
		if (side _x == west) then
		{
			if ((east knowsAbout _x) >= 1.5) then 
		{
				_targetList pushBack _x;
			};
		};			
	} forEach allUnits;

	if (count _targetList > 0) then
	{
		_target = selectRandom _targetList;
		_position = getPosWorld _target;
		
		_shellCount = ceil((count allPlayers) / 10);
		
		sleep 120;

		for "_i" from 1 to _shellCount do
		{
			{
				_posX = (_position select 0) + 50 - floor(random 100);
				_posY = (_position select 1) + 50 - floor(random 100);
				
				_x doArtilleryFire [[_posX,_posY],"8Rnd_82mm_Mo_shells",1];

				sleep (floor(random 2))+1;
				
			} forEach _mortars;

			sleep 3;
		};
				
		_randSleep = 600 + floor(random 300);
		sleep _randSleep;
	};

	sleep 5;
};