_page = _this select 3;

_startIndex = 30 * (_page - 1);
_endIndex = _startIndex + 30;

_outputString = "";

if (count FormattedAttendanceList > 0) then
{
	for [{_i = _startIndex},{_i < _endIndex},{_i = _i + 1}] do 
	{
		_outputString = _outputString + str(_i + 1) + ". " + (FormattedAttendanceList select _i) + "\n";
	};

	hint _outputString;
}
else
{
	hint "-";
};