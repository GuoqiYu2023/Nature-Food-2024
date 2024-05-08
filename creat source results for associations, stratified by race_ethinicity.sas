
/* associations of each dietary pattern scores with each chemicals, stratified by race/ethnicity */

LIBNAME ep 'C:\nus_project\1st_nus_chemical_nutrition\formal_analysis\revision02202024'; options nofmterr;
data ep.chemical_diet_starti_race0;
set ep.chemical_diet_final_analysis;
if momrace=0 then output;
run;
data ep.chemical_diet_starti_race1;
set ep.chemical_diet_final_analysis;
if momrace=1 then output;
run;
data ep.chemical_diet_starti_race2;
set ep.chemical_diet_final_analysis;
if momrace=2 then output;
run;
data ep.chemical_diet_starti_race3;
set ep.chemical_diet_final_analysis;
if momrace=3 then output;
run;

LIBNAME ep 'C:\nus_project\1st_nus_chemical_nutrition\formal_analysis\revision02202024'; options nofmterr;
data chemical_diet_starti_race0;
set ep.chemical_diet_starti_race0;
run;
%macro RunReg(y,x);
PROC reg data=chemical_diet_starti_race0;
ods output ParameterEstimates=adjusted&y;
model &y=&x momage energy	PA_Tot_v0 momrace1 momrace2 momrace3 momBMI_group1 momBMI_group2 momedu1 momedu2 income_groupnew1 income_groupnew2 income_groupnew3 parity	Cotinine_group1 Cotinine_group2/TOL VIF COLLIN DW INFLUENCE;
run;
%mend;

%RunReg(log_BetaHCH,aMed_noalc);
%RunReg(log_GammaHCH,aMed_noalc);
%RunReg(log_HCB,aMed_noalc);
%RunReg(log_Oxychlordane,aMed_noalc);
%RunReg(log_TransChlordane,aMed_noalc);
%RunReg(log_TransNo_chlor,aMed_noalc);
%RunReg(log_P_P_DDE,aMed_noalc);
%RunReg(log_O_P_DDD,aMed_noalc);
%RunReg(log_P_P_DDD,aMed_noalc);
%RunReg(log_P_P_DDT,aMed_noalc);
%RunReg(log_Mirex,aMed_noalc);
%RunReg(log_BDE28,aMed_noalc);
%RunReg(log_BDE47,aMed_noalc);
%RunReg(log_BDE100,aMed_noalc);
%RunReg(log_BDE99,aMed_noalc);
%RunReg(log_BDE85,aMed_noalc);
%RunReg(log_PBB153,aMed_noalc);
%RunReg(log_BDE154,aMed_noalc);
%RunReg(log_BDE153,aMed_noalc);
%RunReg(log_BDE183,aMed_noalc);
%RunReg(log_PCB5_8,aMed_noalc);
%RunReg(log_PCB18_17,aMed_noalc);
%RunReg(log_PCB31_28,aMed_noalc);
%RunReg(log_PCB33_20,aMed_noalc);
%RunReg(log_PCB22,aMed_noalc);
%RunReg(log_PCB52_73,aMed_noalc);
%RunReg(log_PCB49_43,aMed_noalc);
%RunReg(log_PCB47_48_75,aMed_noalc);
%RunReg(log_PCB44,aMed_noalc);
%RunReg(log_PCB41_64,aMed_noalc);
%RunReg(log_PCB74_61,aMed_noalc);
%RunReg(log_PCB70_76,aMed_noalc);
%RunReg(log_PCB66_80,aMed_noalc);
%RunReg(log_PCB93_95,aMed_noalc);
%RunReg(log_PCB90_101_89,aMed_noalc);
%RunReg(log_PCB99,aMed_noalc);
%RunReg(log_PCB110,aMed_noalc);
%RunReg(log_PCB118_106,aMed_noalc);
%RunReg(log_PCB114_122,aMed_noalc);
%RunReg(log_PCB105_127,aMed_noalc);
%RunReg(log_PCB146_161,aMed_noalc);
%RunReg(log_PCB153,aMed_noalc);
%RunReg(log_PCB137,aMed_noalc);
%RunReg(log_PCB138_158,aMed_noalc);
%RunReg(log_PCB128,aMed_noalc);
%RunReg(log_PCB167,aMed_noalc);
%RunReg(log_PCB156,aMed_noalc);
%RunReg(log_PCB157,aMed_noalc);
%RunReg(log_PCB182_187,aMed_noalc);
%RunReg(log_PCB183,aMed_noalc);
%RunReg(log_PCB177,aMed_noalc);
%RunReg(log_PCB172_192,aMed_noalc);
%RunReg(log_PCB180,aMed_noalc);
%RunReg(log_PCB170,aMed_noalc);
%RunReg(log_PCB202,aMed_noalc);
%RunReg(log_PCB199,aMed_noalc);
%RunReg(log_PCB196_203,aMed_noalc);
%RunReg(log_PCB195,aMed_noalc);
%RunReg(log_PCB194,aMed_noalc);
%RunReg(log_PCB208,aMed_noalc);
%RunReg(log_PCB206,aMed_noalc);
%RunReg(log_PCB209,aMed_noalc);
%RunReg(log_NMeFOSAA,aMed_noalc);
%RunReg(log_PFDS,aMed_noalc);
%RunReg(log_PFDoDA,aMed_noalc);
%RunReg(log_PFHpA,aMed_noalc);
%RunReg(log_PFHxS,aMed_noalc);
%RunReg(log_PFOS,aMed_noalc);
%RunReg(log_PFOA,aMed_noalc);
%RunReg(log_PFNA,aMed_noalc);
%RunReg(log_PFDA,aMed_noalc);
%RunReg(log_PFUnDA,aMed_noalc);
%RunReg(log_As,aMed_noalc);
%RunReg(log_Ba,aMed_noalc);
%RunReg(log_Cd,aMed_noalc);
%RunReg(log_Co,aMed_noalc);
%RunReg(log_Cr,aMed_noalc);
%RunReg(log_Cs,aMed_noalc);
%RunReg(log_Cu,aMed_noalc);
%RunReg(log_Hg,aMed_noalc);
%RunReg(log_Mn,aMed_noalc);
%RunReg(log_Mo,aMed_noalc);
%RunReg(log_Pb,aMed_noalc);
%RunReg(log_Sb,aMed_noalc);
%RunReg(log_Se,aMed_noalc);
%RunReg(log_Sn,aMed_noalc);
%RunReg(log_Tl,aMed_noalc);
%RunReg(log_Zn,aMed_noalc);

%RunReg(lg_totalocp,aMed_noalc);
%RunReg(lg_totalbdes,aMed_noalc);
%RunReg(lg_totalpcbs,aMed_noalc);
%RunReg(lg_totalpfas,aMed_noalc);
%RunReg(lg_totalmetals,aMed_noalc);

data adjusted;
 set adjusted:;
run;

PROC EXPORT DATA=adjusted
OUTFILE= "C:\nus_project\1st_nus_chemical_nutrition\formal_analysis\revision02202024\associationdp_chemical_stra_byrace.xlsx"
DBMS=XLSX REPLACE;
SHEET="race0_aMed_noalc";
RUN;

proc datasets library=work nolist nodetails kill;
run; quit;

LIBNAME ep 'C:\nus_project\1st_nus_chemical_nutrition\formal_analysis\revision02202024'; options nofmterr;
data chemical_diet_starti_race0;
set ep.chemical_diet_starti_race0;
run;

%RunReg(log_BetaHCH,AHEI_noalc);
%RunReg(log_GammaHCH,AHEI_noalc);
%RunReg(log_HCB,AHEI_noalc);
%RunReg(log_Oxychlordane,AHEI_noalc);
%RunReg(log_TransChlordane,AHEI_noalc);
%RunReg(log_TransNo_chlor,AHEI_noalc);
%RunReg(log_P_P_DDE,AHEI_noalc);
%RunReg(log_O_P_DDD,AHEI_noalc);
%RunReg(log_P_P_DDD,AHEI_noalc);
%RunReg(log_P_P_DDT,AHEI_noalc);
%RunReg(log_Mirex,AHEI_noalc);
%RunReg(log_BDE28,AHEI_noalc);
%RunReg(log_BDE47,AHEI_noalc);
%RunReg(log_BDE100,AHEI_noalc);
%RunReg(log_BDE99,AHEI_noalc);
%RunReg(log_BDE85,AHEI_noalc);
%RunReg(log_PBB153,AHEI_noalc);
%RunReg(log_BDE154,AHEI_noalc);
%RunReg(log_BDE153,AHEI_noalc);
%RunReg(log_BDE183,AHEI_noalc);
%RunReg(log_PCB5_8,AHEI_noalc);
%RunReg(log_PCB18_17,AHEI_noalc);
%RunReg(log_PCB31_28,AHEI_noalc);
%RunReg(log_PCB33_20,AHEI_noalc);
%RunReg(log_PCB22,AHEI_noalc);
%RunReg(log_PCB52_73,AHEI_noalc);
%RunReg(log_PCB49_43,AHEI_noalc);
%RunReg(log_PCB47_48_75,AHEI_noalc);
%RunReg(log_PCB44,AHEI_noalc);
%RunReg(log_PCB41_64,AHEI_noalc);
%RunReg(log_PCB74_61,AHEI_noalc);
%RunReg(log_PCB70_76,AHEI_noalc);
%RunReg(log_PCB66_80,AHEI_noalc);
%RunReg(log_PCB93_95,AHEI_noalc);
%RunReg(log_PCB90_101_89,AHEI_noalc);
%RunReg(log_PCB99,AHEI_noalc);
%RunReg(log_PCB110,AHEI_noalc);
%RunReg(log_PCB118_106,AHEI_noalc);
%RunReg(log_PCB114_122,AHEI_noalc);
%RunReg(log_PCB105_127,AHEI_noalc);
%RunReg(log_PCB146_161,AHEI_noalc);
%RunReg(log_PCB153,AHEI_noalc);
%RunReg(log_PCB137,AHEI_noalc);
%RunReg(log_PCB138_158,AHEI_noalc);
%RunReg(log_PCB128,AHEI_noalc);
%RunReg(log_PCB167,AHEI_noalc);
%RunReg(log_PCB156,AHEI_noalc);
%RunReg(log_PCB157,AHEI_noalc);
%RunReg(log_PCB182_187,AHEI_noalc);
%RunReg(log_PCB183,AHEI_noalc);
%RunReg(log_PCB177,AHEI_noalc);
%RunReg(log_PCB172_192,AHEI_noalc);
%RunReg(log_PCB180,AHEI_noalc);
%RunReg(log_PCB170,AHEI_noalc);
%RunReg(log_PCB202,AHEI_noalc);
%RunReg(log_PCB199,AHEI_noalc);
%RunReg(log_PCB196_203,AHEI_noalc);
%RunReg(log_PCB195,AHEI_noalc);
%RunReg(log_PCB194,AHEI_noalc);
%RunReg(log_PCB208,AHEI_noalc);
%RunReg(log_PCB206,AHEI_noalc);
%RunReg(log_PCB209,AHEI_noalc);
%RunReg(log_NMeFOSAA,AHEI_noalc);
%RunReg(log_PFDS,AHEI_noalc);
%RunReg(log_PFDoDA,AHEI_noalc);
%RunReg(log_PFHpA,AHEI_noalc);
%RunReg(log_PFHxS,AHEI_noalc);
%RunReg(log_PFOS,AHEI_noalc);
%RunReg(log_PFOA,AHEI_noalc);
%RunReg(log_PFNA,AHEI_noalc);
%RunReg(log_PFDA,AHEI_noalc);
%RunReg(log_PFUnDA,AHEI_noalc);
%RunReg(log_As,AHEI_noalc);
%RunReg(log_Ba,AHEI_noalc);
%RunReg(log_Cd,AHEI_noalc);
%RunReg(log_Co,AHEI_noalc);
%RunReg(log_Cr,AHEI_noalc);
%RunReg(log_Cs,AHEI_noalc);
%RunReg(log_Cu,AHEI_noalc);
%RunReg(log_Hg,AHEI_noalc);
%RunReg(log_Mn,AHEI_noalc);
%RunReg(log_Mo,AHEI_noalc);
%RunReg(log_Pb,AHEI_noalc);
%RunReg(log_Sb,AHEI_noalc);
%RunReg(log_Se,AHEI_noalc);
%RunReg(log_Sn,AHEI_noalc);
%RunReg(log_Tl,AHEI_noalc);
%RunReg(log_Zn,AHEI_noalc);

%RunReg(lg_totalocp,AHEI_noalc);
%RunReg(lg_totalbdes,AHEI_noalc);
%RunReg(lg_totalpcbs,AHEI_noalc);
%RunReg(lg_totalpfas,AHEI_noalc);
%RunReg(lg_totalmetals,AHEI_noalc);

data adjusted;
 set adjusted:;
run;

PROC EXPORT DATA=adjusted
OUTFILE= "C:\nus_project\1st_nus_chemical_nutrition\formal_analysis\revision02202024\associationdp_chemical_stra_byrace.xlsx"
DBMS=XLSX REPLACE;
SHEET="race0_AHEI_noalc";
RUN;

proc datasets library=work nolist nodetails kill;
run; quit;

LIBNAME ep 'C:\nus_project\1st_nus_chemical_nutrition\formal_analysis\revision02202024'; options nofmterr;
data chemical_diet_starti_race0;
set ep.chemical_diet_starti_race0;
run;

%RunReg(log_BetaHCH,DASH);
%RunReg(log_GammaHCH,DASH);
%RunReg(log_HCB,DASH);
%RunReg(log_Oxychlordane,DASH);
%RunReg(log_TransChlordane,DASH);
%RunReg(log_TransNo_chlor,DASH);
%RunReg(log_P_P_DDE,DASH);
%RunReg(log_O_P_DDD,DASH);
%RunReg(log_P_P_DDD,DASH);
%RunReg(log_P_P_DDT,DASH);
%RunReg(log_Mirex,DASH);
%RunReg(log_BDE28,DASH);
%RunReg(log_BDE47,DASH);
%RunReg(log_BDE100,DASH);
%RunReg(log_BDE99,DASH);
%RunReg(log_BDE85,DASH);
%RunReg(log_PBB153,DASH);
%RunReg(log_BDE154,DASH);
%RunReg(log_BDE153,DASH);
%RunReg(log_BDE183,DASH);
%RunReg(log_PCB5_8,DASH);
%RunReg(log_PCB18_17,DASH);
%RunReg(log_PCB31_28,DASH);
%RunReg(log_PCB33_20,DASH);
%RunReg(log_PCB22,DASH);
%RunReg(log_PCB52_73,DASH);
%RunReg(log_PCB49_43,DASH);
%RunReg(log_PCB47_48_75,DASH);
%RunReg(log_PCB44,DASH);
%RunReg(log_PCB41_64,DASH);
%RunReg(log_PCB74_61,DASH);
%RunReg(log_PCB70_76,DASH);
%RunReg(log_PCB66_80,DASH);
%RunReg(log_PCB93_95,DASH);
%RunReg(log_PCB90_101_89,DASH);
%RunReg(log_PCB99,DASH);
%RunReg(log_PCB110,DASH);
%RunReg(log_PCB118_106,DASH);
%RunReg(log_PCB114_122,DASH);
%RunReg(log_PCB105_127,DASH);
%RunReg(log_PCB146_161,DASH);
%RunReg(log_PCB153,DASH);
%RunReg(log_PCB137,DASH);
%RunReg(log_PCB138_158,DASH);
%RunReg(log_PCB128,DASH);
%RunReg(log_PCB167,DASH);
%RunReg(log_PCB156,DASH);
%RunReg(log_PCB157,DASH);
%RunReg(log_PCB182_187,DASH);
%RunReg(log_PCB183,DASH);
%RunReg(log_PCB177,DASH);
%RunReg(log_PCB172_192,DASH);
%RunReg(log_PCB180,DASH);
%RunReg(log_PCB170,DASH);
%RunReg(log_PCB202,DASH);
%RunReg(log_PCB199,DASH);
%RunReg(log_PCB196_203,DASH);
%RunReg(log_PCB195,DASH);
%RunReg(log_PCB194,DASH);
%RunReg(log_PCB208,DASH);
%RunReg(log_PCB206,DASH);
%RunReg(log_PCB209,DASH);
%RunReg(log_NMeFOSAA,DASH);
%RunReg(log_PFDS,DASH);
%RunReg(log_PFDoDA,DASH);
%RunReg(log_PFHpA,DASH);
%RunReg(log_PFHxS,DASH);
%RunReg(log_PFOS,DASH);
%RunReg(log_PFOA,DASH);
%RunReg(log_PFNA,DASH);
%RunReg(log_PFDA,DASH);
%RunReg(log_PFUnDA,DASH);
%RunReg(log_As,DASH);
%RunReg(log_Ba,DASH);
%RunReg(log_Cd,DASH);
%RunReg(log_Co,DASH);
%RunReg(log_Cr,DASH);
%RunReg(log_Cs,DASH);
%RunReg(log_Cu,DASH);
%RunReg(log_Hg,DASH);
%RunReg(log_Mn,DASH);
%RunReg(log_Mo,DASH);
%RunReg(log_Pb,DASH);
%RunReg(log_Sb,DASH);
%RunReg(log_Se,DASH);
%RunReg(log_Sn,DASH);
%RunReg(log_Tl,DASH);
%RunReg(log_Zn,DASH);

%RunReg(lg_totalocp,DASH);
%RunReg(lg_totalbdes,DASH);
%RunReg(lg_totalpcbs,DASH);
%RunReg(lg_totalpfas,DASH);
%RunReg(lg_totalmetals,DASH);

data adjusted;
 set adjusted:;
run;

PROC EXPORT DATA=adjusted
OUTFILE= "C:\nus_project\1st_nus_chemical_nutrition\formal_analysis\revision02202024\associationdp_chemical_stra_byrace.xlsx"
DBMS=XLSX REPLACE;
SHEET="race0_DASH";
RUN;

proc datasets library=work nolist nodetails kill;
run; quit;

LIBNAME ep 'C:\nus_project\1st_nus_chemical_nutrition\formal_analysis\revision02202024'; options nofmterr;
data chemical_diet_starti_race1;
set ep.chemical_diet_starti_race1;
run;
%macro RunReg(y,x);
PROC reg data=chemical_diet_starti_race1;
ods output ParameterEstimates=adjusted&y;
model &y=&x momage energy	PA_Tot_v0 momrace1 momrace2 momrace3 momBMI_group1 momBMI_group2 momedu1 momedu2 income_groupnew1 income_groupnew2 income_groupnew3 parity	Cotinine_group1 Cotinine_group2/TOL VIF COLLIN DW INFLUENCE;
run;
%mend;

%RunReg(log_BetaHCH,aMed_noalc);
%RunReg(log_GammaHCH,aMed_noalc);
%RunReg(log_HCB,aMed_noalc);
%RunReg(log_Oxychlordane,aMed_noalc);
%RunReg(log_TransChlordane,aMed_noalc);
%RunReg(log_TransNo_chlor,aMed_noalc);
%RunReg(log_P_P_DDE,aMed_noalc);
%RunReg(log_O_P_DDD,aMed_noalc);
%RunReg(log_P_P_DDD,aMed_noalc);
%RunReg(log_P_P_DDT,aMed_noalc);
%RunReg(log_Mirex,aMed_noalc);
%RunReg(log_BDE28,aMed_noalc);
%RunReg(log_BDE47,aMed_noalc);
%RunReg(log_BDE100,aMed_noalc);
%RunReg(log_BDE99,aMed_noalc);
%RunReg(log_BDE85,aMed_noalc);
%RunReg(log_PBB153,aMed_noalc);
%RunReg(log_BDE154,aMed_noalc);
%RunReg(log_BDE153,aMed_noalc);
%RunReg(log_BDE183,aMed_noalc);
%RunReg(log_PCB5_8,aMed_noalc);
%RunReg(log_PCB18_17,aMed_noalc);
%RunReg(log_PCB31_28,aMed_noalc);
%RunReg(log_PCB33_20,aMed_noalc);
%RunReg(log_PCB22,aMed_noalc);
%RunReg(log_PCB52_73,aMed_noalc);
%RunReg(log_PCB49_43,aMed_noalc);
%RunReg(log_PCB47_48_75,aMed_noalc);
%RunReg(log_PCB44,aMed_noalc);
%RunReg(log_PCB41_64,aMed_noalc);
%RunReg(log_PCB74_61,aMed_noalc);
%RunReg(log_PCB70_76,aMed_noalc);
%RunReg(log_PCB66_80,aMed_noalc);
%RunReg(log_PCB93_95,aMed_noalc);
%RunReg(log_PCB90_101_89,aMed_noalc);
%RunReg(log_PCB99,aMed_noalc);
%RunReg(log_PCB110,aMed_noalc);
%RunReg(log_PCB118_106,aMed_noalc);
%RunReg(log_PCB114_122,aMed_noalc);
%RunReg(log_PCB105_127,aMed_noalc);
%RunReg(log_PCB146_161,aMed_noalc);
%RunReg(log_PCB153,aMed_noalc);
%RunReg(log_PCB137,aMed_noalc);
%RunReg(log_PCB138_158,aMed_noalc);
%RunReg(log_PCB128,aMed_noalc);
%RunReg(log_PCB167,aMed_noalc);
%RunReg(log_PCB156,aMed_noalc);
%RunReg(log_PCB157,aMed_noalc);
%RunReg(log_PCB182_187,aMed_noalc);
%RunReg(log_PCB183,aMed_noalc);
%RunReg(log_PCB177,aMed_noalc);
%RunReg(log_PCB172_192,aMed_noalc);
%RunReg(log_PCB180,aMed_noalc);
%RunReg(log_PCB170,aMed_noalc);
%RunReg(log_PCB202,aMed_noalc);
%RunReg(log_PCB199,aMed_noalc);
%RunReg(log_PCB196_203,aMed_noalc);
%RunReg(log_PCB195,aMed_noalc);
%RunReg(log_PCB194,aMed_noalc);
%RunReg(log_PCB208,aMed_noalc);
%RunReg(log_PCB206,aMed_noalc);
%RunReg(log_PCB209,aMed_noalc);
%RunReg(log_NMeFOSAA,aMed_noalc);
%RunReg(log_PFDS,aMed_noalc);
%RunReg(log_PFDoDA,aMed_noalc);
%RunReg(log_PFHpA,aMed_noalc);
%RunReg(log_PFHxS,aMed_noalc);
%RunReg(log_PFOS,aMed_noalc);
%RunReg(log_PFOA,aMed_noalc);
%RunReg(log_PFNA,aMed_noalc);
%RunReg(log_PFDA,aMed_noalc);
%RunReg(log_PFUnDA,aMed_noalc);
%RunReg(log_As,aMed_noalc);
%RunReg(log_Ba,aMed_noalc);
%RunReg(log_Cd,aMed_noalc);
%RunReg(log_Co,aMed_noalc);
%RunReg(log_Cr,aMed_noalc);
%RunReg(log_Cs,aMed_noalc);
%RunReg(log_Cu,aMed_noalc);
%RunReg(log_Hg,aMed_noalc);
%RunReg(log_Mn,aMed_noalc);
%RunReg(log_Mo,aMed_noalc);
%RunReg(log_Pb,aMed_noalc);
%RunReg(log_Sb,aMed_noalc);
%RunReg(log_Se,aMed_noalc);
%RunReg(log_Sn,aMed_noalc);
%RunReg(log_Tl,aMed_noalc);
%RunReg(log_Zn,aMed_noalc);

%RunReg(lg_totalocp,aMed_noalc);
%RunReg(lg_totalbdes,aMed_noalc);
%RunReg(lg_totalpcbs,aMed_noalc);
%RunReg(lg_totalpfas,aMed_noalc);
%RunReg(lg_totalmetals,aMed_noalc);


data adjusted;
 set adjusted:;
run;

PROC EXPORT DATA=adjusted
OUTFILE= "C:\nus_project\1st_nus_chemical_nutrition\formal_analysis\revision02202024\associationdp_chemical_stra_byrace.xlsx"
DBMS=XLSX REPLACE;
SHEET="race1_aMed_noalc";
RUN;

proc datasets library=work nolist nodetails kill;
run; quit;

LIBNAME ep 'C:\nus_project\1st_nus_chemical_nutrition\formal_analysis\revision02202024'; options nofmterr;
data chemical_diet_starti_race1;
set ep.chemical_diet_starti_race1;
run;

%RunReg(log_BetaHCH,AHEI_noalc);
%RunReg(log_GammaHCH,AHEI_noalc);
%RunReg(log_HCB,AHEI_noalc);
%RunReg(log_Oxychlordane,AHEI_noalc);
%RunReg(log_TransChlordane,AHEI_noalc);
%RunReg(log_TransNo_chlor,AHEI_noalc);
%RunReg(log_P_P_DDE,AHEI_noalc);
%RunReg(log_O_P_DDD,AHEI_noalc);
%RunReg(log_P_P_DDD,AHEI_noalc);
%RunReg(log_P_P_DDT,AHEI_noalc);
%RunReg(log_Mirex,AHEI_noalc);
%RunReg(log_BDE28,AHEI_noalc);
%RunReg(log_BDE47,AHEI_noalc);
%RunReg(log_BDE100,AHEI_noalc);
%RunReg(log_BDE99,AHEI_noalc);
%RunReg(log_BDE85,AHEI_noalc);
%RunReg(log_PBB153,AHEI_noalc);
%RunReg(log_BDE154,AHEI_noalc);
%RunReg(log_BDE153,AHEI_noalc);
%RunReg(log_BDE183,AHEI_noalc);
%RunReg(log_PCB5_8,AHEI_noalc);
%RunReg(log_PCB18_17,AHEI_noalc);
%RunReg(log_PCB31_28,AHEI_noalc);
%RunReg(log_PCB33_20,AHEI_noalc);
%RunReg(log_PCB22,AHEI_noalc);
%RunReg(log_PCB52_73,AHEI_noalc);
%RunReg(log_PCB49_43,AHEI_noalc);
%RunReg(log_PCB47_48_75,AHEI_noalc);
%RunReg(log_PCB44,AHEI_noalc);
%RunReg(log_PCB41_64,AHEI_noalc);
%RunReg(log_PCB74_61,AHEI_noalc);
%RunReg(log_PCB70_76,AHEI_noalc);
%RunReg(log_PCB66_80,AHEI_noalc);
%RunReg(log_PCB93_95,AHEI_noalc);
%RunReg(log_PCB90_101_89,AHEI_noalc);
%RunReg(log_PCB99,AHEI_noalc);
%RunReg(log_PCB110,AHEI_noalc);
%RunReg(log_PCB118_106,AHEI_noalc);
%RunReg(log_PCB114_122,AHEI_noalc);
%RunReg(log_PCB105_127,AHEI_noalc);
%RunReg(log_PCB146_161,AHEI_noalc);
%RunReg(log_PCB153,AHEI_noalc);
%RunReg(log_PCB137,AHEI_noalc);
%RunReg(log_PCB138_158,AHEI_noalc);
%RunReg(log_PCB128,AHEI_noalc);
%RunReg(log_PCB167,AHEI_noalc);
%RunReg(log_PCB156,AHEI_noalc);
%RunReg(log_PCB157,AHEI_noalc);
%RunReg(log_PCB182_187,AHEI_noalc);
%RunReg(log_PCB183,AHEI_noalc);
%RunReg(log_PCB177,AHEI_noalc);
%RunReg(log_PCB172_192,AHEI_noalc);
%RunReg(log_PCB180,AHEI_noalc);
%RunReg(log_PCB170,AHEI_noalc);
%RunReg(log_PCB202,AHEI_noalc);
%RunReg(log_PCB199,AHEI_noalc);
%RunReg(log_PCB196_203,AHEI_noalc);
%RunReg(log_PCB195,AHEI_noalc);
%RunReg(log_PCB194,AHEI_noalc);
%RunReg(log_PCB208,AHEI_noalc);
%RunReg(log_PCB206,AHEI_noalc);
%RunReg(log_PCB209,AHEI_noalc);
%RunReg(log_NMeFOSAA,AHEI_noalc);
%RunReg(log_PFDS,AHEI_noalc);
%RunReg(log_PFDoDA,AHEI_noalc);
%RunReg(log_PFHpA,AHEI_noalc);
%RunReg(log_PFHxS,AHEI_noalc);
%RunReg(log_PFOS,AHEI_noalc);
%RunReg(log_PFOA,AHEI_noalc);
%RunReg(log_PFNA,AHEI_noalc);
%RunReg(log_PFDA,AHEI_noalc);
%RunReg(log_PFUnDA,AHEI_noalc);
%RunReg(log_As,AHEI_noalc);
%RunReg(log_Ba,AHEI_noalc);
%RunReg(log_Cd,AHEI_noalc);
%RunReg(log_Co,AHEI_noalc);
%RunReg(log_Cr,AHEI_noalc);
%RunReg(log_Cs,AHEI_noalc);
%RunReg(log_Cu,AHEI_noalc);
%RunReg(log_Hg,AHEI_noalc);
%RunReg(log_Mn,AHEI_noalc);
%RunReg(log_Mo,AHEI_noalc);
%RunReg(log_Pb,AHEI_noalc);
%RunReg(log_Sb,AHEI_noalc);
%RunReg(log_Se,AHEI_noalc);
%RunReg(log_Sn,AHEI_noalc);
%RunReg(log_Tl,AHEI_noalc);
%RunReg(log_Zn,AHEI_noalc);

%RunReg(lg_totalocp,AHEI_noalc);
%RunReg(lg_totalbdes,AHEI_noalc);
%RunReg(lg_totalpcbs,AHEI_noalc);
%RunReg(lg_totalpfas,AHEI_noalc);
%RunReg(lg_totalmetals,AHEI_noalc);

data adjusted;
 set adjusted:;
run;

PROC EXPORT DATA=adjusted
OUTFILE= "C:\nus_project\1st_nus_chemical_nutrition\formal_analysis\revision02202024\associationdp_chemical_stra_byrace.xlsx"
DBMS=XLSX REPLACE;
SHEET="race1_AHEI_noalc";
RUN;

proc datasets library=work nolist nodetails kill;
run; quit;

LIBNAME ep 'C:\nus_project\1st_nus_chemical_nutrition\formal_analysis\revision02202024'; options nofmterr;
data chemical_diet_starti_race1;
set ep.chemical_diet_starti_race1;
run;

%RunReg(log_BetaHCH,DASH);
%RunReg(log_GammaHCH,DASH);
%RunReg(log_HCB,DASH);
%RunReg(log_Oxychlordane,DASH);
%RunReg(log_TransChlordane,DASH);
%RunReg(log_TransNo_chlor,DASH);
%RunReg(log_P_P_DDE,DASH);
%RunReg(log_O_P_DDD,DASH);
%RunReg(log_P_P_DDD,DASH);
%RunReg(log_P_P_DDT,DASH);
%RunReg(log_Mirex,DASH);
%RunReg(log_BDE28,DASH);
%RunReg(log_BDE47,DASH);
%RunReg(log_BDE100,DASH);
%RunReg(log_BDE99,DASH);
%RunReg(log_BDE85,DASH);
%RunReg(log_PBB153,DASH);
%RunReg(log_BDE154,DASH);
%RunReg(log_BDE153,DASH);
%RunReg(log_BDE183,DASH);
%RunReg(log_PCB5_8,DASH);
%RunReg(log_PCB18_17,DASH);
%RunReg(log_PCB31_28,DASH);
%RunReg(log_PCB33_20,DASH);
%RunReg(log_PCB22,DASH);
%RunReg(log_PCB52_73,DASH);
%RunReg(log_PCB49_43,DASH);
%RunReg(log_PCB47_48_75,DASH);
%RunReg(log_PCB44,DASH);
%RunReg(log_PCB41_64,DASH);
%RunReg(log_PCB74_61,DASH);
%RunReg(log_PCB70_76,DASH);
%RunReg(log_PCB66_80,DASH);
%RunReg(log_PCB93_95,DASH);
%RunReg(log_PCB90_101_89,DASH);
%RunReg(log_PCB99,DASH);
%RunReg(log_PCB110,DASH);
%RunReg(log_PCB118_106,DASH);
%RunReg(log_PCB114_122,DASH);
%RunReg(log_PCB105_127,DASH);
%RunReg(log_PCB146_161,DASH);
%RunReg(log_PCB153,DASH);
%RunReg(log_PCB137,DASH);
%RunReg(log_PCB138_158,DASH);
%RunReg(log_PCB128,DASH);
%RunReg(log_PCB167,DASH);
%RunReg(log_PCB156,DASH);
%RunReg(log_PCB157,DASH);
%RunReg(log_PCB182_187,DASH);
%RunReg(log_PCB183,DASH);
%RunReg(log_PCB177,DASH);
%RunReg(log_PCB172_192,DASH);
%RunReg(log_PCB180,DASH);
%RunReg(log_PCB170,DASH);
%RunReg(log_PCB202,DASH);
%RunReg(log_PCB199,DASH);
%RunReg(log_PCB196_203,DASH);
%RunReg(log_PCB195,DASH);
%RunReg(log_PCB194,DASH);
%RunReg(log_PCB208,DASH);
%RunReg(log_PCB206,DASH);
%RunReg(log_PCB209,DASH);
%RunReg(log_NMeFOSAA,DASH);
%RunReg(log_PFDS,DASH);
%RunReg(log_PFDoDA,DASH);
%RunReg(log_PFHpA,DASH);
%RunReg(log_PFHxS,DASH);
%RunReg(log_PFOS,DASH);
%RunReg(log_PFOA,DASH);
%RunReg(log_PFNA,DASH);
%RunReg(log_PFDA,DASH);
%RunReg(log_PFUnDA,DASH);
%RunReg(log_As,DASH);
%RunReg(log_Ba,DASH);
%RunReg(log_Cd,DASH);
%RunReg(log_Co,DASH);
%RunReg(log_Cr,DASH);
%RunReg(log_Cs,DASH);
%RunReg(log_Cu,DASH);
%RunReg(log_Hg,DASH);
%RunReg(log_Mn,DASH);
%RunReg(log_Mo,DASH);
%RunReg(log_Pb,DASH);
%RunReg(log_Sb,DASH);
%RunReg(log_Se,DASH);
%RunReg(log_Sn,DASH);
%RunReg(log_Tl,DASH);
%RunReg(log_Zn,DASH);

%RunReg(lg_totalocp,DASH);
%RunReg(lg_totalbdes,DASH);
%RunReg(lg_totalpcbs,DASH);
%RunReg(lg_totalpfas,DASH);
%RunReg(lg_totalmetals,DASH);

data adjusted;
 set adjusted:;
run;

PROC EXPORT DATA=adjusted
OUTFILE= "C:\nus_project\1st_nus_chemical_nutrition\formal_analysis\revision02202024\associationdp_chemical_stra_byrace.xlsx"
DBMS=XLSX REPLACE;
SHEET="race1_DASH";
RUN;

proc datasets library=work nolist nodetails kill;
run; quit;

LIBNAME ep 'C:\nus_project\1st_nus_chemical_nutrition\formal_analysis\revision02202024'; options nofmterr;
data chemical_diet_starti_race2;
set ep.chemical_diet_starti_race2;
run;
%macro RunReg(y,x);
PROC reg data=chemical_diet_starti_race2;
ods output ParameterEstimates=adjusted&y;
model &y=&x momage energy	PA_Tot_v0 momrace1 momrace2 momrace3 momBMI_group1 momBMI_group2 momedu1 momedu2 income_groupnew1 income_groupnew2 income_groupnew3 parity	Cotinine_group1 Cotinine_group2/TOL VIF COLLIN DW INFLUENCE;
run;
%mend;

%RunReg(log_BetaHCH,aMed_noalc);
%RunReg(log_GammaHCH,aMed_noalc);
%RunReg(log_HCB,aMed_noalc);
%RunReg(log_Oxychlordane,aMed_noalc);
%RunReg(log_TransChlordane,aMed_noalc);
%RunReg(log_TransNo_chlor,aMed_noalc);
%RunReg(log_P_P_DDE,aMed_noalc);
%RunReg(log_O_P_DDD,aMed_noalc);
%RunReg(log_P_P_DDD,aMed_noalc);
%RunReg(log_P_P_DDT,aMed_noalc);
%RunReg(log_Mirex,aMed_noalc);
%RunReg(log_BDE28,aMed_noalc);
%RunReg(log_BDE47,aMed_noalc);
%RunReg(log_BDE100,aMed_noalc);
%RunReg(log_BDE99,aMed_noalc);
%RunReg(log_BDE85,aMed_noalc);
%RunReg(log_PBB153,aMed_noalc);
%RunReg(log_BDE154,aMed_noalc);
%RunReg(log_BDE153,aMed_noalc);
%RunReg(log_BDE183,aMed_noalc);
%RunReg(log_PCB5_8,aMed_noalc);
%RunReg(log_PCB18_17,aMed_noalc);
%RunReg(log_PCB31_28,aMed_noalc);
%RunReg(log_PCB33_20,aMed_noalc);
%RunReg(log_PCB22,aMed_noalc);
%RunReg(log_PCB52_73,aMed_noalc);
%RunReg(log_PCB49_43,aMed_noalc);
%RunReg(log_PCB47_48_75,aMed_noalc);
%RunReg(log_PCB44,aMed_noalc);
%RunReg(log_PCB41_64,aMed_noalc);
%RunReg(log_PCB74_61,aMed_noalc);
%RunReg(log_PCB70_76,aMed_noalc);
%RunReg(log_PCB66_80,aMed_noalc);
%RunReg(log_PCB93_95,aMed_noalc);
%RunReg(log_PCB90_101_89,aMed_noalc);
%RunReg(log_PCB99,aMed_noalc);
%RunReg(log_PCB110,aMed_noalc);
%RunReg(log_PCB118_106,aMed_noalc);
%RunReg(log_PCB114_122,aMed_noalc);
%RunReg(log_PCB105_127,aMed_noalc);
%RunReg(log_PCB146_161,aMed_noalc);
%RunReg(log_PCB153,aMed_noalc);
%RunReg(log_PCB137,aMed_noalc);
%RunReg(log_PCB138_158,aMed_noalc);
%RunReg(log_PCB128,aMed_noalc);
%RunReg(log_PCB167,aMed_noalc);
%RunReg(log_PCB156,aMed_noalc);
%RunReg(log_PCB157,aMed_noalc);
%RunReg(log_PCB182_187,aMed_noalc);
%RunReg(log_PCB183,aMed_noalc);
%RunReg(log_PCB177,aMed_noalc);
%RunReg(log_PCB172_192,aMed_noalc);
%RunReg(log_PCB180,aMed_noalc);
%RunReg(log_PCB170,aMed_noalc);
%RunReg(log_PCB202,aMed_noalc);
%RunReg(log_PCB199,aMed_noalc);
%RunReg(log_PCB196_203,aMed_noalc);
%RunReg(log_PCB195,aMed_noalc);
%RunReg(log_PCB194,aMed_noalc);
%RunReg(log_PCB208,aMed_noalc);
%RunReg(log_PCB206,aMed_noalc);
%RunReg(log_PCB209,aMed_noalc);
%RunReg(log_NMeFOSAA,aMed_noalc);
%RunReg(log_PFDS,aMed_noalc);
%RunReg(log_PFDoDA,aMed_noalc);
%RunReg(log_PFHpA,aMed_noalc);
%RunReg(log_PFHxS,aMed_noalc);
%RunReg(log_PFOS,aMed_noalc);
%RunReg(log_PFOA,aMed_noalc);
%RunReg(log_PFNA,aMed_noalc);
%RunReg(log_PFDA,aMed_noalc);
%RunReg(log_PFUnDA,aMed_noalc);
%RunReg(log_As,aMed_noalc);
%RunReg(log_Ba,aMed_noalc);
%RunReg(log_Cd,aMed_noalc);
%RunReg(log_Co,aMed_noalc);
%RunReg(log_Cr,aMed_noalc);
%RunReg(log_Cs,aMed_noalc);
%RunReg(log_Cu,aMed_noalc);
%RunReg(log_Hg,aMed_noalc);
%RunReg(log_Mn,aMed_noalc);
%RunReg(log_Mo,aMed_noalc);
%RunReg(log_Pb,aMed_noalc);
%RunReg(log_Sb,aMed_noalc);
%RunReg(log_Se,aMed_noalc);
%RunReg(log_Sn,aMed_noalc);
%RunReg(log_Tl,aMed_noalc);
%RunReg(log_Zn,aMed_noalc);

%RunReg(lg_totalocp,aMed_noalc);
%RunReg(lg_totalbdes,aMed_noalc);
%RunReg(lg_totalpcbs,aMed_noalc);
%RunReg(lg_totalpfas,aMed_noalc);
%RunReg(lg_totalmetals,aMed_noalc);

data adjusted;
 set adjusted:;
run;

PROC EXPORT DATA=adjusted
OUTFILE= "C:\nus_project\1st_nus_chemical_nutrition\formal_analysis\revision02202024\associationdp_chemical_stra_byrace.xlsx"
DBMS=XLSX REPLACE;
SHEET="race2_aMed_noalc";
RUN;

proc datasets library=work nolist nodetails kill;
run; quit;

LIBNAME ep 'C:\nus_project\1st_nus_chemical_nutrition\formal_analysis\revision02202024'; options nofmterr;
data chemical_diet_starti_race2;
set ep.chemical_diet_starti_race2;
run;

%RunReg(log_BetaHCH,AHEI_noalc);
%RunReg(log_GammaHCH,AHEI_noalc);
%RunReg(log_HCB,AHEI_noalc);
%RunReg(log_Oxychlordane,AHEI_noalc);
%RunReg(log_TransChlordane,AHEI_noalc);
%RunReg(log_TransNo_chlor,AHEI_noalc);
%RunReg(log_P_P_DDE,AHEI_noalc);
%RunReg(log_O_P_DDD,AHEI_noalc);
%RunReg(log_P_P_DDD,AHEI_noalc);
%RunReg(log_P_P_DDT,AHEI_noalc);
%RunReg(log_Mirex,AHEI_noalc);
%RunReg(log_BDE28,AHEI_noalc);
%RunReg(log_BDE47,AHEI_noalc);
%RunReg(log_BDE100,AHEI_noalc);
%RunReg(log_BDE99,AHEI_noalc);
%RunReg(log_BDE85,AHEI_noalc);
%RunReg(log_PBB153,AHEI_noalc);
%RunReg(log_BDE154,AHEI_noalc);
%RunReg(log_BDE153,AHEI_noalc);
%RunReg(log_BDE183,AHEI_noalc);
%RunReg(log_PCB5_8,AHEI_noalc);
%RunReg(log_PCB18_17,AHEI_noalc);
%RunReg(log_PCB31_28,AHEI_noalc);
%RunReg(log_PCB33_20,AHEI_noalc);
%RunReg(log_PCB22,AHEI_noalc);
%RunReg(log_PCB52_73,AHEI_noalc);
%RunReg(log_PCB49_43,AHEI_noalc);
%RunReg(log_PCB47_48_75,AHEI_noalc);
%RunReg(log_PCB44,AHEI_noalc);
%RunReg(log_PCB41_64,AHEI_noalc);
%RunReg(log_PCB74_61,AHEI_noalc);
%RunReg(log_PCB70_76,AHEI_noalc);
%RunReg(log_PCB66_80,AHEI_noalc);
%RunReg(log_PCB93_95,AHEI_noalc);
%RunReg(log_PCB90_101_89,AHEI_noalc);
%RunReg(log_PCB99,AHEI_noalc);
%RunReg(log_PCB110,AHEI_noalc);
%RunReg(log_PCB118_106,AHEI_noalc);
%RunReg(log_PCB114_122,AHEI_noalc);
%RunReg(log_PCB105_127,AHEI_noalc);
%RunReg(log_PCB146_161,AHEI_noalc);
%RunReg(log_PCB153,AHEI_noalc);
%RunReg(log_PCB137,AHEI_noalc);
%RunReg(log_PCB138_158,AHEI_noalc);
%RunReg(log_PCB128,AHEI_noalc);
%RunReg(log_PCB167,AHEI_noalc);
%RunReg(log_PCB156,AHEI_noalc);
%RunReg(log_PCB157,AHEI_noalc);
%RunReg(log_PCB182_187,AHEI_noalc);
%RunReg(log_PCB183,AHEI_noalc);
%RunReg(log_PCB177,AHEI_noalc);
%RunReg(log_PCB172_192,AHEI_noalc);
%RunReg(log_PCB180,AHEI_noalc);
%RunReg(log_PCB170,AHEI_noalc);
%RunReg(log_PCB202,AHEI_noalc);
%RunReg(log_PCB199,AHEI_noalc);
%RunReg(log_PCB196_203,AHEI_noalc);
%RunReg(log_PCB195,AHEI_noalc);
%RunReg(log_PCB194,AHEI_noalc);
%RunReg(log_PCB208,AHEI_noalc);
%RunReg(log_PCB206,AHEI_noalc);
%RunReg(log_PCB209,AHEI_noalc);
%RunReg(log_NMeFOSAA,AHEI_noalc);
%RunReg(log_PFDS,AHEI_noalc);
%RunReg(log_PFDoDA,AHEI_noalc);
%RunReg(log_PFHpA,AHEI_noalc);
%RunReg(log_PFHxS,AHEI_noalc);
%RunReg(log_PFOS,AHEI_noalc);
%RunReg(log_PFOA,AHEI_noalc);
%RunReg(log_PFNA,AHEI_noalc);
%RunReg(log_PFDA,AHEI_noalc);
%RunReg(log_PFUnDA,AHEI_noalc);
%RunReg(log_As,AHEI_noalc);
%RunReg(log_Ba,AHEI_noalc);
%RunReg(log_Cd,AHEI_noalc);
%RunReg(log_Co,AHEI_noalc);
%RunReg(log_Cr,AHEI_noalc);
%RunReg(log_Cs,AHEI_noalc);
%RunReg(log_Cu,AHEI_noalc);
%RunReg(log_Hg,AHEI_noalc);
%RunReg(log_Mn,AHEI_noalc);
%RunReg(log_Mo,AHEI_noalc);
%RunReg(log_Pb,AHEI_noalc);
%RunReg(log_Sb,AHEI_noalc);
%RunReg(log_Se,AHEI_noalc);
%RunReg(log_Sn,AHEI_noalc);
%RunReg(log_Tl,AHEI_noalc);
%RunReg(log_Zn,AHEI_noalc);

%RunReg(lg_totalocp,AHEI_noalc);
%RunReg(lg_totalbdes,AHEI_noalc);
%RunReg(lg_totalpcbs,AHEI_noalc);
%RunReg(lg_totalpfas,AHEI_noalc);
%RunReg(lg_totalmetals,AHEI_noalc);

data adjusted;
 set adjusted:;
run;

PROC EXPORT DATA=adjusted
OUTFILE= "C:\nus_project\1st_nus_chemical_nutrition\formal_analysis\revision02202024\associationdp_chemical_stra_byrace.xlsx"
DBMS=XLSX REPLACE;
SHEET="race2_AHEI_noalc";
RUN;

proc datasets library=work nolist nodetails kill;
run; quit;

LIBNAME ep 'C:\nus_project\1st_nus_chemical_nutrition\formal_analysis\revision02202024'; options nofmterr;
data chemical_diet_starti_race2;
set ep.chemical_diet_starti_race2;
run;

%RunReg(log_BetaHCH,DASH);
%RunReg(log_GammaHCH,DASH);
%RunReg(log_HCB,DASH);
%RunReg(log_Oxychlordane,DASH);
%RunReg(log_TransChlordane,DASH);
%RunReg(log_TransNo_chlor,DASH);
%RunReg(log_P_P_DDE,DASH);
%RunReg(log_O_P_DDD,DASH);
%RunReg(log_P_P_DDD,DASH);
%RunReg(log_P_P_DDT,DASH);
%RunReg(log_Mirex,DASH);
%RunReg(log_BDE28,DASH);
%RunReg(log_BDE47,DASH);
%RunReg(log_BDE100,DASH);
%RunReg(log_BDE99,DASH);
%RunReg(log_BDE85,DASH);
%RunReg(log_PBB153,DASH);
%RunReg(log_BDE154,DASH);
%RunReg(log_BDE153,DASH);
%RunReg(log_BDE183,DASH);
%RunReg(log_PCB5_8,DASH);
%RunReg(log_PCB18_17,DASH);
%RunReg(log_PCB31_28,DASH);
%RunReg(log_PCB33_20,DASH);
%RunReg(log_PCB22,DASH);
%RunReg(log_PCB52_73,DASH);
%RunReg(log_PCB49_43,DASH);
%RunReg(log_PCB47_48_75,DASH);
%RunReg(log_PCB44,DASH);
%RunReg(log_PCB41_64,DASH);
%RunReg(log_PCB74_61,DASH);
%RunReg(log_PCB70_76,DASH);
%RunReg(log_PCB66_80,DASH);
%RunReg(log_PCB93_95,DASH);
%RunReg(log_PCB90_101_89,DASH);
%RunReg(log_PCB99,DASH);
%RunReg(log_PCB110,DASH);
%RunReg(log_PCB118_106,DASH);
%RunReg(log_PCB114_122,DASH);
%RunReg(log_PCB105_127,DASH);
%RunReg(log_PCB146_161,DASH);
%RunReg(log_PCB153,DASH);
%RunReg(log_PCB137,DASH);
%RunReg(log_PCB138_158,DASH);
%RunReg(log_PCB128,DASH);
%RunReg(log_PCB167,DASH);
%RunReg(log_PCB156,DASH);
%RunReg(log_PCB157,DASH);
%RunReg(log_PCB182_187,DASH);
%RunReg(log_PCB183,DASH);
%RunReg(log_PCB177,DASH);
%RunReg(log_PCB172_192,DASH);
%RunReg(log_PCB180,DASH);
%RunReg(log_PCB170,DASH);
%RunReg(log_PCB202,DASH);
%RunReg(log_PCB199,DASH);
%RunReg(log_PCB196_203,DASH);
%RunReg(log_PCB195,DASH);
%RunReg(log_PCB194,DASH);
%RunReg(log_PCB208,DASH);
%RunReg(log_PCB206,DASH);
%RunReg(log_PCB209,DASH);
%RunReg(log_NMeFOSAA,DASH);
%RunReg(log_PFDS,DASH);
%RunReg(log_PFDoDA,DASH);
%RunReg(log_PFHpA,DASH);
%RunReg(log_PFHxS,DASH);
%RunReg(log_PFOS,DASH);
%RunReg(log_PFOA,DASH);
%RunReg(log_PFNA,DASH);
%RunReg(log_PFDA,DASH);
%RunReg(log_PFUnDA,DASH);
%RunReg(log_As,DASH);
%RunReg(log_Ba,DASH);
%RunReg(log_Cd,DASH);
%RunReg(log_Co,DASH);
%RunReg(log_Cr,DASH);
%RunReg(log_Cs,DASH);
%RunReg(log_Cu,DASH);
%RunReg(log_Hg,DASH);
%RunReg(log_Mn,DASH);
%RunReg(log_Mo,DASH);
%RunReg(log_Pb,DASH);
%RunReg(log_Sb,DASH);
%RunReg(log_Se,DASH);
%RunReg(log_Sn,DASH);
%RunReg(log_Tl,DASH);
%RunReg(log_Zn,DASH);

%RunReg(lg_totalocp,DASH);
%RunReg(lg_totalbdes,DASH);
%RunReg(lg_totalpcbs,DASH);
%RunReg(lg_totalpfas,DASH);
%RunReg(lg_totalmetals,DASH);

data adjusted;
 set adjusted:;
run;

PROC EXPORT DATA=adjusted
OUTFILE= "C:\nus_project\1st_nus_chemical_nutrition\formal_analysis\revision02202024\associationdp_chemical_stra_byrace.xlsx"
DBMS=XLSX REPLACE;
SHEET="race2_DASH";
RUN;

proc datasets library=work nolist nodetails kill;
run; quit;

LIBNAME ep 'C:\nus_project\1st_nus_chemical_nutrition\formal_analysis\revision02202024'; options nofmterr;
data chemical_diet_starti_race3;
set ep.chemical_diet_starti_race3;
run;
%macro RunReg(y,x);
PROC reg data=chemical_diet_starti_race3;
ods output ParameterEstimates=adjusted&y;
model &y=&x momage energy	PA_Tot_v0 momrace1 momrace2 momrace3 momBMI_group1 momBMI_group2 momedu1 momedu2 income_groupnew1 income_groupnew2 income_groupnew3 parity	Cotinine_group1 Cotinine_group2/TOL VIF COLLIN DW INFLUENCE;
run;
%mend;

%RunReg(log_BetaHCH,aMed_noalc);
%RunReg(log_GammaHCH,aMed_noalc);
%RunReg(log_HCB,aMed_noalc);
%RunReg(log_Oxychlordane,aMed_noalc);
%RunReg(log_TransChlordane,aMed_noalc);
%RunReg(log_TransNo_chlor,aMed_noalc);
%RunReg(log_P_P_DDE,aMed_noalc);
%RunReg(log_O_P_DDD,aMed_noalc);
%RunReg(log_P_P_DDD,aMed_noalc);
%RunReg(log_P_P_DDT,aMed_noalc);
%RunReg(log_Mirex,aMed_noalc);
%RunReg(log_BDE28,aMed_noalc);
%RunReg(log_BDE47,aMed_noalc);
%RunReg(log_BDE100,aMed_noalc);
%RunReg(log_BDE99,aMed_noalc);
%RunReg(log_BDE85,aMed_noalc);
%RunReg(log_PBB153,aMed_noalc);
%RunReg(log_BDE154,aMed_noalc);
%RunReg(log_BDE153,aMed_noalc);
%RunReg(log_BDE183,aMed_noalc);
%RunReg(log_PCB5_8,aMed_noalc);
%RunReg(log_PCB18_17,aMed_noalc);
%RunReg(log_PCB31_28,aMed_noalc);
%RunReg(log_PCB33_20,aMed_noalc);
%RunReg(log_PCB22,aMed_noalc);
%RunReg(log_PCB52_73,aMed_noalc);
%RunReg(log_PCB49_43,aMed_noalc);
%RunReg(log_PCB47_48_75,aMed_noalc);
%RunReg(log_PCB44,aMed_noalc);
%RunReg(log_PCB41_64,aMed_noalc);
%RunReg(log_PCB74_61,aMed_noalc);
%RunReg(log_PCB70_76,aMed_noalc);
%RunReg(log_PCB66_80,aMed_noalc);
%RunReg(log_PCB93_95,aMed_noalc);
%RunReg(log_PCB90_101_89,aMed_noalc);
%RunReg(log_PCB99,aMed_noalc);
%RunReg(log_PCB110,aMed_noalc);
%RunReg(log_PCB118_106,aMed_noalc);
%RunReg(log_PCB114_122,aMed_noalc);
%RunReg(log_PCB105_127,aMed_noalc);
%RunReg(log_PCB146_161,aMed_noalc);
%RunReg(log_PCB153,aMed_noalc);
%RunReg(log_PCB137,aMed_noalc);
%RunReg(log_PCB138_158,aMed_noalc);
%RunReg(log_PCB128,aMed_noalc);
%RunReg(log_PCB167,aMed_noalc);
%RunReg(log_PCB156,aMed_noalc);
%RunReg(log_PCB157,aMed_noalc);
%RunReg(log_PCB182_187,aMed_noalc);
%RunReg(log_PCB183,aMed_noalc);
%RunReg(log_PCB177,aMed_noalc);
%RunReg(log_PCB172_192,aMed_noalc);
%RunReg(log_PCB180,aMed_noalc);
%RunReg(log_PCB170,aMed_noalc);
%RunReg(log_PCB202,aMed_noalc);
%RunReg(log_PCB199,aMed_noalc);
%RunReg(log_PCB196_203,aMed_noalc);
%RunReg(log_PCB195,aMed_noalc);
%RunReg(log_PCB194,aMed_noalc);
%RunReg(log_PCB208,aMed_noalc);
%RunReg(log_PCB206,aMed_noalc);
%RunReg(log_PCB209,aMed_noalc);
%RunReg(log_NMeFOSAA,aMed_noalc);
%RunReg(log_PFDS,aMed_noalc);
%RunReg(log_PFDoDA,aMed_noalc);
%RunReg(log_PFHpA,aMed_noalc);
%RunReg(log_PFHxS,aMed_noalc);
%RunReg(log_PFOS,aMed_noalc);
%RunReg(log_PFOA,aMed_noalc);
%RunReg(log_PFNA,aMed_noalc);
%RunReg(log_PFDA,aMed_noalc);
%RunReg(log_PFUnDA,aMed_noalc);
%RunReg(log_As,aMed_noalc);
%RunReg(log_Ba,aMed_noalc);
%RunReg(log_Cd,aMed_noalc);
%RunReg(log_Co,aMed_noalc);
%RunReg(log_Cr,aMed_noalc);
%RunReg(log_Cs,aMed_noalc);
%RunReg(log_Cu,aMed_noalc);
%RunReg(log_Hg,aMed_noalc);
%RunReg(log_Mn,aMed_noalc);
%RunReg(log_Mo,aMed_noalc);
%RunReg(log_Pb,aMed_noalc);
%RunReg(log_Sb,aMed_noalc);
%RunReg(log_Se,aMed_noalc);
%RunReg(log_Sn,aMed_noalc);
%RunReg(log_Tl,aMed_noalc);
%RunReg(log_Zn,aMed_noalc);

%RunReg(lg_totalocp,aMed_noalc);
%RunReg(lg_totalbdes,aMed_noalc);
%RunReg(lg_totalpcbs,aMed_noalc);
%RunReg(lg_totalpfas,aMed_noalc);
%RunReg(lg_totalmetals,aMed_noalc);

data adjusted;
 set adjusted:;
run;

PROC EXPORT DATA=adjusted
OUTFILE= "C:\nus_project\1st_nus_chemical_nutrition\formal_analysis\revision02202024\associationdp_chemical_stra_byrace.xlsx"
DBMS=XLSX REPLACE;
SHEET="race3_aMed_noalc";
RUN;

proc datasets library=work nolist nodetails kill;
run; quit;

LIBNAME ep 'C:\nus_project\1st_nus_chemical_nutrition\formal_analysis\revision02202024'; options nofmterr;
data chemical_diet_starti_race3;
set ep.chemical_diet_starti_race3;
run;

%RunReg(log_BetaHCH,AHEI_noalc);
%RunReg(log_GammaHCH,AHEI_noalc);
%RunReg(log_HCB,AHEI_noalc);
%RunReg(log_Oxychlordane,AHEI_noalc);
%RunReg(log_TransChlordane,AHEI_noalc);
%RunReg(log_TransNo_chlor,AHEI_noalc);
%RunReg(log_P_P_DDE,AHEI_noalc);
%RunReg(log_O_P_DDD,AHEI_noalc);
%RunReg(log_P_P_DDD,AHEI_noalc);
%RunReg(log_P_P_DDT,AHEI_noalc);
%RunReg(log_Mirex,AHEI_noalc);
%RunReg(log_BDE28,AHEI_noalc);
%RunReg(log_BDE47,AHEI_noalc);
%RunReg(log_BDE100,AHEI_noalc);
%RunReg(log_BDE99,AHEI_noalc);
%RunReg(log_BDE85,AHEI_noalc);
%RunReg(log_PBB153,AHEI_noalc);
%RunReg(log_BDE154,AHEI_noalc);
%RunReg(log_BDE153,AHEI_noalc);
%RunReg(log_BDE183,AHEI_noalc);
%RunReg(log_PCB5_8,AHEI_noalc);
%RunReg(log_PCB18_17,AHEI_noalc);
%RunReg(log_PCB31_28,AHEI_noalc);
%RunReg(log_PCB33_20,AHEI_noalc);
%RunReg(log_PCB22,AHEI_noalc);
%RunReg(log_PCB52_73,AHEI_noalc);
%RunReg(log_PCB49_43,AHEI_noalc);
%RunReg(log_PCB47_48_75,AHEI_noalc);
%RunReg(log_PCB44,AHEI_noalc);
%RunReg(log_PCB41_64,AHEI_noalc);
%RunReg(log_PCB74_61,AHEI_noalc);
%RunReg(log_PCB70_76,AHEI_noalc);
%RunReg(log_PCB66_80,AHEI_noalc);
%RunReg(log_PCB93_95,AHEI_noalc);
%RunReg(log_PCB90_101_89,AHEI_noalc);
%RunReg(log_PCB99,AHEI_noalc);
%RunReg(log_PCB110,AHEI_noalc);
%RunReg(log_PCB118_106,AHEI_noalc);
%RunReg(log_PCB114_122,AHEI_noalc);
%RunReg(log_PCB105_127,AHEI_noalc);
%RunReg(log_PCB146_161,AHEI_noalc);
%RunReg(log_PCB153,AHEI_noalc);
%RunReg(log_PCB137,AHEI_noalc);
%RunReg(log_PCB138_158,AHEI_noalc);
%RunReg(log_PCB128,AHEI_noalc);
%RunReg(log_PCB167,AHEI_noalc);
%RunReg(log_PCB156,AHEI_noalc);
%RunReg(log_PCB157,AHEI_noalc);
%RunReg(log_PCB182_187,AHEI_noalc);
%RunReg(log_PCB183,AHEI_noalc);
%RunReg(log_PCB177,AHEI_noalc);
%RunReg(log_PCB172_192,AHEI_noalc);
%RunReg(log_PCB180,AHEI_noalc);
%RunReg(log_PCB170,AHEI_noalc);
%RunReg(log_PCB202,AHEI_noalc);
%RunReg(log_PCB199,AHEI_noalc);
%RunReg(log_PCB196_203,AHEI_noalc);
%RunReg(log_PCB195,AHEI_noalc);
%RunReg(log_PCB194,AHEI_noalc);
%RunReg(log_PCB208,AHEI_noalc);
%RunReg(log_PCB206,AHEI_noalc);
%RunReg(log_PCB209,AHEI_noalc);
%RunReg(log_NMeFOSAA,AHEI_noalc);
%RunReg(log_PFDS,AHEI_noalc);
%RunReg(log_PFDoDA,AHEI_noalc);
%RunReg(log_PFHpA,AHEI_noalc);
%RunReg(log_PFHxS,AHEI_noalc);
%RunReg(log_PFOS,AHEI_noalc);
%RunReg(log_PFOA,AHEI_noalc);
%RunReg(log_PFNA,AHEI_noalc);
%RunReg(log_PFDA,AHEI_noalc);
%RunReg(log_PFUnDA,AHEI_noalc);
%RunReg(log_As,AHEI_noalc);
%RunReg(log_Ba,AHEI_noalc);
%RunReg(log_Cd,AHEI_noalc);
%RunReg(log_Co,AHEI_noalc);
%RunReg(log_Cr,AHEI_noalc);
%RunReg(log_Cs,AHEI_noalc);
%RunReg(log_Cu,AHEI_noalc);
%RunReg(log_Hg,AHEI_noalc);
%RunReg(log_Mn,AHEI_noalc);
%RunReg(log_Mo,AHEI_noalc);
%RunReg(log_Pb,AHEI_noalc);
%RunReg(log_Sb,AHEI_noalc);
%RunReg(log_Se,AHEI_noalc);
%RunReg(log_Sn,AHEI_noalc);
%RunReg(log_Tl,AHEI_noalc);
%RunReg(log_Zn,AHEI_noalc);

%RunReg(lg_totalocp,AHEI_noalc);
%RunReg(lg_totalbdes,AHEI_noalc);
%RunReg(lg_totalpcbs,AHEI_noalc);
%RunReg(lg_totalpfas,AHEI_noalc);
%RunReg(lg_totalmetals,AHEI_noalc);

data adjusted;
 set adjusted:;
run;

PROC EXPORT DATA=adjusted
OUTFILE= "C:\nus_project\1st_nus_chemical_nutrition\formal_analysis\revision02202024\associationdp_chemical_stra_byrace.xlsx"
DBMS=XLSX REPLACE;
SHEET="race3_AHEI_noalc";
RUN;

proc datasets library=work nolist nodetails kill;
run; quit;

LIBNAME ep 'C:\nus_project\1st_nus_chemical_nutrition\formal_analysis\revision02202024'; options nofmterr;
data chemical_diet_starti_race3;
set ep.chemical_diet_starti_race3;
run;

%RunReg(log_BetaHCH,DASH);
%RunReg(log_GammaHCH,DASH);
%RunReg(log_HCB,DASH);
%RunReg(log_Oxychlordane,DASH);
%RunReg(log_TransChlordane,DASH);
%RunReg(log_TransNo_chlor,DASH);
%RunReg(log_P_P_DDE,DASH);
%RunReg(log_O_P_DDD,DASH);
%RunReg(log_P_P_DDD,DASH);
%RunReg(log_P_P_DDT,DASH);
%RunReg(log_Mirex,DASH);
%RunReg(log_BDE28,DASH);
%RunReg(log_BDE47,DASH);
%RunReg(log_BDE100,DASH);
%RunReg(log_BDE99,DASH);
%RunReg(log_BDE85,DASH);
%RunReg(log_PBB153,DASH);
%RunReg(log_BDE154,DASH);
%RunReg(log_BDE153,DASH);
%RunReg(log_BDE183,DASH);
%RunReg(log_PCB5_8,DASH);
%RunReg(log_PCB18_17,DASH);
%RunReg(log_PCB31_28,DASH);
%RunReg(log_PCB33_20,DASH);
%RunReg(log_PCB22,DASH);
%RunReg(log_PCB52_73,DASH);
%RunReg(log_PCB49_43,DASH);
%RunReg(log_PCB47_48_75,DASH);
%RunReg(log_PCB44,DASH);
%RunReg(log_PCB41_64,DASH);
%RunReg(log_PCB74_61,DASH);
%RunReg(log_PCB70_76,DASH);
%RunReg(log_PCB66_80,DASH);
%RunReg(log_PCB93_95,DASH);
%RunReg(log_PCB90_101_89,DASH);
%RunReg(log_PCB99,DASH);
%RunReg(log_PCB110,DASH);
%RunReg(log_PCB118_106,DASH);
%RunReg(log_PCB114_122,DASH);
%RunReg(log_PCB105_127,DASH);
%RunReg(log_PCB146_161,DASH);
%RunReg(log_PCB153,DASH);
%RunReg(log_PCB137,DASH);
%RunReg(log_PCB138_158,DASH);
%RunReg(log_PCB128,DASH);
%RunReg(log_PCB167,DASH);
%RunReg(log_PCB156,DASH);
%RunReg(log_PCB157,DASH);
%RunReg(log_PCB182_187,DASH);
%RunReg(log_PCB183,DASH);
%RunReg(log_PCB177,DASH);
%RunReg(log_PCB172_192,DASH);
%RunReg(log_PCB180,DASH);
%RunReg(log_PCB170,DASH);
%RunReg(log_PCB202,DASH);
%RunReg(log_PCB199,DASH);
%RunReg(log_PCB196_203,DASH);
%RunReg(log_PCB195,DASH);
%RunReg(log_PCB194,DASH);
%RunReg(log_PCB208,DASH);
%RunReg(log_PCB206,DASH);
%RunReg(log_PCB209,DASH);
%RunReg(log_NMeFOSAA,DASH);
%RunReg(log_PFDS,DASH);
%RunReg(log_PFDoDA,DASH);
%RunReg(log_PFHpA,DASH);
%RunReg(log_PFHxS,DASH);
%RunReg(log_PFOS,DASH);
%RunReg(log_PFOA,DASH);
%RunReg(log_PFNA,DASH);
%RunReg(log_PFDA,DASH);
%RunReg(log_PFUnDA,DASH);
%RunReg(log_As,DASH);
%RunReg(log_Ba,DASH);
%RunReg(log_Cd,DASH);
%RunReg(log_Co,DASH);
%RunReg(log_Cr,DASH);
%RunReg(log_Cs,DASH);
%RunReg(log_Cu,DASH);
%RunReg(log_Hg,DASH);
%RunReg(log_Mn,DASH);
%RunReg(log_Mo,DASH);
%RunReg(log_Pb,DASH);
%RunReg(log_Sb,DASH);
%RunReg(log_Se,DASH);
%RunReg(log_Sn,DASH);
%RunReg(log_Tl,DASH);
%RunReg(log_Zn,DASH);

%RunReg(lg_totalocp,DASH);
%RunReg(lg_totalbdes,DASH);
%RunReg(lg_totalpcbs,DASH);
%RunReg(lg_totalpfas,DASH);
%RunReg(lg_totalmetals,DASH);

data adjusted;
 set adjusted:;
run;

PROC EXPORT DATA=adjusted
OUTFILE= "C:\nus_project\1st_nus_chemical_nutrition\formal_analysis\revision02202024\associationdp_chemical_stra_byrace.xlsx"
DBMS=XLSX REPLACE;
SHEET="race3_DASH";
RUN;

proc datasets library=work nolist nodetails kill;
run; quit;

/* associations of each food group with each chemical, stratified by race */

LIBNAME ep 'C:\nus_project\1st_nus_chemical_nutrition\formal_analysis\revision02202024'; options nofmterr;
proc stdize data=ep.chemical_diet_final_analysis out=chemical_diet_final_analysis method=std;
  var DASH_fruit_s--DASH_ssbnj_s AHEI_vegetable_s--AHEI_PUFA_p MED_vegetable_s--MED_meat_s;
run;

data chemical_diet_starti_race0;
set chemical_diet_final_analysis;
if momrace=0 then output;
run;


data chemical_diet_starti_race0;
set chemical_diet_starti_race0;
KEEP DASH_fruit_s--DASH_ssbnj_s AHEI_vegetable_s--AHEI_PUFA_p MED_vegetable_s--MED_meat_s log_BetaHCH log_GammaHCH log_HCB log_Oxychlordane log_TransChlordane log_TransNo_chlor log_P_P_DDE log_O_P_DDD log_P_P_DDD log_P_P_DDT log_Mirex log_BDE28 log_BDE47 log_BDE100 log_BDE99 log_BDE85 log_PBB153 log_BDE154 log_BDE153
 log_BDE183 log_PCB5_8 log_PCB18_17 log_PCB31_28 log_PCB33_20 log_PCB22 log_PCB52_73 log_PCB49_43 log_PCB47_48_75 log_PCB44 log_PCB41_64 log_PCB74_61 log_PCB70_76 log_PCB66_80 log_PCB93_95 log_PCB90_101_89 log_PCB99 log_PCB110 log_PCB118_106
 log_PCB114_122 log_PCB105_127 log_PCB146_161 log_PCB153 log_PCB137 log_PCB138_158 log_PCB128 log_PCB167 log_PCB156 log_PCB157 log_PCB182_187 log_PCB183 log_PCB177 log_PCB172_192 log_PCB180 log_PCB170 log_PCB202 log_PCB199
 log_PCB196_203 log_PCB195 log_PCB194 log_PCB208 log_PCB206 log_PCB209 log_NMeFOSAA log_PFDS log_PFDoDA log_PFHpA log_PFHxS log_PFOS log_PFOA log_PFNA log_PFDA log_PFUnDA log_As log_Ba log_Cd log_Co log_Cr log_Cs log_Cu
 log_Hg log_Mn log_Mo log_Pb log_Sb log_Se log_Sn log_Tl log_Zn lg_totalocp lg_totalbdes lg_totalpcbs lg_totalpfas lg_totalmetals 
energy momage	PA_Tot_v0 TotalLipid momBMI_group1 momBMI_group2 momedu1 momedu2 income_groupnew1 income_groupnew2 income_groupnew3 parity	Cotinine_group1 Cotinine_group2;
run;

data allvar;
 set chemical_diet_starti_race0;
 array xvar[*] DASH_fruit_s--DASH_ssbnj_s AHEI_vegetable_s--AHEI_PUFA_p MED_vegetable_s--MED_meat_s;
 array yvar[*] log_: lg_:;
 do i=1 to dim(xvar);
  do j=1 to dim(yvar);
  xv=vname(xvar[i]);
  yv=vname(yvar[j]);
  output;
 end;
 end;
 keep xv yv;
run;

proc sort data=allvar nodupkey;
 by xv yv;
run;

proc sql;
 create table varlist as
 select distinct *, monotonic() as obs
 from allvar;
quit;

%macro RunReg(obs,y,x);
ods output close;
proc reg DATA=chemical_diet_starti_race0;
ods output ParameterEstimates=adjusted&obs;
model &y=&x momage energy	PA_Tot_v0 momBMI_group1 momBMI_group2 momedu1 momedu2 income_groupnew1 income_groupnew2 income_groupnew3 parity	Cotinine_group1 Cotinine_group2/TOL VIF COLLIN DW INFLUENCE;

quit;
data adjusted&obs;
 set adjusted&obs;
 length x y $200;
 x="&x";
 y="&y";
run;
%mend;

data _null_;
 set varlist;
 call execute('%nrstr(%RunReg('||strip(obs)||','||strip(yv)||','||strip(xv)||'))');
run;

data final;
 set adjusted:;
run;

PROC EXPORT DATA=final
OUTFILE= "C:\nus_project\1st_nus_chemical_nutrition\formal_analysis\revision02202024\foodgroup_chemical_byrace.xlsx"
DBMS=XLSX REPLACE;
SHEET="foodgroup_chemical_race0";
RUN;

proc datasets library=work nolist nodetails kill;
run; quit;

LIBNAME ep 'C:\nus_project\1st_nus_chemical_nutrition\formal_analysis\revision02202024'; options nofmterr;
proc stdize data=ep.chemical_diet_final_analysis out=chemical_diet_final_analysis method=std;
  var DASH_fruit_s--DASH_ssbnj_s AHEI_vegetable_s--AHEI_PUFA_p MED_vegetable_s--MED_meat_s;
run;

data chemical_diet_starti_race1;
set chemical_diet_final_analysis;
if momrace=1 then output;
run;


data chemical_diet_starti_race1;
set chemical_diet_starti_race1;
KEEP DASH_fruit_s--DASH_ssbnj_s AHEI_vegetable_s--AHEI_PUFA_p MED_vegetable_s--MED_meat_s log_BetaHCH log_GammaHCH log_HCB log_Oxychlordane log_TransChlordane log_TransNo_chlor log_P_P_DDE log_O_P_DDD log_P_P_DDD log_P_P_DDT log_Mirex log_BDE28 log_BDE47 log_BDE100 log_BDE99 log_BDE85 log_PBB153 log_BDE154 log_BDE153
 log_BDE183 log_PCB5_8 log_PCB18_17 log_PCB31_28 log_PCB33_20 log_PCB22 log_PCB52_73 log_PCB49_43 log_PCB47_48_75 log_PCB44 log_PCB41_64 log_PCB74_61 log_PCB70_76 log_PCB66_80 log_PCB93_95 log_PCB90_101_89 log_PCB99 log_PCB110 log_PCB118_106
 log_PCB114_122 log_PCB105_127 log_PCB146_161 log_PCB153 log_PCB137 log_PCB138_158 log_PCB128 log_PCB167 log_PCB156 log_PCB157 log_PCB182_187 log_PCB183 log_PCB177 log_PCB172_192 log_PCB180 log_PCB170 log_PCB202 log_PCB199
 log_PCB196_203 log_PCB195 log_PCB194 log_PCB208 log_PCB206 log_PCB209 log_NMeFOSAA log_PFDS log_PFDoDA log_PFHpA log_PFHxS log_PFOS log_PFOA log_PFNA log_PFDA log_PFUnDA log_As log_Ba log_Cd log_Co log_Cr log_Cs log_Cu
 log_Hg log_Mn log_Mo log_Pb log_Sb log_Se log_Sn log_Tl log_Zn lg_totalocp lg_totalbdes lg_totalpcbs lg_totalpfas lg_totalmetals 
energy momage	PA_Tot_v0 TotalLipid momBMI_group1 momBMI_group2 momedu1 momedu2 income_groupnew1 income_groupnew2 income_groupnew3 parity	Cotinine_group1 Cotinine_group2;
run;

data allvar;
 set chemical_diet_starti_race1;
 array xvar[*] DASH_fruit_s--DASH_ssbnj_s AHEI_vegetable_s--AHEI_PUFA_p MED_vegetable_s--MED_meat_s;
 array yvar[*] log_: lg_:;
 do i=1 to dim(xvar);
  do j=1 to dim(yvar);
  xv=vname(xvar[i]);
  yv=vname(yvar[j]);
  output;
 end;
 end;
 keep xv yv;
run;

proc sort data=allvar nodupkey;
 by xv yv;
run;

proc sql;
 create table varlist as
 select distinct *, monotonic() as obs
 from allvar;
quit;

%macro RunReg(obs,y,x);
ods output close;
proc reg DATA=chemical_diet_starti_race1;
ods output ParameterEstimates=adjusted&obs;
model &y=&x momage energy	PA_Tot_v0 momBMI_group1 momBMI_group2 momedu1 momedu2 income_groupnew1 income_groupnew2 income_groupnew3 parity	Cotinine_group1 Cotinine_group2/TOL VIF COLLIN DW INFLUENCE;

quit;
data adjusted&obs;
 set adjusted&obs;
 length x y $200;
 x="&x";
 y="&y";
run;
%mend;

data _null_;
 set varlist;
 call execute('%nrstr(%RunReg('||strip(obs)||','||strip(yv)||','||strip(xv)||'))');
run;

data final;
 set adjusted:;
run;

PROC EXPORT DATA=final
OUTFILE= "C:\nus_project\1st_nus_chemical_nutrition\formal_analysis\revision02202024\foodgroup_chemical_byrace.xlsx"
DBMS=XLSX REPLACE;
SHEET="foodgroup_chemical_race1";
RUN;

proc datasets library=work nolist nodetails kill;
run; quit;

LIBNAME ep 'C:\nus_project\1st_nus_chemical_nutrition\formal_analysis\revision02202024'; options nofmterr;
proc stdize data=ep.chemical_diet_final_analysis out=chemical_diet_final_analysis method=std;
  var DASH_fruit_s--DASH_ssbnj_s AHEI_vegetable_s--AHEI_PUFA_p MED_vegetable_s--MED_meat_s;
run;

data chemical_diet_starti_race2;
set chemical_diet_final_analysis;
if momrace=2 then output;
run;


data chemical_diet_starti_race2;
set chemical_diet_starti_race2;
KEEP DASH_fruit_s--DASH_ssbnj_s AHEI_vegetable_s--AHEI_PUFA_p MED_vegetable_s--MED_meat_s log_BetaHCH log_GammaHCH log_HCB log_Oxychlordane log_TransChlordane log_TransNo_chlor log_P_P_DDE log_O_P_DDD log_P_P_DDD log_P_P_DDT log_Mirex log_BDE28 log_BDE47 log_BDE100 log_BDE99 log_BDE85 log_PBB153 log_BDE154 log_BDE153
 log_BDE183 log_PCB5_8 log_PCB18_17 log_PCB31_28 log_PCB33_20 log_PCB22 log_PCB52_73 log_PCB49_43 log_PCB47_48_75 log_PCB44 log_PCB41_64 log_PCB74_61 log_PCB70_76 log_PCB66_80 log_PCB93_95 log_PCB90_101_89 log_PCB99 log_PCB110 log_PCB118_106
 log_PCB114_122 log_PCB105_127 log_PCB146_161 log_PCB153 log_PCB137 log_PCB138_158 log_PCB128 log_PCB167 log_PCB156 log_PCB157 log_PCB182_187 log_PCB183 log_PCB177 log_PCB172_192 log_PCB180 log_PCB170 log_PCB202 log_PCB199
 log_PCB196_203 log_PCB195 log_PCB194 log_PCB208 log_PCB206 log_PCB209 log_NMeFOSAA log_PFDS log_PFDoDA log_PFHpA log_PFHxS log_PFOS log_PFOA log_PFNA log_PFDA log_PFUnDA log_As log_Ba log_Cd log_Co log_Cr log_Cs log_Cu
 log_Hg log_Mn log_Mo log_Pb log_Sb log_Se log_Sn log_Tl log_Zn lg_totalocp lg_totalbdes lg_totalpcbs lg_totalpfas lg_totalmetals 
energy momage	PA_Tot_v0 TotalLipid momBMI_group1 momBMI_group2 momedu1 momedu2 income_groupnew1 income_groupnew2 income_groupnew3 parity	Cotinine_group1 Cotinine_group2;
run;

data allvar;
 set chemical_diet_starti_race2;
 array xvar[*] DASH_fruit_s--DASH_ssbnj_s AHEI_vegetable_s--AHEI_PUFA_p MED_vegetable_s--MED_meat_s;
 array yvar[*] log_: lg_:;
 do i=1 to dim(xvar);
  do j=1 to dim(yvar);
  xv=vname(xvar[i]);
  yv=vname(yvar[j]);
  output;
 end;
 end;
 keep xv yv;
run;

proc sort data=allvar nodupkey;
 by xv yv;
run;

proc sql;
 create table varlist as
 select distinct *, monotonic() as obs
 from allvar;
quit;

%macro RunReg(obs,y,x);
ods output close;
proc reg DATA=chemical_diet_starti_race2;
ods output ParameterEstimates=adjusted&obs;
model &y=&x momage energy	PA_Tot_v0 momBMI_group1 momBMI_group2 momedu1 momedu2 income_groupnew1 income_groupnew2 income_groupnew3 parity	Cotinine_group1 Cotinine_group2/TOL VIF COLLIN DW INFLUENCE;

quit;
data adjusted&obs;
 set adjusted&obs;
 length x y $200;
 x="&x";
 y="&y";
run;
%mend;

data _null_;
 set varlist;
 call execute('%nrstr(%RunReg('||strip(obs)||','||strip(yv)||','||strip(xv)||'))');
run;

data final;
 set adjusted:;
run;

PROC EXPORT DATA=final
OUTFILE= "C:\nus_project\1st_nus_chemical_nutrition\formal_analysis\revision02202024\foodgroup_chemical_byrace.xlsx"
DBMS=XLSX REPLACE;
SHEET="foodgroup_chemical_race2";
RUN;

proc datasets library=work nolist nodetails kill;
run; quit;

LIBNAME ep 'C:\nus_project\1st_nus_chemical_nutrition\formal_analysis\revision02202024'; options nofmterr;
proc stdize data=ep.chemical_diet_final_analysis out=chemical_diet_final_analysis method=std;
  var DASH_fruit_s--DASH_ssbnj_s AHEI_vegetable_s--AHEI_PUFA_p MED_vegetable_s--MED_meat_s;
run;

data chemical_diet_starti_race3;
set chemical_diet_final_analysis;
if momrace=3 then output;
run;


data chemical_diet_starti_race3;
set chemical_diet_starti_race3;
KEEP DASH_fruit_s--DASH_ssbnj_s AHEI_vegetable_s--AHEI_PUFA_p MED_vegetable_s--MED_meat_s log_BetaHCH log_GammaHCH log_HCB log_Oxychlordane log_TransChlordane log_TransNo_chlor log_P_P_DDE log_O_P_DDD log_P_P_DDD log_P_P_DDT log_Mirex log_BDE28 log_BDE47 log_BDE100 log_BDE99 log_BDE85 log_PBB153 log_BDE154 log_BDE153
 log_BDE183 log_PCB5_8 log_PCB18_17 log_PCB31_28 log_PCB33_20 log_PCB22 log_PCB52_73 log_PCB49_43 log_PCB47_48_75 log_PCB44 log_PCB41_64 log_PCB74_61 log_PCB70_76 log_PCB66_80 log_PCB93_95 log_PCB90_101_89 log_PCB99 log_PCB110 log_PCB118_106
 log_PCB114_122 log_PCB105_127 log_PCB146_161 log_PCB153 log_PCB137 log_PCB138_158 log_PCB128 log_PCB167 log_PCB156 log_PCB157 log_PCB182_187 log_PCB183 log_PCB177 log_PCB172_192 log_PCB180 log_PCB170 log_PCB202 log_PCB199
 log_PCB196_203 log_PCB195 log_PCB194 log_PCB208 log_PCB206 log_PCB209 log_NMeFOSAA log_PFDS log_PFDoDA log_PFHpA log_PFHxS log_PFOS log_PFOA log_PFNA log_PFDA log_PFUnDA log_As log_Ba log_Cd log_Co log_Cr log_Cs log_Cu
 log_Hg log_Mn log_Mo log_Pb log_Sb log_Se log_Sn log_Tl log_Zn lg_totalocp lg_totalbdes lg_totalpcbs lg_totalpfas lg_totalmetals 
energy momage	PA_Tot_v0 TotalLipid momBMI_group1 momBMI_group2 momedu1 momedu2 income_groupnew1 income_groupnew2 income_groupnew3 parity	Cotinine_group1 Cotinine_group2;
run;

data allvar;
 set chemical_diet_starti_race3;
 array xvar[*] DASH_fruit_s--DASH_ssbnj_s AHEI_vegetable_s--AHEI_PUFA_p MED_vegetable_s--MED_meat_s;
 array yvar[*] log_: lg_:;
 do i=1 to dim(xvar);
  do j=1 to dim(yvar);
  xv=vname(xvar[i]);
  yv=vname(yvar[j]);
  output;
 end;
 end;
 keep xv yv;
run;

proc sort data=allvar nodupkey;
 by xv yv;
run;

proc sql;
 create table varlist as
 select distinct *, monotonic() as obs
 from allvar;
quit;

%macro RunReg(obs,y,x);
ods output close;
proc reg DATA=chemical_diet_starti_race3;
ods output ParameterEstimates=adjusted&obs;
model &y=&x momage energy	PA_Tot_v0 momBMI_group1 momBMI_group2 momedu1 momedu2 income_groupnew1 income_groupnew2 income_groupnew3 parity	Cotinine_group1 Cotinine_group2/TOL VIF COLLIN DW INFLUENCE;

quit;
data adjusted&obs;
 set adjusted&obs;
 length x y $200;
 x="&x";
 y="&y";
run;
%mend;

data _null_;
 set varlist;
 call execute('%nrstr(%RunReg('||strip(obs)||','||strip(yv)||','||strip(xv)||'))');
run;

data final;
 set adjusted:;
run;

PROC EXPORT DATA=final
OUTFILE= "C:\nus_project\1st_nus_chemical_nutrition\formal_analysis\revision02202024\foodgroup_chemical_byrace.xlsx"
DBMS=XLSX REPLACE;
SHEET="foodgroup_chemical_race3";
RUN;

proc datasets library=work nolist nodetails kill;
run; quit;

