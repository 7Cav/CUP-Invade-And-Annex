sectorList = [];

sectorRoadsList = [];

sectorObjectiveGenericAreaList = [];

sectorSpecificAAPositionsList = [];
sectorSpecificAVPositionsList = [];
sectorSpecificMortarPositionsList = [];
sectorSpecificSupplyPositionsList = [];
sectorSpecificHQPositionsList = [];
sectorSpecificCommsPositionsList = [];
sectorSpecificCommandosPositionsList = [];
sectorSpecificSnipersPositionsList = [];

_text_marker = createMarker ["sector_home_text", getMarkerPos "sector_home"];
_text_marker setMarkerShape "ICON";
_text_marker setMarkerType "mil_dot";
_text_marker setMarkerText (markerText "sector_home");

_sectorCounter = 1;
while {_sectorCounter < 999} do 
{
	_sectorMarker = "sector_" + str(_sectorCounter);
	if (((getMarkerPos _sectorMarker) select 0) != 0) then
	{
		_roadsList = [];
	
		_text_marker = createMarker [_sectorMarker + "_text", getMarkerPos _sectorMarker];
		_text_marker setMarkerShape "ICON";
		_text_marker setMarkerType "mil_dot";
		_text_marker setMarkerText (markerText _sectorMarker);
		
		_sectorMarker setMarkerAlpha 0;
		_text_marker setMarkerAlpha 0;
		
		sectorList pushBack _sectorMarker;
		
		_roadsList = (getMarkerPos _sectorMarker) nearRoads (((markerSize _sectorMarker) select 0)/2);
		
		sectorRoadsList pushBack _roadsList;	
	
		sectorSpecificAAPositionsList pushBack [];
		sectorSpecificAVPositionsList pushBack [];
		sectorSpecificMortarPositionsList pushBack [];
		sectorSpecificSupplyPositionsList pushBack [];
		sectorSpecificHQPositionsList pushBack [];
		sectorSpecificCommsPositionsList pushBack [];
		sectorSpecificCommandosPositionsList pushBack [];
		sectorSpecificSnipersPositionsList pushBack [];
	};	
	
	_sectorCounter = _sectorCounter + 1;
};


_specificPositionTypes = [["redfor_vehicle_aa_position", sectorSpecificAAPositionsList]
							, ["redfor_vehicle_av_position", sectorSpecificAVPositionsList]
							, ["redfor_mortar_position", sectorSpecificMortarPositionsList]
							, ["redfor_commTower_position", sectorSpecificCommsPositionsList]
							, ["redfor_hqTent_position", sectorSpecificHQPositionsList]
							, ["redfor_supplyVehicle_position", sectorSpecificSupplyPositionsList]
							, ["redfor_commandos_position", sectorSpecificCommandosPositionsList]
							, ["redfor_snipers_position", sectorSpecificSnipersPositionsList]];
							
{
	_groupCounter = 1;
	while {_groupCounter < 999} do
	{
		_currentSpecificPositionObjectClass = _x select 0;
		_currentSpecificPositionTypeList = _x select 1;
		_obj = missionNamespace getVariable [format["%1_%2_%3",_currentSpecificPositionObjectClass, _groupCounter, 1],objNull];
		if ((typeOf _obj) != "") then
		{		
			_sectorIndex = 0;
			{
				scopeName "sectorLoop";
				if (_obj inArea _x) then
				{
					_sectorIndex = _forEachIndex;
					breakOut "sectorLoop";
				};
			} forEach sectorList;
		
			_groupPositionList = []; 			
			_groupPositionList pushback [(getPosASL _obj), getDir _obj];		
			deleteVehicle _obj;
		
			_individualPositionCounter = 2;	
			while {_individualPositionCounter < 999} do
			{
				_obj = missionNamespace getVariable [format["%1_%2_%3"
															,_currentSpecificPositionObjectClass
															, _groupCounter
															, _individualPositionCounter]
													,objNull];
				if ((typeOf _obj) != "") then
				{
					_direction = getDir _obj;
					_groupPositionList pushBack [(getPosASL _obj), _direction];
					deleteVehicle _obj;
				};
			
				_individualPositionCounter = _individualPositionCounter + 1;	
			};
			
			_currentList = _currentSpecificPositionTypeList select _sectorIndex;
			_currentList pushBack _groupPositionList;
			_currentSpecificPositionTypeList set [_sectorIndex, _currentList];
		};	
		
		_groupCounter = _groupCounter + 1;	
	};
}
forEach _specificPositionTypes;

{
	_sectorIndex = _forEachIndex;

	_xAxisStart = ((getMarkerPos _x) select 0) - ((markerSize _x) select 0)/2;
	_xAxisEnd = ((getMarkerPos _x) select 0) + ((markerSize _x) select 0)/2;
	_yAxisStart = ((getMarkerPos _x) select 1) - ((markerSize _x) select 1)/2;
	_yAxisEnd = ((getMarkerPos _x) select 1) + ((markerSize _x) select 1)/2;
	
	_objectiveAreaList = [];
	_step = 2 * redfor_compound_radius;
	
	for "_i" from  _xAxisStart to _xAxisEnd step _step do
	{
		for "_j" from  _yAxisStart to _yAxisEnd step _step do
		{
			if ([_i, _j] inArea [getMarkerPos _x
								, (((markerSize _x) select 0)/2)-redfor_compound_radius
								, (((markerSize _x) select 1)/2)-redfor_compound_radius
								, 0
								, false]) then
			{				
				if (count ([_i, _j, 0] isFlatEmpty [-1, -1, 0.2, redfor_compound_radius]) > 0) then								
				{
					
					_specificSectorAAPositions = sectorSpecificAAPositionsList select _sectorIndex;
					_specificSectorAVPositions = sectorSpecificAVPositionsList select _sectorIndex;
					_specificSectorMortarPositions = sectorSpecificMortarPositionsList select _sectorIndex;
					_specificSectorSupplyPositions = sectorSpecificSupplyPositionsList select _sectorIndex;
					_specificSectorHQPositions = sectorSpecificHQPositionsList select _sectorIndex;
					_specificSectorCommsPositions = sectorSpecificCommsPositionsList select _sectorIndex;
					_specificSectorCommandosPositions = sectorSpecificCommandosPositionsList select _sectorIndex;
					_specificSectorSnipersPositions = sectorSpecificSnipersPositionsList select _sectorIndex;
										
					_specificPositionsTypes = [_specificSectorAAPositions
											, _specificSectorAVPositions
											, _specificSectorMortarPositions
											, _specificSectorSupplyPositions
											, _specificSectorHQPositions
											, _specificSectorCommsPositions
											, _specificSectorCommandosPositions
											, _specificSectorSnipersPositions
										];
					
					_validPosition = true;
					
					{
						scopeName "positionsLoop";
						_specificPositionType = _x;
												
						{
							_positionsGroup = _x;
													
							{								
								_position = _x select 0;								
								if (([_i, _j, 0] distance _position) <= (redfor_compound_radius * 2)) then
								{
									_validPosition = false;
									breakOut "positionsLoop";
								};
							} forEach _positionsGroup;
						} forEach _specificPositionType;
					} forEach _specificPositionsTypes;
					
					if (_validPosition) then
					{
						_roadSegments = sectorRoadsList select _sectorIndex;
						
						{
							scopeName "roadsLoop";
							if (([_i, _j, 0] distance (getPos _x)) <= (redfor_compound_radius * 2)) then
							{
								_validPosition = false;
								breakOut "roadsLoop";
							};
						} forEach _roadSegments;
					};
					
					if (_validPosition) then 
					{
						_objectiveAreaList pushBack [_i, _j];
					};					
				};
			};				
		};
	};
	
	sectorObjectiveGenericAreaList pushBack _objectiveAreaList;
} forEach sectorList;