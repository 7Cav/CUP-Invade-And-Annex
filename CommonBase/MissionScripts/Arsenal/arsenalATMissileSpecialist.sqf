params["_crate"];

private _primaryWeapons = [
       
];

private _secondaryWeapons = [
    
];

private _launchers = [
    //RHS USAF
    "rhs_weap_fgm148"
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

private _terminals = [ //Added misc - compass, watch, map, etc
    
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
	// RHS USAF
    "rhs_fgm148_magazine_AT"
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
