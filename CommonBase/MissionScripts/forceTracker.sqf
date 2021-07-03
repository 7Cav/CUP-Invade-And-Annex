fnc_drawIcons = {
	_playerVehicles = [];
	{
		_player = _x;
		
		if (alive _player) then
		{
			_iconType = "";
			if (vehicle _player == _player) then
			{
				_iconType = getText (configFile >> "CfgVehicles" >> typeOf _player >> "icon");
			}
			else
			{
				_iconType = getText (configFile >> "CfgVehicles" >> typeOf (vehicle _player) >> "icon");
			};		
			_color = [0,0,1,1];
			_pos = getPos _player;
			_iconSize = 22;
			_dir = 0;
			if (vehicle _player == _player) then
			{
				_dir = getDir _player;
			}
			else
			{
				_dir = getDir (vehicle _player);
			};		
			_text = "";
			if ((vehicle _player) == _player) then
			{
				_text = name _x;
				
				_shadow = 1;
				_textSize = 0.05;
				_textFont = "puristaMedium";
				_textOffset = "right";
			
				(_this select 0) drawIcon [
					_iconType,
					_color,
					_pos,
					_iconSize,
					_iconSize,
					_dir,
					_text,
					_shadow,
					_textSize,
					_textFont,
					_textOffset
				];
			}
			else
			{			
				if (not ((vehicle _player) in _playerVehicles)) then
				{
					_playerVehicles pushBack (vehicle _player);
				
					_text = getText (configFile >> "CfgVehicles" >> typeOf (vehicle _player) >> "displayName");
					_text = _text + " (";
					{
						if (alive _x) then
						{
							_text = _text + " " + (name _x);
						};
					} forEach crew (vehicle _player);
					_text = _text + " )";
					
					_shadow = 1;
					_textSize = 0.05;
					_textFont = "puristaMedium";
					_textOffset = "right";
				
					(_this select 0) drawIcon [
						_iconType,
						_color,
						_pos,
						_iconSize,
						_iconSize,
						_dir,
						_text,
						_shadow,
						_textSize,
						_textFont,
						_textOffset
					];
				};				
			};			
		};		
	} forEach allPlayers;
};

waitUntil {!(isNull (findDisplay 12))};
clientEhDrawMap = ((findDisplay 12) displayCtrl 51) ctrlAddEventHandler ["Draw",fnc_drawIcons];