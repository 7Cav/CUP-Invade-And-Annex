
FormattedAttendanceList = [];
publicVariable "FormattedAttendanceList";

private _attendanceData = AttendanceTrackingData select 1;
private _timeTrackingList = _attendanceData select 1;

if (count _timeTrackingList > 0) then
{
	for [{_i = 0}, {_i < 300}, {_i = _i + 1}] do
	{
		if (_i <= ((count _timeTrackingList) - 1)) then
		{
			_totalMinutes = (_timeTrackingList select _i) select 1;
			_hours = floor(_totalMinutes / 60);
			_hoursString = "";
			if (_hours < 10) then
			{
				_hoursString = "0" + str(_hours) + "h";
			}
			else
			{
				_hoursString = str(_hours) + "h";
			};
			
			_minutes = _totalMinutes % 60;
			_minutesString = "";
			if (_minutes < 10) then
			{
				_minutesString = "0" + str(_minutes) + "m";
			}
			else
			{
				_minutesString = str(_minutes) + "m";
			};
			FormattedAttendanceList pushBack (((_timeTrackingList select _i) select 0) + " - " + _hoursString + _minutesString);
		}
		else
		{
			FormattedAttendanceList pushBack " - ";
		}		
	};
};

publicVariable "FormattedAttendanceList";

while {true} do 
{	
	if (ActivateNewTracking) then
	{
		AttendanceTrackingData = [true,[[],[]]];
		ActivateNewTracking = false;
		AttendanceTrackingActive = true;
		
		profileNamespace setVariable ["SavedAttendanceTrackingData", AttendanceTrackingData];
		saveProfileNamespace;
	};
	
	if (DeactivateCurrentTracking) then
	{		
		DeactivateCurrentTracking = false;
		AttendanceTrackingActive = false;		
		AttendanceTrackingData set [0, false];
		
		profileNamespace setVariable ["SavedAttendanceTrackingData", AttendanceTrackingData];
		saveProfileNamespace;
	};

	if (AttendanceTrackingActive) then
	{
		{		
			private _attendanceData = AttendanceTrackingData select 1;
			_idList = _attendanceData select 0;
			
			_playerId = getPlayerUID _x;
			
			if (_playerId in _idList) then 
			{
				_foundIndex = _idList find _playerId;
				
				_attendanceTimer = ((_attendanceData select 1) select _foundIndex) select 1;
				_attendanceTimer = _attendanceTimer + 1;
				
				((_attendanceData select 1) select _foundIndex) set [1, _attendanceTimer];
			}
			else
			{
				(_attendanceData select 0) pushBack _playerId;
				(_attendanceData select 1) pushBack [name _x, 0];
			};
			
		} forEach allPlayers;
		
		AttendanceTrackingData set [0, true];		
		
		profileNamespace setVariable ["SavedAttendanceTrackingData", AttendanceTrackingData];
		saveProfileNamespace;
		
		private _attendanceData = AttendanceTrackingData select 1;			
		private _timeTrackingList = _attendanceData select 1;
		FormattedAttendanceList = [];
		
		if (count _timeTrackingList > 0) then
		{
			for [{_i = 0}, {_i < 300}, {_i = _i + 1}] do
			{
				if (_i <= ((count _timeTrackingList) - 1)) then
				{
					_totalMinutes = (_timeTrackingList select _i) select 1;
					_hours = floor(_totalMinutes / 60);
					_hoursString = "";
					if (_hours < 10) then
					{
						_hoursString = "0" + str(_hours) + "h";
					}
					else
					{
						_hoursString = str(_hours) + "h";
					};
					
					_minutes = _totalMinutes % 60;
					_minutesString = "";
					if (_minutes < 10) then
					{
						_minutesString = "0" + str(_minutes) + "m";
					}
					else
					{
						_minutesString = str(_minutes) + "m";
					};
					FormattedAttendanceList pushBack (((_timeTrackingList select _i) select 0) + " - " + _hoursString + _minutesString);
				}
				else
				{
					FormattedAttendanceList pushBack " - ";
				}		
			};
		};

		publicVariable "FormattedAttendanceList";		
	}	
	else
	{
		AttendanceTrackingData set [0, false];
		
		profileNamespace setVariable ["SavedAttendanceTrackingData", AttendanceTrackingData];
		saveProfileNamespace;
	};	
	
	sleep 60;
};