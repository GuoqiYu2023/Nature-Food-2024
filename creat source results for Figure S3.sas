
/* to do associations of each conctituent food groups with each chemicals,(creat source results for Figure S3) */
LIBNAME ep 'C:\nus_project\1st_nus_chemical_nutrition\formal_analysis\revision02202024'; options nofmterr;
proc stdize data=ep.chemical_diet_final_analysis out=chemical_diet_final_analysis method=std;
  var DASH_fruit_s--DASH_ssbnj_s AHEI_vegetable_s--AHEI_PUFA_p MED_vegetable_s--MED_meat_s;
run;

data chemical_diet_final_analysis;
set chemical_diet_final_analysis;
KEEP DASH_fruit_s--DASH_ssbnj_s AHEI_vegetable_s--AHEI_PUFA_p MED_vegetable_s--MED_meat_s log_BetaHCH log_GammaHCH log_HCB log_Oxychlordane log_TransChlordane log_TransNo_chlor log_P_P_DDE log_O_P_DDD log_P_P_DDD log_P_P_DDT log_Mirex log_BDE28 log_BDE47 log_BDE100 log_BDE99 log_BDE85 log_PBB153 log_BDE154 log_BDE153
 log_BDE183 log_PCB5_8 log_PCB18_17 log_PCB31_28 log_PCB33_20 log_PCB22 log_PCB52_73 log_PCB49_43 log_PCB47_48_75 log_PCB44 log_PCB41_64 log_PCB74_61 log_PCB70_76 log_PCB66_80 log_PCB93_95 log_PCB90_101_89 log_PCB99 log_PCB110 log_PCB118_106
 log_PCB114_122 log_PCB105_127 log_PCB146_161 log_PCB153 log_PCB137 log_PCB138_158 log_PCB128 log_PCB167 log_PCB156 log_PCB157 log_PCB182_187 log_PCB183 log_PCB177 log_PCB172_192 log_PCB180 log_PCB170 log_PCB202 log_PCB199
 log_PCB196_203 log_PCB195 log_PCB194 log_PCB208 log_PCB206 log_PCB209 log_NMeFOSAA log_PFDS log_PFDoDA log_PFHpA log_PFHxS log_PFOS log_PFOA log_PFNA log_PFDA log_PFUnDA log_As log_Ba log_Cd log_Co log_Cr log_Cs log_Cu
 log_Hg log_Mn log_Mo log_Pb log_Sb log_Se log_Sn log_Tl log_Zn lg_totalocp lg_totalbdes lg_totalpcbs lg_totalpfas lg_totalmetals 
momage	energy PA_Tot_v0 TotalLipid momrace1 momrace2 momrace3 momBMI_group1 momBMI_group2 momedu1 momedu2 income_groupnew1 income_groupnew2 income_groupnew3 parity	Cotinine_group1 Cotinine_group2;
run;

data allvar;
 set chemical_diet_final_analysis;
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
proc reg DATA=chemical_diet_final_analysis;
ods output ParameterEstimates=adjusted&obs;
model &y=&x energy momage	PA_Tot_v0 momrace1 momrace2 momrace3 momBMI_group1 momBMI_group2 momedu1 momedu2 income_groupnew1 income_groupnew2 income_groupnew3 parity	Cotinine_group1 Cotinine_group2/TOL VIF COLLIN DW INFLUENCE;

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
OUTFILE= "C:\nus_project\1st_nus_chemical_nutrition\formal_analysis\revision02202024\foodgroup_chemical_association.xlsx"
DBMS=XLSX REPLACE;
SHEET="foodgroup_chemical_correct_TEI";
RUN;

proc datasets library=work nolist nodetails kill;
run; quit;

LIBNAME ep 'C:\nus_project\1st_nus_chemical_nutrition\formal_analysis\revision02202024'; options nofmterr;
proc stdize data=ep.chemical_diet_final_analysis out=chemical_diet_final_analysis method=std;
  var DASH_fruit_s--DASH_ssbnj_s AHEI_vegetable_s--AHEI_PUFA_p MED_vegetable_s--MED_meat_s;
run;

data chemical_diet_final_analysis;
set chemical_diet_final_analysis;
KEEP DASH_fruit_s--DASH_ssbnj_s AHEI_vegetable_s--AHEI_PUFA_p MED_vegetable_s--MED_meat_s log_BetaHCH log_GammaHCH log_HCB log_Oxychlordane log_TransChlordane log_TransNo_chlor log_P_P_DDE log_O_P_DDD log_P_P_DDD log_P_P_DDT log_Mirex log_BDE28 log_BDE47 log_BDE100 log_BDE99 log_BDE85 log_PBB153 log_BDE154 log_BDE153
 log_BDE183 log_PCB5_8 log_PCB18_17 log_PCB31_28 log_PCB33_20 log_PCB22 log_PCB52_73 log_PCB49_43 log_PCB47_48_75 log_PCB44 log_PCB41_64 log_PCB74_61 log_PCB70_76 log_PCB66_80 log_PCB93_95 log_PCB90_101_89 log_PCB99 log_PCB110 log_PCB118_106
 log_PCB114_122 log_PCB105_127 log_PCB146_161 log_PCB153 log_PCB137 log_PCB138_158 log_PCB128 log_PCB167 log_PCB156 log_PCB157 log_PCB182_187 log_PCB183 log_PCB177 log_PCB172_192 log_PCB180 log_PCB170 log_PCB202 log_PCB199
 log_PCB196_203 log_PCB195 log_PCB194 log_PCB208 log_PCB206 log_PCB209 log_NMeFOSAA log_PFDS log_PFDoDA log_PFHpA log_PFHxS log_PFOS log_PFOA log_PFNA log_PFDA log_PFUnDA log_As log_Ba log_Cd log_Co log_Cr log_Cs log_Cu
 log_Hg log_Mn log_Mo log_Pb log_Sb log_Se log_Sn log_Tl log_Zn lg_totalocp lg_totalbdes lg_totalpcbs lg_totalpfas lg_totalmetals 
momage	energy PA_Tot_v0 TotalLipid momrace1 momrace2 momrace3 momBMI_group1 momBMI_group2 momedu1 momedu2 income_groupnew1 income_groupnew2 income_groupnew3 parity	Cotinine_group1 Cotinine_group2;
run;

data allvar;
 set chemical_diet_final_analysis;
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
proc reg DATA=chemical_diet_final_analysis;
ods output ParameterEstimates=adjusted&obs;
model &y=&x TotalLipid energy momage	PA_Tot_v0 momrace1 momrace2 momrace3 momBMI_group1 momBMI_group2 momedu1 momedu2 income_groupnew1 income_groupnew2 income_groupnew3 parity	Cotinine_group1 Cotinine_group2/TOL VIF COLLIN DW INFLUENCE;

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
OUTFILE= "C:\nus_project\1st_nus_chemical_nutrition\formal_analysis\revision02202024\foodgroup_chemical_association.xlsx"
DBMS=XLSX REPLACE;
SHEET="fg_chemcorrect_lip_TEI";
RUN;

proc datasets library=work nolist nodetails kill;
run; quit;
