params["_veh"];
					
[_veh, ["=PARACHUTE JUMP=",
					{
						_dir = getDir (_this select 0);
						(_this select 1) setDir _dir;
						(_this select 1) setPosASL (getPosASL (_this select 0)); 
						_parachuteAltitude = ((getPosASL (_this select 0)) select 2)-10;
						[(_this select 1), _parachuteAltitude] call bis_fnc_halo; 	
						sleep 0.1;
						(_this select 1) setVectorDir [sin _dir, cos _dir , 0];
					}, 
					nil,
					1.5,
					true,
					true,
					"",
					"((getPosASL _target) select 2) > 100"]] remoteExec ["addAction", 0, true];