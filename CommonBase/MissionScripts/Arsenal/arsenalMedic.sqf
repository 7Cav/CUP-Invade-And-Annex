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
    //Ace
    "ACE_adenosine",
    "ACE_bloodIV",
    "ACE_bloodIV_250",
    "ACE_bloodIV_500",
    "ACE_plasmaIV",
    "ACE_plasmaIV_250",
    "ACE_plasmaIV_500",
    "ACE_salineIV",
    "ACE_salineIV_250",
    "ACE_salineIV_500",
    "ACE_surgicalKit"
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