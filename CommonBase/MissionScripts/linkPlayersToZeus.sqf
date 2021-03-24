while { true} do
{
	{
		_player = _x;
		{
			_x addCuratorEditableObjects [[_player],true];
			_x addCuratorEditableObjects [[vehicle _player],true];
		} forEach allCurators;		
	} forEach allPlayers;
	
	sleep 10;
};