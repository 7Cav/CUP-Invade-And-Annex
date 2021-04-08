params["_crate"];

private _weapons = [
	"rhs_weap_fnmag",
    "rhs_weap_l1a1",
	"rhs_weap_l1a1_wood",
	"rhs_weap_m14",
	"rhs_weap_m14_d",
	"rhs_weap_m14_fiberglass",
	"rhs_weap_m14_rail",
	"rhs_weap_m14_rail_d",
	"rhs_weap_m14_rail_fiberglass",
	"rhs_weap_m14_rail_wd",
	"rhs_weap_m14_ris",
	"rhs_weap_m14_ris_d",
	"rhs_weap_m14_ris_fiberglass",
	"rhs_weap_m14_ris_wd",
	"rhs_weap_m14_wd",
	"rhs_weap_m14ebrri",
	"rhs_weap_m240B",
	"rhs_weap_m240G",
	"rhs_weap_m249_pip",
	"rhs_weap_m249_light_L",
	"rhs_weap_m249_pip_L_para",
	"rhs_weap_m249_pip_L",
	"rhs_weap_m249_pip_ris",
	"rhs_weap_m249_light_S",
	"rhs_weap_m249_pip_S_para",
	"rhs_weap_m249_pip_S",
	"rhs_weap_sr25",
	"rhs_weap_sr25_d",
	"rhs_weap_sr25_ec",
	"rhs_weap_sr25_ec_d",
	"rhs_weap_sr25_ec_wd",
	"rhs_weap_sr25_wd",
	"rhs_weap_mk17_CQC",
	"rhs_weap_mk17_LB",
	"rhs_weap_mk17_STD",
	"rhs_weap_SCARH_USA_CQC",
	"rhs_weap_SCARH_USA_LB",
	"rhs_weap_SCARH_USA_STD",
	"rhs_weap_m14_socom",
	"rhs_weap_m14_socom_rail",
	"rhs_weap_maaws",
	"rhs_weap_smaw",
	"rhs_weap_smaw_green"
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
    "ACE_HuntIR_M203"
];

private _grenades = [
];

private _explosives = [
];

private _miscItems = [
    "ACE_HuntIR_monitor"
];

[_crate,
	_weapons +	
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