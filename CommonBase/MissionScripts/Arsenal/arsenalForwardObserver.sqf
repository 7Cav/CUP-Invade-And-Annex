params["_crate"];

private _primaryWeapons = [
];

private _secondaryWeapons = [
];

private _launchers = [
];

private _headgear = [
    
];

private _uniforms = [
];

private _vests = [
];

private _backpacks = [
];

private _facewear = [
];

private _NVGs = [
];

private _binoculars = [
	"Laserdesignator",
	"Laserdesignator_02_ghex_F",
	"Laserdesignator_01_khk_F",
	"Laserdesignator_02",
	"Laserdesignator_03"	
];

private _terminals = [
];

private _sights = [
];

private _railAttachments = [
];

private _muzzleAttachments = [
];

private _bipods = [
];

private _magazines = [
	"Laserbatteries"
];

private _grenades = [
];

private _explosives = [
];

private _miscItems = [
];

[_crate,
	_primaryWeapons +
	_secondaryWeapons +
	_launchers +
	_headgear +
	_uniforms +
	_vests +
	_backpacks +
	_facewear +
	_NVGs +
	_binoculars +
	_terminals +
	_sights +
	_railAttachments +
	_muzzleAttachments +
	_bipods +
	_magazines +
	_grenades +
	_explosives +
	_miscItems,
	false
] call ace_arsenal_fnc_addVirtualItems;