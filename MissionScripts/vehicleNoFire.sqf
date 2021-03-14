params["_unit"];

_unit addEventHandler ["Fired", {
	if ((getPos (_this select 0)) inArea "sector_home") then
	{
		deleteVehicle (_this select 6);
		titleText ["Firing weapons and placing / throwing explosives at base is STRICTLY PROHIBITED!", "PLAIN", 3];
	};
}];