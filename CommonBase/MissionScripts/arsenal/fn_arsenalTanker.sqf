
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
    "rhsusf_cvc_ess",
    //NATO Winter Retextures
    "RCOMM_wnato_h_helmetcrew"
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

{
    if (!isNull(_x)) then {

        [_x,
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

    };

} forEach [
	arsenal_1,
	arsenal_2,
	arsenal_3,
	arsenal_4,
	arsenal_5,
	arsenal_6
];

execVM "scripts\arsenal\fn_arsenalGeneral.sqf";
