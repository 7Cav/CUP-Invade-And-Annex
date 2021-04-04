
private _primaryWeapons = [
];

private _secondaryWeapons = [
];

private _launchers = [
];

private _headgear = [
    //Vanilla
    "H_PilotHelmetFighter_B",
    //FIR
    "FIR_hgu26p",
    "FIR_hgu26p_camo",
    "FIR_HGU33P",
    "FIR_HGU33P_VF1",
    "FIR_HGU33P_VF111",
    "FIR_HGU33P_VF84",
    "FIR_USHelmetType2",
    "FIR_USHelmetType2_USMC",
    "FIR_USHelmetType2_Navy",
    "FIR_USHelmetType2_USAF_80s",
    "FIR_USHelmetType2_VF103",
    "FIR_USHelmetType2_VF154",
    "FIR_USHelmetType1",
    "FIR_USHelmetType1_Navy",
    "FIR_USHelmetType1_USMC",
    "FIR_USHelmetType1_VF31",
    "FIR_USHelmetType1_Agg",
    "FIR_HGU55PJ",
    "FIR_HGU84P",
    "FIR_HGU84P_Black",
    "FIR_HGU84P_Green",
    "FIR_HGU84P_Marpat_D",
    "FIR_HGU84P_Marpat_W",
    "FIR_HGU84P_Custom_Example",
    "FIR_JHMCS",
    "FIR_JHMCS_II",
    "FIR_JHMCS_Type2",
    "FIR_ScorpionHMCS",
    //RHS USAF
    "RHS_jetpilot_usaf"
];

private _uniforms = [ //Needs heli uniforms cleaned out
    //Vanilla
    "U_B_HeliPilotCoveralls",
    "U_B_PilotCoveralls",
    //Task Force Canada
    "TFC_CU_CombatUniform_Aircrew_AR",
    "TFC_CU_CombatUniform_Aircrew_TW",
    //FIR
    "FIR_CWU45",
    "FIR_Fighter_Pilot_JASDF_Nomex",
    "FIR_Fighter_Pilot_JASDF_Nomex2",
    "FIR_Fighter_Pilot_JASDF_Nomex3",
    "FIR_Fighter_Pilot_JASDF_Nomex4",
    "FIR_Fighter_Pilot_JASDF_Nomex5",
    "FIR_Fighter_Pilot_JASDF_Nomex6",
    "FIR_Fighter_Pilot_JASDF_Nomex7",
    "FIR_Fighter_Pilot_Uniform_Flight",
    "FIR_Fighter_Pilot_Uniform_Flight_civ",
    "FIR_Fighter_Pilot_ROKAF_Nomex",
    "FIR_Fighter_Pilot_ROKAF_Nomex2",
    "FIR_Fighter_Pilot_ROKAF_Nomex3",
    "FIR_Fighter_Pilot_ROKAF_Nomex4",
    "FIR_Fighter_Pilot_ROKAF_Nomex5",
    "FIR_Fighter_Pilot_ROKAF_Nomex6",
    "FIR_Fighter_Pilot_ROKAF_Nomex7",
    "FIR_USARMY_Heli_Uniform_Multicam",
    "FIR_USARMY_Heli_Uniform",
    "FIR_Fighter_Pilot_USAF_Agg_Nomex",
    "FIR_Fighter_Pilot_USAF_agg_64agrs_Nomex",
    "FIR_Fighter_Pilot_USAF_agg_64agrs_Nomex2",
    "FIR_Fighter_Pilot_USAF_Agg_Nomex2",
    "FIR_Fighter_Pilot_USAF_agg_64agrs_Nomex3",
    "FIR_Fighter_Pilot_USAF_Agg_Nomex3",
    "FIR_Fighter_Pilot_USAF_agg_64agrs_Nomex4",
    "FIR_Fighter_Pilot_USAF_Agg_Nomex4",
    "FIR_Fighter_Pilot_USAF_agg_64agrs_Nomex5",
    "FIR_Fighter_Pilot_USAF_Agg_Nomex5",
    "FIR_Fighter_Pilot_USAF_agg_64agrs_Nomex6",
    "FIR_Fighter_Pilot_USAF_Agg_Nomex6",
    "FIR_Fighter_Pilot_USAF_agg_64agrs_Nomex7",
    "FIR_Fighter_Pilot_USAF_Agg_Nomex7",
    "FIR_GroundCrew_ABU_Uniform",
    "FIR_GroundCrew_ABU_Shirt",
    "FIR_GroundCrew_OCP_Uniform",
    "FIR_GroundCrew_OCP_Shirt",
    "FIR_Fighter_Pilot_Nomex",
    "FIR_Fighter_Pilot_Nomex2",
    "FIR_Fighter_Pilot_Nomex3",
    "FIR_Fighter_Pilot_Nomex4",
    "FIR_Fighter_Pilot_Nomex5",
    "FIR_Fighter_Pilot_Nomex6",
    "FIR_Fighter_Pilot_Nomex7",
    "FIR_Fighter_Pilot_Nomex8",
    "FIR_Fighter_Pilot_USMC_Nomex",
    "FIR_Fighter_Pilot_USMC_Nomex2",
    "FIR_Fighter_Pilot_USMC_Nomex3",
    "FIR_Fighter_Pilot_USMC_Nomex4",
    "FIR_Fighter_Pilot_USMC_Nomex5",
    "FIR_Fighter_Pilot_USMC_Nomex6",
    "FIR_Fighter_Pilot_USMC_Nomex7",
    "FIR_Fighter_Pilot_USN_Nomex",
    "FIR_Fighter_Pilot_USN_Nomex2",
    "FIR_Fighter_Pilot_USN_Nomex3",
    "FIR_Fighter_Pilot_USN_Nomex4",
    "FIR_Fighter_Pilot_USN_Nomex5",
    "FIR_Fighter_Pilot_USN_Nomex6",
    "FIR_Fighter_Pilot_USN_Nomex7",
    "FIR_Fighter_Pilot_VF1_Nomex",
    "FIR_Fighter_Pilot_VF1_Nomex2",
    "FIR_Fighter_Pilot_VF1_Nomex3",
    "FIR_Fighter_Pilot_VF1_Nomex4",
    "FIR_Fighter_Pilot_VF1_Nomex5",
    "FIR_Fighter_Pilot_VF1_Nomex6",
    "FIR_Fighter_Pilot_VF1_Nomex7",
    "FIR_Fighter_Pilot_VF103_Nomex",
    "FIR_Fighter_Pilot_VF103_Nomex2",
    "FIR_Fighter_Pilot_VF103_Nomex3",
    "FIR_Fighter_Pilot_VF103_Nomex4",
    "FIR_Fighter_Pilot_VF103_Nomex5",
    "FIR_Fighter_Pilot_VF103_Nomex6",
    "FIR_Fighter_Pilot_VF103_Nomex7",
    "FIR_Fighter_Pilot_VF111_Nomex",
    "FIR_Fighter_Pilot_VF111_Nomex2",
    "FIR_Fighter_Pilot_VF111_Nomex3",
    "FIR_Fighter_Pilot_VF111_Nomex4",
    "FIR_Fighter_Pilot_VF111_Nomex5",
    "FIR_Fighter_Pilot_VF111_Nomex6",
    "FIR_Fighter_Pilot_VF111_Nomex7",
    "FIR_Fighter_Pilot_VF154_Nomex",
    "FIR_Fighter_Pilot_VF154_Nomex2",
    "FIR_Fighter_Pilot_VF154_Nomex3",
    "FIR_Fighter_Pilot_VF154_Nomex4",
    "FIR_Fighter_Pilot_VF154_Nomex5",
    "FIR_Fighter_Pilot_VF154_Nomex6",
    "FIR_Fighter_Pilot_VF154_Nomex7",
    "FIR_Fighter_Pilot_VF31_Nomex",
    "FIR_Fighter_Pilot_VF31_Nomex2",
    "FIR_Fighter_Pilot_VF31_Nomex3",
    "FIR_Fighter_Pilot_VF31_Nomex4",
    "FIR_Fighter_Pilot_VF31_Nomex5",
    "FIR_Fighter_Pilot_VF31_Nomex6",
    "FIR_Fighter_Pilot_VF31_Nomex7",
    "FIR_Fighter_Pilot_VF84_Nomex",
    "FIR_Fighter_Pilot_VF84_Nomex2",
    "FIR_Fighter_Pilot_VF84_Nomex3",
    "FIR_Fighter_Pilot_VF84_Nomex4",
    "FIR_Fighter_Pilot_VF84_Nomex5",
    "FIR_Fighter_Pilot_VF84_Nomex6",
    "FIR_Fighter_Pilot_VF84_Nomex7"
];

private _vests = [
    //FIR
    "FIR_pilot_vest",
    "fir_usarmy_pilot_multicam_vest",
    "fir_usarmy_pilot_vest"
];

private _backpacks = [
];

private _facewear = [ //Needs heli visors cleaned out
    //FIR
    "FIR_Visor_Black_covered_normal_down",
    "FIR_Visor_Black_down",
    "FIR_Visor_Black_covered_down",
    "FIR_Visor_Black_covered",
    "FIR_Visor_Black_covered_normal",
    "FIR_Visor_Black_up",
    "FIR_Visor_Clear_down",
    "FIR_Visor_Clear_up",
    "FIR_HGU55PJ_Visor_Black_down",
    "FIR_HGU55PJ_Visor_Black_up",
    "FIR_HGU55PJ_Visor_clear_down",
    "FIR_HGU55PJ_Visor_clear_up",
    "FIR_HGU84P_Visor1",
    "FIR_HGU84P_Visor2"
];

private _NVGs = [
];

private _binoculars = [
];

private _terminals = [
    //FIR
    "FIR_PDU"
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
