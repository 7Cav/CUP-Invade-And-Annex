params["_unit"];

_unit setVariable["IsDragging",false,true];
_unit setVariable["IsDragged",false,true];

_unit setVariable["IsCarrying",false,true];
_unit setVariable["IsCarried",false,true];

_unit setVariable["Loaded",objNull,true];

_unit setVariable["IsReviving",false,true];
_unit setVariable["IsRevived",false,true];

_unit addEventHandler [
	"HandleDamage",
	{
		_unit = _this select 0;
		_damage = _this select 2;
		
		_returnedDamage = 0;
		
		if ((_damage >= 1) && (lifeState _unit != "INCAPACITATED")) then
		{
			_returnedDamage = 0.99;
			_unit setUnconscious true;
		}
		else
		{
			_returnedDamage = _damage;
		};
		
		_returnedDamage
	}
];

fnc_casualtyReviveActionConditions = {
	params ["_target", "_this"];
	
	_cond = true;
	
	_notSelf = (_target != _this);
	_inRange = ((_target distance _this) < 2);
	_assistantCapable = ((lifeState _this == "HEALTHY") || (lifeState _this == "INJURED"));
	_casualtyIncapacitated = (lifeState _target == "INCAPACITATED");
	_assistantNotBusy = (!(_this getVariable "IsDragging")) && (!(_this getVariable "IsCarrying"));
	_casualtyNotAssisted = (!(_target getVariable "IsDragged")) && (!(_target getVariable "IsCarried"));
	_casualtyNotInVehicle = (vehicle _target == _target);
	_assistantIsMedic = (typeOf _this == "B_Medic_F");
	_hasItems = ({_x == "MediKit"} count (items _this) >= 1);
	
	_cond = _notSelf && 
			_inRange && 
			_assistantCapable && 
			_casualtyIncapacitated && 
			_assistantNotBusy && 
			_casualtyNotAssisted && 
			_casualtyNotInVehicle &&
			_assistantIsMedic &&
			_hasItems;
	
	_cond
};


fnc_casualtyMoveActionConditions = {
	params ["_target", "_this"];
	
	_cond = true;
	
	_notSelf = (_target != _this);
	_inRange = ((_target distance _this) < 2);
	_assistantCapable = ((lifeState _this == "HEALTHY") || (lifeState _this == "INJURED"));
	_casualtyIncapacitated = (lifeState _target == "INCAPACITATED");
	_assistantNotBusy = (!(_this getVariable "IsDragging")) && (!(_this getVariable "IsCarrying")) && (!(_this getVariable "IsReviving"));
	_casualtyNotAssisted = (!(_target getVariable "IsDragged")) && (!(_target getVariable "IsCarried")) && (!(_target getVariable "IsRevived"));
	_casualtyNotInVehicle = (vehicle _target == _target);	
	
	_cond = _notSelf && 
			_inRange && 
			_assistantCapable && 
			_casualtyIncapacitated && 
			_assistantNotBusy && 
			_casualtyNotAssisted && 
			_casualtyNotInVehicle;		
	
	_cond
};

fnc_casualtyLoadActionConditions = {
	params ["_target", "_this"];
	
	_cond = true;
	
	_vehicle = (_target nearEntities [['Car','Tank','Helicopter','Plane','Ship'], 6]) select 0; 
	
	_notSelf = (_target != _this);
	_inRange = ((_target distance _this) < 2);
	_assistantCapable = ((lifeState _this == "HEALTHY") || (lifeState _this == "INJURED"));
	_casualtyIncapacitated = (lifeState _target == "INCAPACITATED");
	_assistantNotBusy = (!(_this getVariable "IsDragging")) && (!(_this getVariable "IsCarrying")) && (!(_this getVariable "IsReviving"));
	_casualtyNotAssisted = (!(_target getVariable "IsDragged")) && (!(_target getVariable "IsCarried")) && (!(_target getVariable "IsRevived"));
	_casualtyNotInVehicle = (vehicle _target == _target);	
	_vehicleIsValid = ((side _vehicle != east) && (side _vehicle != resistance) && ((_vehicle emptyPositions "Cargo") >= 1));	
	
	_cond = _notSelf && 
			_inRange && 
			_assistantCapable && 
			_casualtyIncapacitated && 
			_assistantNotBusy && 
			_casualtyNotAssisted && 
			_casualtyNotInVehicle &&
			_vehicleIsValid;		
	
	_cond
	
};

fnc_dragCasualty = {
	params ["_casualty","_assistant"];
	
	_casualty setVariable ["IsDragged",true,true];
	_assistant setVariable ["IsDragging",true,true];
	
	[_assistant, "AcinPknlMstpSrasWrflDnon"] remoteExecCall ["playMoveNow", 0, false];
		
	_casualty attachTo [_assistant, [0, 1.1, 0.05]];
	[_casualty, 180] remoteExecCall ["setDir", _casualty, false];
	
	private _dropActionID = _casualty addAction [
		"<t color='#FFCC00'>Drop</t>", 
		"[_this select 0, _this select 1, _this select 2] call fnc_dropCasualty", 
		[], 
		8, 
		true, 
		true, 
		""
	];
	
	if (isPlayer _assistant) then {
		private _startPos = getPos _assistant;
		[_assistant, _startPos] spawn {
			params ["_assistant", "_startPos"];
			sleep 5;
			if ((_assistant distance _startPos) < 2) then {
				titleText [format["Exit Combat Pace via %1", (actionKeysNamesArray "TactToggle") select 0], "PLAIN", 1]; 
				sleep 1; 
				titleFadeOut 4;
			};
		};
	};
	
	waitUntil {sleep 0.1; (!(_casualty getVariable "IsDragged") || !(alive _casualty) || (lifeState _assistant == "INCAPACITATED"));};  
	
	if ((!alive _casualty) || (!(lifeState _casualty != "INCAPACITATED")) || (!(lifeState _assistant == "INCAPACITATED"))) then 
	{
		[_casualty, _assistant, _dropActionID] spawn fnc_dropCasualty;
	};
};

fnc_carryCasualty = {
	params ["_casualty","_assistant"];
	
	_casualty setVariable ["IsCarried",true,true];
	_assistant setVariable ["IsCarrying",true,true];
	
	[_casualty, (getDir _assistant) + 180] remoteExecCall ["setDir", _casualty, false];
		
	[_casualty, "AinjPpneMrunSnonWnonDb_still"] remoteExecCall ["playMoveNow", 0, false];
	[_casualty, "AinjPpneMrunSnonWnonDb_still"] remoteExecCall ["switchMove", 0, false];
	[_casualty, "AidlPpneMstpSnonWnonDnon_AI"] remoteExecCall ["switchMove", 0, false];
	
	[_casualty, "AinjPfalMstpSnonWnonDf_carried_dead"] remoteExecCall ["playMoveNow", 0, false];
	
	sleep 1;
	
	[_assistant, "AcinPknlMstpSrasWrflDnon_AcinPercMrunSrasWrflDnon"] remoteExecCall ["playMoveNow", 0, false];
	
	waitUntil {animationState _casualty == "AinjPfalMstpSnonWnonDf_carried_dead"};
	
	_casualty attachTo [_assistant, [-0.2, 0.25, 0]];
	
	private _dropActionID = _casualty addAction [
		"<t color='#FFCC00'>Drop</t>", 
		"[_this select 0, _this select 1, _this select 2] call fnc_dropCasualty", 
		[], 
		8, 
		true, 
		true, 
		""
	];
	
	waitUntil {sleep 0.1; (!(_casualty getVariable "IsCarried") || !(alive _casualty) || (lifeState _assistant == "INCAPACITATED"));};  
	
	if ((!alive _casualty) || (!(lifeState _casualty != "INCAPACITATED")) || (!(lifeState _assistant == "INCAPACITATED"))) then 
	{
		[_casualty, _assistant, _dropActionID] spawn fnc_dropCasualty;
	};
};

fnc_dropCasualty = {
	params ["_casualty","_assistant","_dropActionID"];
	
	_casualty removeAction _dropActionID;	
	
	if (_casualty getVariable "IsDragged") then 
	{		
		if (lifeState _assistant != "INCAPACITATED") then		
		{	
			[_assistant, "AcinPknlMstpSrasWrflDnon_AmovPknlMstpSrasWrflDnon"] remoteExec ["switchMove", 0, true];			
		};
		
		detach _casualty;
		sleep 3;		
		_casualty setVariable ["IsDragged", false, true];
		_assistant setVariable ["IsDragging", false, true];
	};
	
	if (_casualty getVariable "IsCarried") then 
	{
		if (lifeState _assistant == "INCAPACITATED") then		
		{			
			[_assistant, "UnconsciousReviveDefault"] remoteExec ["switchMove", 0, true];
			[_casualty, "UnconsciousReviveDefault"] remoteExecCall ["playMoveNow", 0, true];
			[_casualty, "UnconsciousReviveDefault"] remoteExecCall ["switchMove", 0, true];
			sleep 4;
		}
		else
		{
			if ((!alive _casualty) || (lifeState _casualty != "INCAPACITATED")) then 
			{			
				[_assistant, ""] remoteExec ["switchMove", 0, true];
			}
			else
			{				
				[_assistant, "AcinPercMrunSrasWrflDf_AmovPercMstpSlowWrflDnon"] remoteExecCall ["playMoveNow", 0, true];
				[_casualty, "AinjPfalMstpSnonWnonDnon_carried_Down"] remoteExecCall ["playMoveNow", 0, true];
				[_casualty, "AinjPfalMstpSnonWnonDnon_carried_Down"] remoteExecCall ["switchMove", 0, true];
				sleep 5;
				[_casualty, "UnconsciousReviveDefault"] remoteExecCall ["playMoveNow", 0, true];
				[_casualty, "UnconsciousReviveDefault"] remoteExecCall ["switchMove", 0, true];			
			};
		};
				
		detach _casualty;		
		_casualty setVariable ["IsCarried", false, true];
		_assistant setVariable ["IsCarrying", false, true];
	};
};

fnc_loadCasualty = {
	params ["_casualty","_assistant"];
	
	private _vehicle = (_casualty nearEntities [['Car','Tank','Helicopter','Plane','Ship'], 6]) select 0;
	
	_casualty setVariable ["Loaded",_vehicle,true];
	
	[_casualty, _vehicle] remoteExec ["fnc_moveCasualtyInCargo", 0, true];	
};

fnc_moveCasualtyInCargo = {
	params["_casualty","_vehicle"];
	
	if (local _casualty) then 
	{
		[_casualty, _vehicle] spawn 
		{
			params ["_casualty", "_vehicle"];			
			_casualty assignAsCargo _vehicle;			
			_casualty moveInCargo _vehicle;			
			waitUntil {sleep 0.1; (vehicle _casualty != _casualty)};			
			[_casualty, "UnconsciousReviveDefault"] remoteExec ["playAction", 0, true];
		};
	};	
	
	private _unloadActionID = _vehicle addAction [
		"<t color='#FFCC00'>Unload from vehicle</t>", 
		[_this select 0, _this select 1, _casualty] call fnc_unloadCasualty, 
		[], 
		10, 
		true, 
		true, 
		"", 
		"(((_target distance _this) <= 6) && ((speed _target) <= 1))"		
	];
	
	[_casualty, _vehicle, _unloadActionID] spawn 
	{
		params ["_casualty", "_vehicle", "_unloadActionID"];
		
		waitUntil {sleep 0.3; ((vehicle _casualty != _vehicle) || (isNull (_casualty getVariable "Loaded")) || (lifeState _casualty != "INCAPACITATED"))};
				
		_vehicle removeAction _unloadActionID;
				
		sleep 3;
				
		if (local _casualty) then 
		{
			if (!isNull (_casualty getVariable "Loaded")) then 
			{				
				_casualty setVariable ["Loaded", objNull, true];
			};
		};
	};
};

fnc_unloadCasualty = {
	private _vehicle = _this select 0;
	private _unloadActionID = _this select 1;
	private _casualty = _this select 2;
	
	[_casualty] remoteExecCall ["unassignVehicle", _casualty, true];
	
	moveOut _casualty;
	
	waitUntil {sleep 0.1; (vehicle _casualty == _casualty)};
	
	[_casualty, "UnconsciousReviveDefault"] remoteExecCall ["playMoveNow", 0, true];
	[_casualty, "UnconsciousReviveDefault"] remoteExecCall ["switchMove", 0, true];
	
	sleep 3;
	
	if (!isNull (_casualty getVariable "Loaded")) then 
	{
		_casualty setVariable ["Loaded", objNull, true];
	};
};

[
	_unit,
	"<t color='#FFCC00'>Revive</t>",
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_revive_ca.paa",
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_revive_ca.paa",
	"(([_target, _this] call fnc_casualtyReviveActionConditions) && ((eyePos _target select 2) > 0))",
	"(_caller distance _target) < 2",
	{	
		_target setVariable ["IsRevived",true,true];
		_caller setVariable ["IsReviving",true,true];
	},
	{
			
	},
	{
		_target setUnconscious false;
		_target setDamage 0;
				
		_target setVariable ["IsRevived",false,true];
		_caller setVariable ["IsReviving",false,true];		
	},
	{
		_target setVariable ["IsRevived",false,true];
		_caller setVariable ["IsReviving",false,true];
	},
	[],
	10,
	10,
	false,
	false,
	true
] call BIS_fnc_holdActionAdd;

_unit addAction [
	"<t color='#FFCC00'>Load in vehicle</t>",
	"[_this select 0, _this select 1] call fnc_loadCasualty", 
	[], 
	9, 
	true, 
	true, 
	"", 
	"(([_target, _this] call fnc_casualtyLoadActionConditions) && ((eyePos _target select 2) > 0))"	
];

_unit addAction [
	"<t color='#FFCC00'>Drag</t>",
	"[_this select 0, _this select 1] call fnc_dragCasualty", 
	[], 
	8, 
	true, 
	true, 
	"", 
	"(([_target, _this] call fnc_casualtyMoveActionConditions) && ((eyePos _target select 2) > 0))"	
];

_unit addAction [
	"<t color='#FFCC00'>Carry</t>",
	"[_this select 0, _this select 1] call fnc_carryCasualty", 
	[], 
	7, 
	true, 
	true, 
	"", 
	"(([_target, _this] call fnc_casualtyMoveActionConditions) && ((eyePos _target select 2) > 0))"	
];