params["_crate"];

private _primaryWeapons = [
];

private _secondaryWeapons = [
];

private _launchers = [
];

private _headgear = [
    //Vanilla
    "H_HelmetCrew_B",
    //RHS USAF
    "rhsusf_cvc_green_helmet",
    "rhsusf_cvc_green_alt_helmet",
    "rhsusf_cvc_green_ess",
    "rhsusf_cvc_helmet",
    "rhsusf_cvc_alt_helmet",
    "rhsusf_cvc_ess"    
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