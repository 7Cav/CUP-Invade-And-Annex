/*	VERSION: 0.97
	AUTHOR: Phronk
	CONTRIBUTIONS:
		1. DirtySanchez reorganized AFAR and improved security
		2. Metalman10 [EXP] optimized initialization of functions
		3. Dedmen added VON script commands to Arma

*///CONFIGURATIONS:
//CHANNEL PERMISSIONS		~		[TEXT,VOIP]			~			! Use all lower-case letters !
r_sideCH=true;//Enable Side Channel											>> Default: false
r_sCH=[true,false];//Side Channel  												>> Default: [true,true]
r_cCH=[true,true];//Command Channel  										>> Default: [true,true]
r_grCH=[true,true];//Group Channel											>> Default: [false,true]
r_vCH=[true,true];//Vehicle Channel											>> Default: [true,true]
r_dCH=[true,true];//Direct Channel												>> Default: [false,true]
r_mCH=[true,true];//Air Channel  												>> Default: [false,true]
r_mCHName="CAS";//Shown by player name in RTO channel		>> Default: "Air"
r_RTOBP=["CUP_B_Kombat_Radio_Olive", "CUP_B_Motherlode_Radio_MTP", "CUP_B_Predator_Radio_MTP"];//Add to list of backpacks RTO checks for					>> Default: []

r_incap=true;//Block incapacitated players from using radios		>> Default: false
r_alertOn=true;//Talking alerts nearby enemies							>> Default: true
r_chOn=false;//Allow channel switching keybinds						>> Default: false

//DEFAULT COSMETICS
r_Anim=false;//Animation when talking										>> Default: true
r_chat=true;//Hides chat UI if false												>> Default: true