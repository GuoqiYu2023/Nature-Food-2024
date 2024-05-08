
/* sensitivity analysis, dicotomize the single chemical by 80th percent, formal code, then do logis regression model (Table S4) */
LIBNAME ep 'C:\nus_project\1st_nus_chemical_nutrition\formal_analysis\revision02202024'; options nofmterr;
data chemical_diet_final_analysis;
set ep.chemical_diet_final_analysis;
run;

%macro quint(indata,var,quintvar);
proc univariate noprint data=&indata;
var &var;
output out=quintile pctlpts=20 40 60 80 pctlpre=pct; run;
data _null_;
set quintile;
call symput('p1',pct20) ;
call symput('p2',pct40) ;
call symput('p3',pct60) ;
call symput('p4',pct80) ;
run;

data &indata;
set &indata;
if &var =. then    &quintvar = .;
else if &var le &p1 then &quintvar=0;
else if &var le &p2 then &quintvar=0;
else if &var le &p3 then &quintvar=0;
else if &var le &p4 then &quintvar=0;
else &quintvar=1;
run;
%mend quint;

%quint(chemical_diet_final_analysis,log_BetaHCH,log_BetaHCH_g);
%quint(chemical_diet_final_analysis,log_HCB,log_HCB_g);
%quint(chemical_diet_final_analysis,log_Oxychlordane,log_Oxychlordane_g);
%quint(chemical_diet_final_analysis,log_TransChlordane,log_TransChlordane_g);
%quint(chemical_diet_final_analysis,log_TransNo_chlor,log_TransNo_chlor_g);
%quint(chemical_diet_final_analysis,log_P_P_DDE,log_P_P_DDE_g);
%quint(chemical_diet_final_analysis,log_P_P_DDD,log_P_P_DDD_g);
%quint(chemical_diet_final_analysis,log_P_P_DDT,log_P_P_DDT_g);
%quint(chemical_diet_final_analysis,log_Mirex,log_Mirex_g);
%quint(chemical_diet_final_analysis,log_BDE28,log_BDE28_g);
%quint(chemical_diet_final_analysis,log_BDE47,log_BDE47_g);
%quint(chemical_diet_final_analysis,log_BDE100,log_BDE100_g);
%quint(chemical_diet_final_analysis,log_BDE99,log_BDE99_g);
%quint(chemical_diet_final_analysis,log_BDE154,log_BDE154_g);
%quint(chemical_diet_final_analysis,log_BDE153,log_BDE153_g);
%quint(chemical_diet_final_analysis,log_PCB5_8,log_PCB5_8_g);
%quint(chemical_diet_final_analysis,log_PCB18_17,log_PCB18_17_g);
%quint(chemical_diet_final_analysis,log_PCB31_28,log_PCB31_28_g);
%quint(chemical_diet_final_analysis,log_PCB52_73,log_PCB52_73_g);
%quint(chemical_diet_final_analysis,log_PCB74_61,log_PCB74_61_g);
%quint(chemical_diet_final_analysis,log_PCB93_95,log_PCB93_95_g);
%quint(chemical_diet_final_analysis,log_PCB90_101_89,log_PCB90_101_89_g);
%quint(chemical_diet_final_analysis,log_PCB99,log_PCB99_g);
%quint(chemical_diet_final_analysis,log_PCB118_106,log_PCB118_106_g);
%quint(chemical_diet_final_analysis,log_PCB105_127,log_PCB105_127_g);
%quint(chemical_diet_final_analysis,log_PCB146_161,log_PCB146_161_g);
%quint(chemical_diet_final_analysis,log_PCB153,log_PCB153_g);
%quint(chemical_diet_final_analysis,log_PCB138_158,log_PCB138_158_g);
%quint(chemical_diet_final_analysis,log_PCB156,log_PCB156_g);
%quint(chemical_diet_final_analysis,log_PCB182_187,log_PCB182_187_g);
%quint(chemical_diet_final_analysis,log_PCB183,log_PCB183_g);
%quint(chemical_diet_final_analysis,log_PCB180,log_PCB180_g);
%quint(chemical_diet_final_analysis,log_PCB170,log_PCB170_g);
%quint(chemical_diet_final_analysis,log_PCB199,log_PCB199_g);
%quint(chemical_diet_final_analysis,log_PCB196_203,log_PCB196_203_g);
%quint(chemical_diet_final_analysis,log_PCB194,log_PCB194_g);
%quint(chemical_diet_final_analysis,log_NMeFOSAA,log_NMeFOSAA_g);
%quint(chemical_diet_final_analysis,log_PFDoDA,log_PFDoDA_g);
%quint(chemical_diet_final_analysis,log_PFHpA,log_PFHpA_g);
%quint(chemical_diet_final_analysis,log_PFHxS,log_PFHxS_g);
%quint(chemical_diet_final_analysis,log_PFOS,log_PFOS_g);
%quint(chemical_diet_final_analysis,log_PFOA,log_PFOA_g);
%quint(chemical_diet_final_analysis,log_PFNA,log_PFNA_g);
%quint(chemical_diet_final_analysis,log_PFDA,log_PFDA_g);
%quint(chemical_diet_final_analysis,log_PFUnDA,log_PFUnDA_g);
%quint(chemical_diet_final_analysis,log_Ba,log_Ba_g);
%quint(chemical_diet_final_analysis,log_Co,log_Co_g);
%quint(chemical_diet_final_analysis,log_Cs,log_Cs_g);
%quint(chemical_diet_final_analysis,log_Cu,log_Cu_g);
%quint(chemical_diet_final_analysis,log_Hg,log_Hg_g);
%quint(chemical_diet_final_analysis,log_Mo,log_Mo_g);
%quint(chemical_diet_final_analysis,log_Sb,log_Sb_g);
%quint(chemical_diet_final_analysis,log_Se,log_Se_g);
%quint(chemical_diet_final_analysis,log_Sn,log_Sn_g);
%quint(chemical_diet_final_analysis,log_Tl,log_Tl_g);
%quint(chemical_diet_final_analysis,log_Zn,log_Zn_g);

data chemical_diet_80th;
set chemical_diet_final_analysis;
run;

%macro RunReg(y,x);
PROC logistic desc data=chemical_diet_80th;
ods output OddsRatios=TEI&y;
class momrace momBMI_group momedu income_groupnew parity Cotinine_group/param=reference ref=first;
model &y=&x energy momage	PA_Tot_v0 momrace momBMI_group momedu income_groupnew parity	Cotinine_group/covb INFLUENCE;
run;
%mend;

%RunReg(log_BetaHCH_g,aMed_noalc);
%RunReg(log_HCB_g,aMed_noalc);
%RunReg(log_Oxychlordane_g,aMed_noalc);
%RunReg(log_TransChlordane_g,aMed_noalc);
%RunReg(log_TransNo_chlor_g,aMed_noalc);
%RunReg(log_P_P_DDE_g,aMed_noalc);
%RunReg(log_P_P_DDD_g,aMed_noalc);
%RunReg(log_P_P_DDT_g,aMed_noalc);
%RunReg(log_Mirex_g,aMed_noalc);
%RunReg(log_BDE28_g,aMed_noalc);
%RunReg(log_BDE47_g,aMed_noalc);
%RunReg(log_BDE100_g,aMed_noalc);
%RunReg(log_BDE99_g,aMed_noalc);
%RunReg(log_BDE154_g,aMed_noalc);
%RunReg(log_BDE153_g,aMed_noalc);
%RunReg(log_PCB5_8_g,aMed_noalc);
%RunReg(log_PCB18_17_g,aMed_noalc);
%RunReg(log_PCB31_28_g,aMed_noalc);
%RunReg(log_PCB52_73_g,aMed_noalc);
%RunReg(log_PCB74_61_g,aMed_noalc);
%RunReg(log_PCB93_95_g,aMed_noalc);
%RunReg(log_PCB90_101_89_g,aMed_noalc);
%RunReg(log_PCB99_g,aMed_noalc);
%RunReg(log_PCB118_106_g,aMed_noalc);
%RunReg(log_PCB105_127_g,aMed_noalc);
%RunReg(log_PCB146_161_g,aMed_noalc);
%RunReg(log_PCB153_g,aMed_noalc);
%RunReg(log_PCB138_158_g,aMed_noalc);
%RunReg(log_PCB156_g,aMed_noalc);
%RunReg(log_PCB182_187_g,aMed_noalc);
%RunReg(log_PCB183_g,aMed_noalc);
%RunReg(log_PCB180_g,aMed_noalc);
%RunReg(log_PCB170_g,aMed_noalc);
%RunReg(log_PCB199_g,aMed_noalc);
%RunReg(log_PCB196_203_g,aMed_noalc);
%RunReg(log_PCB194_g,aMed_noalc);
%RunReg(log_NMeFOSAA_g,aMed_noalc);
%RunReg(log_PFDoDA_g,aMed_noalc);
%RunReg(log_PFHpA_g,aMed_noalc);
%RunReg(log_PFHxS_g,aMed_noalc);
%RunReg(log_PFOS_g,aMed_noalc);
%RunReg(log_PFOA_g,aMed_noalc);
%RunReg(log_PFNA_g,aMed_noalc);
%RunReg(log_PFDA_g,aMed_noalc);
%RunReg(log_PFUnDA_g,aMed_noalc);
%RunReg(log_Ba_g,aMed_noalc);
%RunReg(log_Co_g,aMed_noalc);
%RunReg(log_Cs_g,aMed_noalc);
%RunReg(log_Cu_g,aMed_noalc);
%RunReg(log_Hg_g,aMed_noalc);
%RunReg(log_Mo_g,aMed_noalc);
%RunReg(log_Sb_g,aMed_noalc);
%RunReg(log_Se_g,aMed_noalc);
%RunReg(log_Sn_g,aMed_noalc);
%RunReg(log_Tl_g,aMed_noalc);
%RunReg(log_Zn_g,aMed_noalc);


data TEI;
 set TEI:;
run;

PROC EXPORT DATA=TEI
OUTFILE= "C:\nus_project\1st_nus_chemical_nutrition\formal_analysis\revision02202024\chemical_80th.xlsx"
DBMS=XLSX REPLACE;
SHEET="TEI_aMed_noalc";
RUN;

proc datasets library=work nolist nodetails kill;
run; quit;

LIBNAME ep 'C:\nus_project\1st_nus_chemical_nutrition\formal_analysis\revision02202024'; options nofmterr;
data chemical_diet_80th;
set ep.chemical_diet_80th;
run;


%macro RunReg(y,x);
PROC logistic desc data=chemical_diet_80th;
ods output OddsRatios=TEI&y;
class momrace momBMI_group momedu income_groupnew parity Cotinine_group/param=reference ref=first;
model &y=&x energy momage	PA_Tot_v0 momrace momBMI_group momedu income_groupnew parity	Cotinine_group/covb INFLUENCE;
run;
%mend;

%RunReg(log_BetaHCH_g,AHEI_noalc);
%RunReg(log_HCB_g,AHEI_noalc);
%RunReg(log_Oxychlordane_g,AHEI_noalc);
%RunReg(log_TransChlordane_g,AHEI_noalc);
%RunReg(log_TransNo_chlor_g,AHEI_noalc);
%RunReg(log_P_P_DDE_g,AHEI_noalc);
%RunReg(log_P_P_DDD_g,AHEI_noalc);
%RunReg(log_P_P_DDT_g,AHEI_noalc);
%RunReg(log_Mirex_g,AHEI_noalc);
%RunReg(log_BDE28_g,AHEI_noalc);
%RunReg(log_BDE47_g,AHEI_noalc);
%RunReg(log_BDE100_g,AHEI_noalc);
%RunReg(log_BDE99_g,AHEI_noalc);
%RunReg(log_BDE154_g,AHEI_noalc);
%RunReg(log_BDE153_g,AHEI_noalc);
%RunReg(log_PCB5_8_g,AHEI_noalc);
%RunReg(log_PCB18_17_g,AHEI_noalc);
%RunReg(log_PCB31_28_g,AHEI_noalc);
%RunReg(log_PCB52_73_g,AHEI_noalc);
%RunReg(log_PCB74_61_g,AHEI_noalc);
%RunReg(log_PCB93_95_g,AHEI_noalc);
%RunReg(log_PCB90_101_89_g,AHEI_noalc);
%RunReg(log_PCB99_g,AHEI_noalc);
%RunReg(log_PCB118_106_g,AHEI_noalc);
%RunReg(log_PCB105_127_g,AHEI_noalc);
%RunReg(log_PCB146_161_g,AHEI_noalc);
%RunReg(log_PCB153_g,AHEI_noalc);
%RunReg(log_PCB138_158_g,AHEI_noalc);
%RunReg(log_PCB156_g,AHEI_noalc);
%RunReg(log_PCB182_187_g,AHEI_noalc);
%RunReg(log_PCB183_g,AHEI_noalc);
%RunReg(log_PCB180_g,AHEI_noalc);
%RunReg(log_PCB170_g,AHEI_noalc);
%RunReg(log_PCB199_g,AHEI_noalc);
%RunReg(log_PCB196_203_g,AHEI_noalc);
%RunReg(log_PCB194_g,AHEI_noalc);
%RunReg(log_NMeFOSAA_g,AHEI_noalc);
%RunReg(log_PFDoDA_g,AHEI_noalc);
%RunReg(log_PFHpA_g,AHEI_noalc);
%RunReg(log_PFHxS_g,AHEI_noalc);
%RunReg(log_PFOS_g,AHEI_noalc);
%RunReg(log_PFOA_g,AHEI_noalc);
%RunReg(log_PFNA_g,AHEI_noalc);
%RunReg(log_PFDA_g,AHEI_noalc);
%RunReg(log_PFUnDA_g,AHEI_noalc);
%RunReg(log_Ba_g,AHEI_noalc);
%RunReg(log_Co_g,AHEI_noalc);
%RunReg(log_Cs_g,AHEI_noalc);
%RunReg(log_Cu_g,AHEI_noalc);
%RunReg(log_Hg_g,AHEI_noalc);
%RunReg(log_Mo_g,AHEI_noalc);
%RunReg(log_Sb_g,AHEI_noalc);
%RunReg(log_Se_g,AHEI_noalc);
%RunReg(log_Sn_g,AHEI_noalc);
%RunReg(log_Tl_g,AHEI_noalc);
%RunReg(log_Zn_g,AHEI_noalc);


data TEI;
 set TEI:;
run;

PROC EXPORT DATA=TEI
OUTFILE= "C:\nus_project\1st_nus_chemical_nutrition\formal_analysis\revision02202024\chemical_80th.xlsx"
DBMS=XLSX REPLACE;
SHEET="TEI_AHEI_noalc";
RUN;

proc datasets library=work nolist nodetails kill;
run; quit;

LIBNAME ep 'C:\nus_project\1st_nus_chemical_nutrition\formal_analysis\revision02202024'; options nofmterr;
data chemical_diet_80th;
set ep.chemical_diet_80th;
run;


%macro RunReg(y,x);
PROC logistic desc data=chemical_diet_80th;
ods output OddsRatios=TEI&y;
class momrace momBMI_group momedu income_groupnew parity Cotinine_group/param=reference ref=first;
model &y=&x energy momage	PA_Tot_v0 momrace momBMI_group momedu income_groupnew parity	Cotinine_group/covb INFLUENCE;
run;
%mend;

%RunReg(log_BetaHCH_g,DASH);
%RunReg(log_HCB_g,DASH);
%RunReg(log_Oxychlordane_g,DASH);
%RunReg(log_TransChlordane_g,DASH);
%RunReg(log_TransNo_chlor_g,DASH);
%RunReg(log_P_P_DDE_g,DASH);
%RunReg(log_P_P_DDD_g,DASH);
%RunReg(log_P_P_DDT_g,DASH);
%RunReg(log_Mirex_g,DASH);
%RunReg(log_BDE28_g,DASH);
%RunReg(log_BDE47_g,DASH);
%RunReg(log_BDE100_g,DASH);
%RunReg(log_BDE99_g,DASH);
%RunReg(log_BDE154_g,DASH);
%RunReg(log_BDE153_g,DASH);
%RunReg(log_PCB5_8_g,DASH);
%RunReg(log_PCB18_17_g,DASH);
%RunReg(log_PCB31_28_g,DASH);
%RunReg(log_PCB52_73_g,DASH);
%RunReg(log_PCB74_61_g,DASH);
%RunReg(log_PCB93_95_g,DASH);
%RunReg(log_PCB90_101_89_g,DASH);
%RunReg(log_PCB99_g,DASH);
%RunReg(log_PCB118_106_g,DASH);
%RunReg(log_PCB105_127_g,DASH);
%RunReg(log_PCB146_161_g,DASH);
%RunReg(log_PCB153_g,DASH);
%RunReg(log_PCB138_158_g,DASH);
%RunReg(log_PCB156_g,DASH);
%RunReg(log_PCB182_187_g,DASH);
%RunReg(log_PCB183_g,DASH);
%RunReg(log_PCB180_g,DASH);
%RunReg(log_PCB170_g,DASH);
%RunReg(log_PCB199_g,DASH);
%RunReg(log_PCB196_203_g,DASH);
%RunReg(log_PCB194_g,DASH);
%RunReg(log_NMeFOSAA_g,DASH);
%RunReg(log_PFDoDA_g,DASH);
%RunReg(log_PFHpA_g,DASH);
%RunReg(log_PFHxS_g,DASH);
%RunReg(log_PFOS_g,DASH);
%RunReg(log_PFOA_g,DASH);
%RunReg(log_PFNA_g,DASH);
%RunReg(log_PFDA_g,DASH);
%RunReg(log_PFUnDA_g,DASH);
%RunReg(log_Ba_g,DASH);
%RunReg(log_Co_g,DASH);
%RunReg(log_Cs_g,DASH);
%RunReg(log_Cu_g,DASH);
%RunReg(log_Hg_g,DASH);
%RunReg(log_Mo_g,DASH);
%RunReg(log_Sb_g,DASH);
%RunReg(log_Se_g,DASH);
%RunReg(log_Sn_g,DASH);
%RunReg(log_Tl_g,DASH);
%RunReg(log_Zn_g,DASH);


data TEI;
 set TEI:;
run;

PROC EXPORT DATA=TEI
OUTFILE= "C:\nus_project\1st_nus_chemical_nutrition\formal_analysis\revision02202024\chemical_80th.xlsx"
DBMS=XLSX REPLACE;
SHEET="TEI_DASH";
RUN;

proc datasets library=work nolist nodetails kill;
run; quit;
