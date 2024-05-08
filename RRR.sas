
/* to generate residual for each chemical while controling for the confounding of covariates*/

LIBNAME ep 'C:\nus_project\1st_nus_chemical_nutrition\formal_analysis\revision02202024'; options nofmterr;
data chemical_diet_final_analysis;
set ep.chemical_diet_final_analysis;
run;

%macro RunReg(y);
proc reg data=chemical_diet_final_analysis;
model &y=momage	energy PA_Tot_v0 momrace1 momrace2 momrace3 momBMI_group1 momBMI_group2 momedu1 momedu2 income_groupnew1 income_groupnew2 income_groupnew3 parity	Cotinine_group1 Cotinine_group2;
output out=&y residual=phat;
run;
%mend;

%RunReg(log_BetaHCH);
%RunReg(log_GammaHCH);
%RunReg(log_HCB);
%RunReg(log_Oxychlordane);
%RunReg(log_TransChlordane);
%RunReg(log_TransNo_chlor);
%RunReg(log_P_P_DDE);
%RunReg(log_O_P_DDD);
%RunReg(log_P_P_DDD);
%RunReg(log_P_P_DDT);
%RunReg(log_Mirex);
%RunReg(log_BDE28);
%RunReg(log_BDE47);
%RunReg(log_BDE100);
%RunReg(log_BDE99);
%RunReg(log_BDE85);
%RunReg(log_PBB153);
%RunReg(log_BDE154);
%RunReg(log_BDE153);
%RunReg(log_BDE183);
%RunReg(log_PCB5_8);
%RunReg(log_PCB18_17);
%RunReg(log_PCB31_28);
%RunReg(log_PCB33_20);
%RunReg(log_PCB22);
%RunReg(log_PCB52_73);
%RunReg(log_PCB49_43);
%RunReg(log_PCB47_48_75);
%RunReg(log_PCB44);
%RunReg(log_PCB41_64);
%RunReg(log_PCB74_61);
%RunReg(log_PCB70_76);
%RunReg(log_PCB66_80);
%RunReg(log_PCB93_95);
%RunReg(log_PCB90_101_89);
%RunReg(log_PCB99);
%RunReg(log_PCB110);
%RunReg(log_PCB118_106);
%RunReg(log_PCB114_122);
%RunReg(log_PCB105_127);
%RunReg(log_PCB146_161);
%RunReg(log_PCB153);
%RunReg(log_PCB137);
%RunReg(log_PCB138_158);
%RunReg(log_PCB128);
%RunReg(log_PCB167);
%RunReg(log_PCB156);
%RunReg(log_PCB157);
%RunReg(log_PCB182_187);
%RunReg(log_PCB183);
%RunReg(log_PCB177);
%RunReg(log_PCB172_192);
%RunReg(log_PCB180);
%RunReg(log_PCB170);
%RunReg(log_PCB202);
%RunReg(log_PCB199);
%RunReg(log_PCB196_203);
%RunReg(log_PCB195);
%RunReg(log_PCB194);
%RunReg(log_PCB208);
%RunReg(log_PCB206);
%RunReg(log_PCB209);
%RunReg(log_NMeFOSAA);
%RunReg(log_PFDS);
%RunReg(log_PFDoDA);
%RunReg(log_PFHpA);
%RunReg(log_PFHxS);
%RunReg(log_PFOS);
%RunReg(log_PFOA);
%RunReg(log_PFNA);
%RunReg(log_PFDA);
%RunReg(log_PFUnDA);
%RunReg(log_As);
%RunReg(log_Ba);
%RunReg(log_Cd);
%RunReg(log_Co);
%RunReg(log_Cr);
%RunReg(log_Cs);
%RunReg(log_Cu);
%RunReg(log_Hg);
%RunReg(log_Mn);
%RunReg(log_Mo);
%RunReg(log_Pb);
%RunReg(log_Sb);
%RunReg(log_Se);
%RunReg(log_Sn);
%RunReg(log_Tl);
%RunReg(log_Zn);
%RunReg(lg_totalocp);
%RunReg(lg_totalbdes);
%RunReg(lg_totalpcbs);
%RunReg(lg_totalpfas);
%RunReg(lg_totalmetals);

data log_BetaHCH;set log_BetaHCH;rename phat=log_BetaHCH_res;label Residual=_res;run;
data log_GammaHCH;set log_GammaHCH;rename phat=log_GammaHCH_res;label Residual=_res;run;
data log_HCB;set log_HCB;rename phat=log_HCB_res;label Residual=_res;run;
data log_Oxychlordane;set log_Oxychlordane;rename phat=log_Oxychlordane_res;label Residual=_res;run;
data log_TransChlordane;set log_TransChlordane;rename phat=log_TransChlordane_res;label Residual=_res;run;
data log_TransNo_chlor;set log_TransNo_chlor;rename phat=log_TransNo_chlor_res;label Residual=_res;run;
data log_P_P_DDE;set log_P_P_DDE;rename phat=log_P_P_DDE_res;label Residual=_res;run;
data log_O_P_DDD;set log_O_P_DDD;rename phat=log_O_P_DDD_res;label Residual=_res;run;
data log_P_P_DDD;set log_P_P_DDD;rename phat=log_P_P_DDD_res;label Residual=_res;run;
data log_P_P_DDT;set log_P_P_DDT;rename phat=log_P_P_DDT_res;label Residual=_res;run;
data log_Mirex;set log_Mirex;rename phat=log_Mirex_res;label Residual=_res;run;
data log_BDE28;set log_BDE28;rename phat=log_BDE28_res;label Residual=_res;run;
data log_BDE47;set log_BDE47;rename phat=log_BDE47_res;label Residual=_res;run;
data log_BDE100;set log_BDE100;rename phat=log_BDE100_res;label Residual=_res;run;
data log_BDE99;set log_BDE99;rename phat=log_BDE99_res;label Residual=_res;run;
data log_BDE85;set log_BDE85;rename phat=log_BDE85_res;label Residual=_res;run;
data log_PBB153;set log_PBB153;rename phat=log_PBB153_res;label Residual=_res;run;
data log_BDE154;set log_BDE154;rename phat=log_BDE154_res;label Residual=_res;run;
data log_BDE153;set log_BDE153;rename phat=log_BDE153_res;label Residual=_res;run;
data log_BDE183;set log_BDE183;rename phat=log_BDE183_res;label Residual=_res;run;
data log_PCB5_8;set log_PCB5_8;rename phat=log_PCB5_8_res;label Residual=_res;run;
data log_PCB18_17;set log_PCB18_17;rename phat=log_PCB18_17_res;label Residual=_res;run;
data log_PCB31_28;set log_PCB31_28;rename phat=log_PCB31_28_res;label Residual=_res;run;
data log_PCB33_20;set log_PCB33_20;rename phat=log_PCB33_20_res;label Residual=_res;run;
data log_PCB22;set log_PCB22;rename phat=log_PCB22_res;label Residual=_res;run;
data log_PCB52_73;set log_PCB52_73;rename phat=log_PCB52_73_res;label Residual=_res;run;
data log_PCB49_43;set log_PCB49_43;rename phat=log_PCB49_43_res;label Residual=_res;run;
data log_PCB47_48_75;set log_PCB47_48_75;rename phat=log_PCB47_48_75_res;label Residual=_res;run;
data log_PCB44;set log_PCB44;rename phat=log_PCB44_res;label Residual=_res;run;
data log_PCB41_64;set log_PCB41_64;rename phat=log_PCB41_64_res;label Residual=_res;run;
data log_PCB74_61;set log_PCB74_61;rename phat=log_PCB74_61_res;label Residual=_res;run;
data log_PCB70_76;set log_PCB70_76;rename phat=log_PCB70_76_res;label Residual=_res;run;
data log_PCB66_80;set log_PCB66_80;rename phat=log_PCB66_80_res;label Residual=_res;run;
data log_PCB93_95;set log_PCB93_95;rename phat=log_PCB93_95_res;label Residual=_res;run;
data log_PCB90_101_89;set log_PCB90_101_89;rename phat=log_PCB90_101_89_res;label Residual=_res;run;
data log_PCB99;set log_PCB99;rename phat=log_PCB99_res;label Residual=_res;run;
data log_PCB110;set log_PCB110;rename phat=log_PCB110_res;label Residual=_res;run;
data log_PCB118_106;set log_PCB118_106;rename phat=log_PCB118_106_res;label Residual=_res;run;
data log_PCB114_122;set log_PCB114_122;rename phat=log_PCB114_122_res;label Residual=_res;run;
data log_PCB105_127;set log_PCB105_127;rename phat=log_PCB105_127_res;label Residual=_res;run;
data log_PCB146_161;set log_PCB146_161;rename phat=log_PCB146_161_res;label Residual=_res;run;
data log_PCB153;set log_PCB153;rename phat=log_PCB153_res;label Residual=_res;run;
data log_PCB137;set log_PCB137;rename phat=log_PCB137_res;label Residual=_res;run;
data log_PCB138_158;set log_PCB138_158;rename phat=log_PCB138_158_res;label Residual=_res;run;
data log_PCB128;set log_PCB128;rename phat=log_PCB128_res;label Residual=_res;run;
data log_PCB167;set log_PCB167;rename phat=log_PCB167_res;label Residual=_res;run;
data log_PCB156;set log_PCB156;rename phat=log_PCB156_res;label Residual=_res;run;
data log_PCB157;set log_PCB157;rename phat=log_PCB157_res;label Residual=_res;run;
data log_PCB182_187;set log_PCB182_187;rename phat=log_PCB182_187_res;label Residual=_res;run;
data log_PCB183;set log_PCB183;rename phat=log_PCB183_res;label Residual=_res;run;
data log_PCB177;set log_PCB177;rename phat=log_PCB177_res;label Residual=_res;run;
data log_PCB172_192;set log_PCB172_192;rename phat=log_PCB172_192_res;label Residual=_res;run;
data log_PCB180;set log_PCB180;rename phat=log_PCB180_res;label Residual=_res;run;
data log_PCB170;set log_PCB170;rename phat=log_PCB170_res;label Residual=_res;run;
data log_PCB202;set log_PCB202;rename phat=log_PCB202_res;label Residual=_res;run;
data log_PCB199;set log_PCB199;rename phat=log_PCB199_res;label Residual=_res;run;
data log_PCB196_203;set log_PCB196_203;rename phat=log_PCB196_203_res;label Residual=_res;run;
data log_PCB195;set log_PCB195;rename phat=log_PCB195_res;label Residual=_res;run;
data log_PCB194;set log_PCB194;rename phat=log_PCB194_res;label Residual=_res;run;
data log_PCB208;set log_PCB208;rename phat=log_PCB208_res;label Residual=_res;run;
data log_PCB206;set log_PCB206;rename phat=log_PCB206_res;label Residual=_res;run;
data log_PCB209;set log_PCB209;rename phat=log_PCB209_res;label Residual=_res;run;
data log_NMeFOSAA;set log_NMeFOSAA;rename phat=log_NMeFOSAA_res;label Residual=_res;run;
data log_PFDS;set log_PFDS;rename phat=log_PFDS_res;label Residual=_res;run;
data log_PFDoDA;set log_PFDoDA;rename phat=log_PFDoDA_res;label Residual=_res;run;
data log_PFHpA;set log_PFHpA;rename phat=log_PFHpA_res;label Residual=_res;run;
data log_PFHxS;set log_PFHxS;rename phat=log_PFHxS_res;label Residual=_res;run;
data log_PFOS;set log_PFOS;rename phat=log_PFOS_res;label Residual=_res;run;
data log_PFOA;set log_PFOA;rename phat=log_PFOA_res;label Residual=_res;run;
data log_PFNA;set log_PFNA;rename phat=log_PFNA_res;label Residual=_res;run;
data log_PFDA;set log_PFDA;rename phat=log_PFDA_res;label Residual=_res;run;
data log_PFUnDA;set log_PFUnDA;rename phat=log_PFUnDA_res;label Residual=_res;run;
data log_As;set log_As;rename phat=log_As_res;label Residual=_res;run;
data log_Ba;set log_Ba;rename phat=log_Ba_res;label Residual=_res;run;
data log_Cd;set log_Cd;rename phat=log_Cd_res;label Residual=_res;run;
data log_Co;set log_Co;rename phat=log_Co_res;label Residual=_res;run;
data log_Cr;set log_Cr;rename phat=log_Cr_res;label Residual=_res;run;
data log_Cs;set log_Cs;rename phat=log_Cs_res;label Residual=_res;run;
data log_Cu;set log_Cu;rename phat=log_Cu_res;label Residual=_res;run;
data log_Hg;set log_Hg;rename phat=log_Hg_res;label Residual=_res;run;
data log_Mn;set log_Mn;rename phat=log_Mn_res;label Residual=_res;run;
data log_Mo;set log_Mo;rename phat=log_Mo_res;label Residual=_res;run;
data log_Pb;set log_Pb;rename phat=log_Pb_res;label Residual=_res;run;
data log_Sb;set log_Sb;rename phat=log_Sb_res;label Residual=_res;run;
data log_Se;set log_Se;rename phat=log_Se_res;label Residual=_res;run;
data log_Sn;set log_Sn;rename phat=log_Sn_res;label Residual=_res;run;
data log_Tl;set log_Tl;rename phat=log_Tl_res;label Residual=_res;run;
data log_Zn;set log_Zn;rename phat=log_Zn_res;label Residual=_res;run;
data lg_totalocp;set lg_totalocp;rename phat=lg_totalocp_res;label Residual=lg_totalocp_res;run;
data lg_totalbdes;set lg_totalbdes;rename phat=lg_totalbdes_res;label Residual=lg_totalbdes_res;run;
data lg_totalpcbs;set lg_totalpcbs;rename phat=lg_totalpcbs_res;label Residual=lg_totalpcbs_res;run;
data lg_totalpfas;set lg_totalpfas;rename phat=lg_totalpfas_res;label Residual=lg_totalpfas_res;run;
data lg_totalmetals;set lg_totalmetals;rename phat=lg_totalmetals_res;label Residual=lg_totalmetals_res;run;

data log_BetaHCH;set log_BetaHCH;keep subject log_BetaHCH_res;run;
data log_GammaHCH;set log_GammaHCH;keep subject log_GammaHCH_res;run;
data log_HCB;set log_HCB;keep subject log_HCB_res;run;
data log_Oxychlordane;set log_Oxychlordane;keep subject log_Oxychlordane_res;run;
data log_TransChlordane;set log_TransChlordane;keep subject log_TransChlordane_res;run;
data log_TransNo_chlor;set log_TransNo_chlor;keep subject log_TransNo_chlor_res;run;
data log_P_P_DDE;set log_P_P_DDE;keep subject log_P_P_DDE_res;run;
data log_O_P_DDD;set log_O_P_DDD;keep subject log_O_P_DDD_res;run;
data log_P_P_DDD;set log_P_P_DDD;keep subject log_P_P_DDD_res;run;
data log_P_P_DDT;set log_P_P_DDT;keep subject log_P_P_DDT_res;run;
data log_Mirex;set log_Mirex;keep subject log_Mirex_res;run;
data log_BDE28;set log_BDE28;keep subject log_BDE28_res;run;
data log_BDE47;set log_BDE47;keep subject log_BDE47_res;run;
data log_BDE100;set log_BDE100;keep subject log_BDE100_res;run;
data log_BDE99;set log_BDE99;keep subject log_BDE99_res;run;
data log_BDE85;set log_BDE85;keep subject log_BDE85_res;run;
data log_PBB153;set log_PBB153;keep subject log_PBB153_res;run;
data log_BDE154;set log_BDE154;keep subject log_BDE154_res;run;
data log_BDE153;set log_BDE153;keep subject log_BDE153_res;run;
data log_BDE183;set log_BDE183;keep subject log_BDE183_res;run;
data log_PCB5_8;set log_PCB5_8;keep subject log_PCB5_8_res;run;
data log_PCB18_17;set log_PCB18_17;keep subject log_PCB18_17_res;run;
data log_PCB31_28;set log_PCB31_28;keep subject log_PCB31_28_res;run;
data log_PCB33_20;set log_PCB33_20;keep subject log_PCB33_20_res;run;
data log_PCB22;set log_PCB22;keep subject log_PCB22_res;run;
data log_PCB52_73;set log_PCB52_73;keep subject log_PCB52_73_res;run;
data log_PCB49_43;set log_PCB49_43;keep subject log_PCB49_43_res;run;
data log_PCB47_48_75;set log_PCB47_48_75;keep subject log_PCB47_48_75_res;run;
data log_PCB44;set log_PCB44;keep subject log_PCB44_res;run;
data log_PCB41_64;set log_PCB41_64;keep subject log_PCB41_64_res;run;
data log_PCB74_61;set log_PCB74_61;keep subject log_PCB74_61_res;run;
data log_PCB70_76;set log_PCB70_76;keep subject log_PCB70_76_res;run;
data log_PCB66_80;set log_PCB66_80;keep subject log_PCB66_80_res;run;
data log_PCB93_95;set log_PCB93_95;keep subject log_PCB93_95_res;run;
data log_PCB90_101_89;set log_PCB90_101_89;keep subject log_PCB90_101_89_res;run;
data log_PCB99;set log_PCB99;keep subject log_PCB99_res;run;
data log_PCB110;set log_PCB110;keep subject log_PCB110_res;run;
data log_PCB118_106;set log_PCB118_106;keep subject log_PCB118_106_res;run;
data log_PCB114_122;set log_PCB114_122;keep subject log_PCB114_122_res;run;
data log_PCB105_127;set log_PCB105_127;keep subject log_PCB105_127_res;run;
data log_PCB146_161;set log_PCB146_161;keep subject log_PCB146_161_res;run;
data log_PCB153;set log_PCB153;keep subject log_PCB153_res;run;
data log_PCB137;set log_PCB137;keep subject log_PCB137_res;run;
data log_PCB138_158;set log_PCB138_158;keep subject log_PCB138_158_res;run;
data log_PCB128;set log_PCB128;keep subject log_PCB128_res;run;
data log_PCB167;set log_PCB167;keep subject log_PCB167_res;run;
data log_PCB156;set log_PCB156;keep subject log_PCB156_res;run;
data log_PCB157;set log_PCB157;keep subject log_PCB157_res;run;
data log_PCB182_187;set log_PCB182_187;keep subject log_PCB182_187_res;run;
data log_PCB183;set log_PCB183;keep subject log_PCB183_res;run;
data log_PCB177;set log_PCB177;keep subject log_PCB177_res;run;
data log_PCB172_192;set log_PCB172_192;keep subject log_PCB172_192_res;run;
data log_PCB180;set log_PCB180;keep subject log_PCB180_res;run;
data log_PCB170;set log_PCB170;keep subject log_PCB170_res;run;
data log_PCB202;set log_PCB202;keep subject log_PCB202_res;run;
data log_PCB199;set log_PCB199;keep subject log_PCB199_res;run;
data log_PCB196_203;set log_PCB196_203;keep subject log_PCB196_203_res;run;
data log_PCB195;set log_PCB195;keep subject log_PCB195_res;run;
data log_PCB194;set log_PCB194;keep subject log_PCB194_res;run;
data log_PCB208;set log_PCB208;keep subject log_PCB208_res;run;
data log_PCB206;set log_PCB206;keep subject log_PCB206_res;run;
data log_PCB209;set log_PCB209;keep subject log_PCB209_res;run;
data log_NMeFOSAA;set log_NMeFOSAA;keep subject log_NMeFOSAA_res;run;
data log_PFDS;set log_PFDS;keep subject log_PFDS_res;run;
data log_PFDoDA;set log_PFDoDA;keep subject log_PFDoDA_res;run;
data log_PFHpA;set log_PFHpA;keep subject log_PFHpA_res;run;
data log_PFHxS;set log_PFHxS;keep subject log_PFHxS_res;run;
data log_PFOS;set log_PFOS;keep subject log_PFOS_res;run;
data log_PFOA;set log_PFOA;keep subject log_PFOA_res;run;
data log_PFNA;set log_PFNA;keep subject log_PFNA_res;run;
data log_PFDA;set log_PFDA;keep subject log_PFDA_res;run;
data log_PFUnDA;set log_PFUnDA;keep subject log_PFUnDA_res;run;
data log_As;set log_As;keep subject log_As_res;run;
data log_Ba;set log_Ba;keep subject log_Ba_res;run;
data log_Cd;set log_Cd;keep subject log_Cd_res;run;
data log_Co;set log_Co;keep subject log_Co_res;run;
data log_Cr;set log_Cr;keep subject log_Cr_res;run;
data log_Cs;set log_Cs;keep subject log_Cs_res;run;
data log_Cu;set log_Cu;keep subject log_Cu_res;run;
data log_Hg;set log_Hg;keep subject log_Hg_res;run;
data log_Mn;set log_Mn;keep subject log_Mn_res;run;
data log_Mo;set log_Mo;keep subject log_Mo_res;run;
data log_Pb;set log_Pb;keep subject log_Pb_res;run;
data log_Sb;set log_Sb;keep subject log_Sb_res;run;
data log_Se;set log_Se;keep subject log_Se_res;run;
data log_Sn;set log_Sn;keep subject log_Sn_res;run;
data log_Tl;set log_Tl;keep subject log_Tl_res;run;
data log_Zn;set log_Zn;keep subject log_Zn_res;run;
data lg_totalocp;set lg_totalocp;keep subject lg_totalocp_res;run;
data lg_totalbdes;set lg_totalbdes;keep subject lg_totalbdes_res;run;
data lg_totalpcbs;set lg_totalpcbs;keep subject lg_totalpcbs_res;run;
data lg_totalpfas;set lg_totalpfas;keep subject lg_totalpfas_res;run;
data lg_totalmetals;set lg_totalmetals;keep subject lg_totalmetals_res;run;


DATA RESIDUAL; 
MERGE log_BetaHCH log_GammaHCH log_HCB log_Oxychlordane log_TransChlordane log_TransNo_chlor log_P_P_DDE log_O_P_DDD log_P_P_DDD log_P_P_DDT log_Mirex log_BDE28 log_BDE47 log_BDE100 log_BDE99 log_BDE85 log_PBB153
 log_BDE154 log_BDE153 log_BDE183 log_PCB5_8 log_PCB18_17 log_PCB31_28 log_PCB33_20 log_PCB22 log_PCB52_73 log_PCB49_43 log_PCB47_48_75 log_PCB44 log_PCB41_64 log_PCB74_61 log_PCB70_76 log_PCB66_80 log_PCB93_95 log_PCB90_101_89
 log_PCB99 log_PCB110 log_PCB118_106 log_PCB114_122 log_PCB105_127 log_PCB146_161 log_PCB153 log_PCB137 log_PCB138_158 log_PCB128 log_PCB167 log_PCB156 log_PCB157 log_PCB182_187 log_PCB183 log_PCB177 log_PCB172_192
 log_PCB180 log_PCB170 log_PCB202 log_PCB199 log_PCB196_203 log_PCB195 log_PCB194 log_PCB208 log_PCB206 log_PCB209 log_NMeFOSAA log_PFDS log_PFDoDA log_PFHpA log_PFHxS log_PFOS log_PFOA log_PFNA log_PFDA log_PFUnDA
 log_As log_Ba log_Cd log_Co log_Cr log_Cs log_Cu log_Hg log_Mn log_Mo log_Pb log_Sb log_Se log_Sn log_Tl log_Zn	lg_totalocp	lg_totalbdes	lg_totalpcbs	lg_totalpfas	lg_totalmetals; 
BY subject; 
RUN;

proc sort data=chemical_diet_final_analysis;
by subject;
run;

DATA chemical_diet_final_analysis_res; 
MERGE chemical_diet_final_analysis	RESIDUAL; 
BY subject; 
RUN;

data ep.chemical_diet_final_analysis_res;
set chemical_diet_final_analysis_res;
run;

/* update the ordinary RRR results*/

LIBNAME ep 'C:\nus_project\1st_nus_chemical_nutrition\formal_analysis\revision02202024'; options nofmterr;
ods output xloadings=xloadings xweights=xweights 
yweights=yweights;
proc pls data=ep.chemical_diet_final_analysis_res nfac=5 method=rrr 
details censcale varss;
model lg_totalocp_res lg_totalbdes_res lg_totalpcbs_res lg_totalpfas_res lg_totalmetals_res=DASH_ssbnj_s	MED_nut_s	DASH_lfdairy_s	DASH_rpmeat_s	MED_meat_s	AHEI_ssb_s	MED_legume_s	MED_fish_s	MED_dairy_s	DASH_nutlegume_s	MED_mufa_saf_r	AHEI_transfat_p	DASH_vegetable_s	AHEI_wfruit_s	AHEI_PUFA_p	DASH_fruit_s	DASH_wgrain_g	MED_grain_g	AHEI_n3_mg	MED_fruit_nut_g	DASH_sodium_mg/solution;
output out=pattern xscore=scorex_lg_totalchem yscore=scorey_lg_totalchem;
run;
data rrr_pattern_goodgroup_totalchems;
set Pattern;
run;

data totalchem_loading;
set Xloadings;
run;

ods output xloadings=xloadings xweights=xweights 
yweights=yweights;
proc pls data=ep.chemical_diet_final_analysis_res nfac=5 method=rrr 
details censcale varss;
model log_BetaHCH_res log_GammaHCH_res log_HCB_res log_Oxychlordane_res log_TransChlordane_res log_TransNo_chlor_res log_P_P_DDE_res log_O_P_DDD_res log_P_P_DDD_res log_P_P_DDT_res log_Mirex_res=DASH_ssbnj_s	MED_nut_s	DASH_lfdairy_s	DASH_rpmeat_s	MED_meat_s	AHEI_ssb_s	MED_legume_s	MED_fish_s	MED_dairy_s	DASH_nutlegume_s	MED_mufa_saf_r	AHEI_transfat_p	DASH_vegetable_s	AHEI_wfruit_s	AHEI_PUFA_p	DASH_fruit_s	DASH_wgrain_g	MED_grain_g	AHEI_n3_mg	MED_fruit_nut_g	DASH_sodium_mg/solution;
output out=pattern xscore=scorex_lg_ocp yscore=scorey_lg_ocp;
run;
data rrr_pattern_goodgroup_ocp;
set Pattern;
run;

data ocp_loading;
set Xloadings;
run;


ods output xloadings=xloadings xweights=xweights 
yweights=yweights;
proc pls data=ep.chemical_diet_final_analysis_res nfac=3 method=rrr 
details censcale varss;
model log_BDE28_res log_BDE47_res log_BDE100_res log_BDE99_res log_BDE85_res log_PBB153_res log_BDE154_res log_BDE153_res log_BDE183_res=DASH_ssbnj_s	MED_nut_s	DASH_lfdairy_s	DASH_rpmeat_s	MED_meat_s	AHEI_ssb_s	MED_legume_s	MED_fish_s	MED_dairy_s	DASH_nutlegume_s	MED_mufa_saf_r	AHEI_transfat_p	DASH_vegetable_s	AHEI_wfruit_s	AHEI_PUFA_p	DASH_fruit_s	DASH_wgrain_g	MED_grain_g	AHEI_n3_mg	MED_fruit_nut_g	DASH_sodium_mg/solution;
output out=pattern xscore=scorex_lg_pbde yscore=scorey_lg_pbde;
run;
data rrr_pattern_goodgroup_pbde;
set Pattern;
run;

data pbde_loading;
set Xloadings;
run;


ods output xloadings=xloadings xweights=xweights 
yweights=yweights;
proc pls data=ep.chemical_diet_final_analysis_res nfac=7 method=rrr 
details censcale varss;
model log_PCB5_8_res log_PCB18_17_res log_PCB31_28_res log_PCB33_20_res log_PCB22_res log_PCB52_73_res log_PCB49_43_res log_PCB47_48_75_res log_PCB44_res log_PCB41_64_res log_PCB74_61_res log_PCB70_76_res log_PCB66_80_res log_PCB93_95_res
 log_PCB90_101_89_res log_PCB99_res log_PCB110_res log_PCB118_106_res log_PCB114_122_res log_PCB105_127_res log_PCB146_161_res log_PCB153_res log_PCB137_res log_PCB138_158_res log_PCB128_res log_PCB167_res log_PCB156_res log_PCB157_res
 log_PCB182_187_res log_PCB183_res log_PCB177_res log_PCB172_192_res log_PCB180_res log_PCB170_res log_PCB202_res log_PCB199_res log_PCB196_203_res log_PCB195_res log_PCB194_res log_PCB208_res log_PCB206_res log_PCB209_res
=DASH_ssbnj_s	MED_nut_s	DASH_lfdairy_s	DASH_rpmeat_s	MED_meat_s	AHEI_ssb_s	MED_legume_s	MED_fish_s	MED_dairy_s	DASH_nutlegume_s	MED_mufa_saf_r	AHEI_transfat_p	DASH_vegetable_s	AHEI_wfruit_s	AHEI_PUFA_p	DASH_fruit_s	DASH_wgrain_g	MED_grain_g	AHEI_n3_mg	MED_fruit_nut_g	DASH_sodium_mg/solution;
output out=pattern xscore=scorex_lg_pcb yscore=scorey_lg_pcb;
run;
data rrr_pattern_goodgroup_pcb;
set Pattern;
run;

data pcb_loading;
set Xloadings;
run;


ods output xloadings=xloadings xweights=xweights 
yweights=yweights;
proc pls data=ep.chemical_diet_final_analysis_res nfac=7 method=rrr 
details censcale varss;
model log_NMeFOSAA_res log_PFDS_res log_PFDoDA_res log_PFHpA_res log_PFHxS_res log_PFOS_res log_PFOA_res log_PFNA_res log_PFDA_res log_PFUnDA_res=DASH_ssbnj_s	MED_nut_s	DASH_lfdairy_s	DASH_rpmeat_s	MED_meat_s	AHEI_ssb_s	MED_legume_s	MED_fish_s	MED_dairy_s	DASH_nutlegume_s	MED_mufa_saf_r	AHEI_transfat_p	DASH_vegetable_s	AHEI_wfruit_s	AHEI_PUFA_p	DASH_fruit_s	DASH_wgrain_g	MED_grain_g	AHEI_n3_mg	MED_fruit_nut_g	DASH_sodium_mg/solution;
output out=pattern xscore=scorex_lg_pfas yscore=scorey_lg_pfas;
run;
data rrr_pattern_goodgroup_pfas;
set Pattern;
run;

data pfas_loading;
set Xloadings;
run;


ods output xloadings=xloadings xweights=xweights 
yweights=yweights;
proc pls data=ep.chemical_diet_final_analysis_res nfac=8 method=rrr 
details censcale varss;
model log_As_res log_Ba_res log_Cd_res log_Co_res log_Cr_res log_Cs_res log_Cu_res log_Hg_res log_Mn_res log_Mo_res log_Pb_res log_Sb_res log_Se_res log_Sn_res log_Tl_res log_Zn_res=DASH_ssbnj_s	MED_nut_s	DASH_lfdairy_s	DASH_rpmeat_s	MED_meat_s	AHEI_ssb_s	MED_legume_s	MED_fish_s	MED_dairy_s	DASH_nutlegume_s	MED_mufa_saf_r	AHEI_transfat_p	DASH_vegetable_s	AHEI_wfruit_s	AHEI_PUFA_p	DASH_fruit_s	DASH_wgrain_g	MED_grain_g	AHEI_n3_mg	MED_fruit_nut_g	DASH_sodium_mg/solution;
output out=pattern xscore=scorex_lg_metal yscore=scorey_lg_metal;
run;
data rrr_pattern_goodgroup_metal;
set Pattern;
run;

data metal_loading;
set Xloadings;
run;


data combined_loading_factors;
set totalchem_loading
ocp_loading
pbde_loading
pcb_loading
pfas_loading
metal_loading;
by NumberOfFactors;
run;

PROC EXPORT DATA=combined_loading_factors
OUTFILE= "C:\nus_project\1st_nus_chemical_nutrition\formal_analysis\revision02202024\combined_loading_factors0226.xlsx"
DBMS=XLSX REPLACE;
SHEET="Sheet1";
RUN;
