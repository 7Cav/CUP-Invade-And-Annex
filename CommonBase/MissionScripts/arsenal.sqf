params ["_crate", "_unitClass"];

[_crate, []] call ace_arsenal_fnc_initBox;

[_crate] call compile preprocessFileLineNumbers "MissionScripts\Arsenal\arsenalGeneral.sqf";

switch (_unitClass) do
{
	case "B_officer_F" : 
	{ 
		[_crate] call compile preprocessFileLineNumbers "MissionScripts\Arsenal\arsenalInfantry.sqf";
	};		
	case "B_Soldier_SL_F" : 
	{ 
		[_crate] call compile preprocessFileLineNumbers "MissionScripts\Arsenal\arsenalInfantry.sqf";
	};
	case "B_medic_F" : 
	{ 
		[_crate] call compile preprocessFileLineNumbers "MissionScripts\Arsenal\arsenalMedic.sqf";
	};
	case "B_Soldier_TL_F" : 
	{ 
		[_crate] call compile preprocessFileLineNumbers "MissionScripts\Arsenal\arsenalInfantry.sqf";
	};
	case "B_soldier_AR_F" : 
	{ 
		[_crate] call compile preprocessFileLineNumbers "MissionScripts\Arsenal\arsenalInfantry.sqf";
	};
	case "B_Soldier_GL_F" : 
	{ 
		[_crate] call compile preprocessFileLineNumbers "MissionScripts\Arsenal\arsenalInfantry.sqf";
	};
	case "B_Soldier_F" : 
	{ 
		[_crate] call compile preprocessFileLineNumbers "MissionScripts\Arsenal\arsenalInfantry.sqf";
	};	
	case "B_crew_F" : 
	{		
		[_crate] call compile preprocessFileLineNumbers "MissionScripts\Arsenal\arsenalTanker.sqf";
	};	
	case "B_Helipilot_F" : 
	{ 
		[_crate] call compile preprocessFileLineNumbers "MissionScripts\Arsenal\arsenalHeliPilot.sqf";
	};
	case "B_helicrew_F" : 
	{ 
		[_crate] call compile preprocessFileLineNumbers "MissionScripts\Arsenal\arsenalHeliCrew.sqf";
	};
	case "B_Pilot_F" : 
	{ 
		[_crate] call compile preprocessFileLineNumbers "MissionScripts\Arsenal\arsenalPlanePilot.sqf";
	};
	case "B_sniper_F" : 
	{ 
		[_crate] call compile preprocessFileLineNumbers "MissionScripts\Arsenal\arsenalLongshot.sqf";
	};
	case "B_Survivor_F" : {
							[_crate] call compile preprocessFileLineNumbers "MissionScripts\Arsenal\arsenalInfantry.sqf";
							[_crate] call compile preprocessFileLineNumbers "MissionScripts\Arsenal\arsenalMedic.sqf";							
							[_crate] call compile preprocessFileLineNumbers "MissionScripts\Arsenal\arsenalTanker.sqf";														
							[_crate] call compile preprocessFileLineNumbers "MissionScripts\Arsenal\arsenalHeliPilot.sqf";
							[_crate] call compile preprocessFileLineNumbers "MissionScripts\Arsenal\arsenalHeliCrew.sqf";
							[_crate] call compile preprocessFileLineNumbers "MissionScripts\Arsenal\arsenalPlanePilot.sqf";
							[_crate] call compile preprocessFileLineNumbers "MissionScripts\Arsenal\arsenalLongshot.sqf";
						};
	
};