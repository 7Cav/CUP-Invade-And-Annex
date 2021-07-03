params ["_unit"];

_unit addEventHandler ["Fired", {
	params ["_unit", "", "", "", "", "", "_projectile", ""];

	if ((getPos _unit) inArea "sector_home") then {
		deleteVehicle _projectile;
		titleText ["Firing weapons and placing / throwing explosives at base is STRICTLY PROHIBITED!", "PLAIN", 3];
	};
}];