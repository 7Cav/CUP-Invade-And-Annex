
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

        // Default Loadouts

        ["[000] --- Medical Team ---",
            [[],[],[],[],[],[],"","",[],["","","","","",""]]
        ] call ace_arsenal_fnc_addDefaultLoadout;

        ["[001] Medic",
            [["rhs_weap_m4a1_grip3","rhsusf_acc_SFMB556","rhsusf_acc_anpeq15_top","rhsusf_acc_compm4",["rhs_mag_30Rnd_556x45_M855A1_Stanag",30],[],"rhsusf_acc_tdstubby_tan"],
            [],
            [],
            ["rhs_uniform_acu_oefcp",[["ACE_MapTools",1],["ACE_Flashlight_XL50",1],["ACE_quikclot",14],["ACE_tourniquet",4],["ACE_microDAGR",1],["ACRE_PRC343",1],["ACRE_PRC152",1]]],
            ["rhsusf_spcs_ocp_medic",[["ACE_morphine",12],["ACE_epinephrine",12],["rhsusf_ANPVS_14",1],["rhs_mag_30Rnd_556x45_M855A1_Stanag",7,30],["SmokeShell",4,1],["ACE_Chemlight_HiRed",6,1]]],
            ["B_Carryall_mcamo",[["ACE_salineIV",16],["ACE_personalAidKit",8],["ACE_elasticBandage",60],["ACE_surgicalKit",1]]],
            "rhsusf_ach_bare_tan_headset","",[],["ItemMap","ItemGPS","ItemRadioAcreFlagged","ItemCompass","ItemWatch",""]]
        ] call ace_arsenal_fnc_addDefaultLoadout;
    };

} forEach [
	arsenal_1,
	arsenal_2,
	arsenal_3,
	arsenal_4,
	arsenal_5
];

execVM "scripts\arsenal\fn_arsenalGeneral.sqf";
