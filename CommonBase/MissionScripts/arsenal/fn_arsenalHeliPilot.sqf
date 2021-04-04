
private _primaryWeapons = [
];

private _secondaryWeapons = [
];

private _launchers = [
];

private _headgear = [
    //Vanilla
    "H_CrewHelmetHeli_B",
    "H_PilotHelmetHeli_B",
    "H_EarProtectors_black_F",
    "H_HeadSet_black_F",
    //Task Force Canada
    "TFC_CH_Helo_Crew",
    "TFC_CH_Helo_Pilot",
    //FIR
    "FIR_GroundCrew_Headset",
    "FIR_GroundCrew_Headset2",
    "FIR_HGU56P_Skull_Death",
    "FIR_HGU56P_Skull",
    //RHS USAF
    "rhsusf_hgu56p_black",
    "rhsusf_hgu56p_mask_black",
    "rhsusf_hgu56p_mask_black_skull",
    "rhsusf_hgu56p_visor_black",
    "rhsusf_hgu56p_visor_mask_black",
    "rhsusf_hgu56p_visor_mask_Empire_black",
    "rhsusf_hgu56p_visor_mask_black_skull",
    "rhsusf_hgu56p_green",
    "rhsusf_hgu56p_mask_green",
    "rhsusf_hgu56p_mask_green_mo",
    "rhsusf_hgu56p_visor_green",
    "rhsusf_hgu56p_visor_mask_green",
    "rhsusf_hgu56p_visor_mask_green_mo",
    "rhsusf_hgu56p",
    "rhsusf_hgu56p_mask",
    "rhsusf_hgu56p_mask_mo",
    "rhsusf_hgu56p_mask_skull",
    "rhsusf_hgu56p_visor",
    "rhsusf_hgu56p_visor_mask",
    "rhsusf_hgu56p_visor_mask_mo",
    "rhsusf_hgu56p_visor_mask_skull",
    "rhsusf_hgu56p_pink",
    "rhsusf_hgu56p_mask_pink",
    "rhsusf_hgu56p_visor_pink",
    "rhsusf_hgu56p_visor_mask_pink",
    "rhsusf_hgu56p_saf",
    "rhsusf_hgu56p_mask_saf",
    "rhsusf_hgu56p_visor_saf",
    "rhsusf_hgu56p_visor_mask_saf",
    "rhsusf_hgu56p_mask_smiley",
    "rhsusf_hgu56p_visor_mask_smiley",
    "rhsusf_hgu56p_tan",
    "rhsusf_hgu56p_mask_tan",
    "rhsusf_hgu56p_visor_tan",
    "rhsusf_hgu56p_visor_mask_tan",
    "rhsusf_hgu56p_usa",
    "rhsusf_hgu56p_visor_usa",
    "rhsusf_hgu56p_white",
    "rhsusf_hgu56p_visor_white",
    "rhsusf_ihadss"
];

private _uniforms = [ //Needs fighter uniforms cleaned out
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

private _facewear = [
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
    "FIR_HGU55PJ_Visor_clear_up"
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
    //Ace
    "ACE_rope12",
    "ACE_rope15",
    "ACE_rope18",
    "ACE_rope27",
    "ACE_rope36"
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
