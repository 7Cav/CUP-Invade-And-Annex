params ["_updateType", ["_inUAV", (UAVControl (getConnectedUAV player) select 1 != ""), [true]]];

private _settings = [];

if (_inUAV) then {
	switch (true) do {
		case (getConnectedUAV player isKindOf "LandVehicle" || getConnectedUAV player isKindOf "Ship"): {
			if (_updateType == 1 || _updateType == 0 || _updateType == 3) then {
				_settings set [0,  CHVD_car];
			};
			if (_updateType == 2 || _updateType == 0 || _updateType == 3) then {
				_settings set [1,  [CHVD_carObj,100]];
			};
		};
		case (getConnectedUAV player isKindOf "Man"): {
			if (_updateType == 1 || _updateType == 0 || _updateType == 3) then {
				_settings set [0,  CHVD_foot];
			};
			if (_updateType == 2 || _updateType == 0 || _updateType == 3) then {
				_settings set [1,  [CHVD_footObj,100]];
			};
		};
		default {
			if (_updateType == 1 || _updateType == 0 || _updateType == 3) then {
				_settings set [0,  CHVD_air];
			};
			if (_updateType == 2 || _updateType == 0 || _updateType == 3) then {
				_settings set [1,  [CHVD_airObj,100]];
			};
		};
	};
} else {
	switch (true) do {
		case (vehicle player isKindOf "LandVehicle" || vehicle player isKindOf "Ship"): {
			if (_updateType == 1 || _updateType == 0 || _updateType == 3) then {
				_settings set [0,  CHVD_car];
			};
			if (_updateType == 2 || _updateType == 0 || _updateType == 3) then {
				_settings set [1,  [CHVD_carObj,100]];
			};
		};
		case (vehicle player isKindOf "Air"): {
			if (_updateType == 1 || _updateType == 0 || _updateType == 3) then {
				_settings set [0,  CHVD_air];
			};
			if (_updateType == 2 || _updateType == 0 || _updateType == 3) then {
				_settings set [1,  [CHVD_airObj,100]];
			};
		};
		default {
			if (_updateType == 1 || _updateType == 0 || _updateType == 3) then {
				_settings set [0,  CHVD_foot];
			};
			if (_updateType == 2 || _updateType == 0 || _updateType == 3) then {
				_settings set [1,  [CHVD_footObj,100]];
			};
		};
	};
};

_settings