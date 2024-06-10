/* compare the mean difference of chemicals between low and high dietary pattern score*/
LIBNAME ep 'C:\nus_project\1st_nus_chemical_nutrition\formal_analysis\revision02202024'; options nofmterr;
data chemical_diet_final_analysis;
set ep.chemical_diet_final_analysis;
BetaHCH_adjusted=BetaHCH_sqrt2/TotalLipid*100000;
GammaHCH_adjusted=GammaHCH_sqrt2/TotalLipid*100000;
HCB_adjusted=HCB_sqrt2/TotalLipid*100000;
Oxychlordane_adjusted=Oxychlordane_sqrt2/TotalLipid*100000;
TransChlordane_adjusted=TransChlordane_sqrt2/TotalLipid*100000;
TransNo_chlor_adjusted=TransNo_chlor_sqrt2/TotalLipid*100000;
P_P_DDE_adjusted=P_P_DDE_sqrt2/TotalLipid*100000;
O_P_DDD_adjusted=O_P_DDD_sqrt2/TotalLipid*100000;
P_P_DDD_adjusted=P_P_DDD_sqrt2/TotalLipid*100000;
P_P_DDT_adjusted=P_P_DDT_sqrt2/TotalLipid*100000;
Mirex_adjusted=Mirex_sqrt2/TotalLipid*100000;
totalOCPs_adjusted=totalOCPs/TotalLipid*100000;
BDE28_adjusted=BDE28_sqrt2/TotalLipid*100000;
BDE47_adjusted=BDE47_sqrt2/TotalLipid*100000;
BDE100_adjusted=BDE100_sqrt2/TotalLipid*100000;
BDE99_adjusted=BDE99_sqrt2/TotalLipid*100000;
BDE85_adjusted=BDE85_sqrt2/TotalLipid*100000;
PBB153_adjusted=PBB153_sqrt2/TotalLipid*100000;
BDE154_adjusted=BDE154_sqrt2/TotalLipid*100000;
BDE153_adjusted=BDE153_sqrt2/TotalLipid*100000;
BDE183_adjusted=BDE183_sqrt2/TotalLipid*100000;
TotalPBDEs_adjusted=TotalPBDEs/TotalLipid*100000;
PCB5_8_adjusted=PCB5_8_sqrt2/TotalLipid*100000;
PCB18_17_adjusted=PCB18_17_sqrt2/TotalLipid*100000;
PCB31_28_adjusted=PCB31_28_sqrt2/TotalLipid*100000;
PCB33_20_adjusted=PCB33_20_sqrt2/TotalLipid*100000;
PCB22_adjusted=PCB22_sqrt2/TotalLipid*100000;
PCB52_73_adjusted=PCB52_73_sqrt2/TotalLipid*100000;
PCB49_43_adjusted=PCB49_43_sqrt2/TotalLipid*100000;
PCB47_48_75_adjusted=PCB47_48_75_sqrt2/TotalLipid*100000;
PCB44_adjusted=PCB44_sqrt2/TotalLipid*100000;
PCB41_64_adjusted=PCB41_64_sqrt2/TotalLipid*100000;
PCB74_61_adjusted=PCB74_61_sqrt2/TotalLipid*100000;
PCB70_76_adjusted=PCB70_76_sqrt2/TotalLipid*100000;
PCB66_80_adjusted=PCB66_80_sqrt2/TotalLipid*100000;
PCB93_95_adjusted=PCB93_95_sqrt2/TotalLipid*100000;
PCB90_101_89_adjusted=PCB90_101_89_sqrt2/TotalLipid*100000;
PCB99_adjusted=PCB99_sqrt2/TotalLipid*100000;
PCB110_adjusted=PCB110_sqrt2/TotalLipid*100000;
PCB118_106_adjusted=PCB118_106_sqrt2/TotalLipid*100000;
PCB114_122_adjusted=PCB114_122_sqrt2/TotalLipid*100000;
PCB105_127_adjusted=PCB105_127_sqrt2/TotalLipid*100000;
PCB146_161_adjusted=PCB146_161_sqrt2/TotalLipid*100000;
PCB153_adjusted=PCB153_sqrt2/TotalLipid*100000;
PCB137_adjusted=PCB137_sqrt2/TotalLipid*100000;
PCB138_158_adjusted=PCB138_158_sqrt2/TotalLipid*100000;
PCB128_adjusted=PCB128_sqrt2/TotalLipid*100000;
PCB167_adjusted=PCB167_sqrt2/TotalLipid*100000;
PCB156_adjusted=PCB156_sqrt2/TotalLipid*100000;
PCB157_adjusted=PCB157_sqrt2/TotalLipid*100000;
PCB182_187_adjusted=PCB182_187_sqrt2/TotalLipid*100000;
PCB183_adjusted=PCB183_sqrt2/TotalLipid*100000;
PCB177_adjusted=PCB177_sqrt2/TotalLipid*100000;
PCB172_192_adjusted=PCB172_192_sqrt2/TotalLipid*100000;
PCB180_adjusted=PCB180_sqrt2/TotalLipid*100000;
PCB170_adjusted=PCB170_sqrt2/TotalLipid*100000;
PCB202_adjusted=PCB202_sqrt2/TotalLipid*100000;
PCB199_adjusted=PCB199_sqrt2/TotalLipid*100000;
PCB196_203_adjusted=PCB196_203_sqrt2/TotalLipid*100000;
PCB195_adjusted=PCB195_sqrt2/TotalLipid*100000;
PCB194_adjusted=PCB194_sqrt2/TotalLipid*100000;
PCB208_adjusted=PCB208_sqrt2/TotalLipid*100000;
PCB206_adjusted=PCB206_sqrt2/TotalLipid*100000;
PCB209_adjusted=PCB209_sqrt2/TotalLipid*100000;
totalPCBs_adjusted=totalPCBs/TotalLipid*100000;
run;

proc sort data=chemical_diet_final_analysis out=chemical_diet_final_analysis;
by amed_median;
run;

PROC MEANS MEAN MEDIAN STD QRANGE MAX MIN DATA=chemical_diet_final_analysis;
VAR BetaHCH_adjusted--totalPCBs_adjusted NMeFOSAA_sqrt2
 PFDS_sqrt2 PFDoDA_sqrt2 PFHpA_sqrt2 PFHxS_sqrt2 PFOS_sqrt2 PFOA_sqrt2 PFNA_sqrt2 PFDA_sqrt2 PFUnDA_sqrt2 As_sqrt2 Ba_sqrt2 Cd_sqrt2 Co_sqrt2 Cr_sqrt2 Cs_sqrt2 Cu_sqrt2 Hg_sqrt2 Mn_sqrt2 Mo_sqrt2 Pb_sqrt2 Sb_sqrt2 Se_sqrt2 Sn_sqrt2
 Tl_sqrt2 Zn_sqrt2 totalPFAS totalmetals;
by amed_median;
RUN;

proc sort data=chemical_diet_final_analysis out=chemical_diet_final_analysis;
by ahei_median;
run;

PROC MEANS MEAN MEDIAN STD QRANGE MAX MIN DATA=chemical_diet_final_analysis;
VAR BetaHCH_adjusted--totalPCBs_adjusted NMeFOSAA_sqrt2
 PFDS_sqrt2 PFDoDA_sqrt2 PFHpA_sqrt2 PFHxS_sqrt2 PFOS_sqrt2 PFOA_sqrt2 PFNA_sqrt2 PFDA_sqrt2 PFUnDA_sqrt2 As_sqrt2 Ba_sqrt2 Cd_sqrt2 Co_sqrt2 Cr_sqrt2 Cs_sqrt2 Cu_sqrt2 Hg_sqrt2 Mn_sqrt2 Mo_sqrt2 Pb_sqrt2 Sb_sqrt2 Se_sqrt2 Sn_sqrt2
 Tl_sqrt2 Zn_sqrt2 totalPFAS totalmetals;
by ahei_median;
RUN;

proc sort data=chemical_diet_final_analysis out=chemical_diet_final_analysis;
by dash_median;
run;

PROC MEANS MEAN MEDIAN STD QRANGE MAX MIN DATA=chemical_diet_final_analysis;
VAR BetaHCH_adjusted--totalPCBs_adjusted NMeFOSAA_sqrt2
 PFDS_sqrt2 PFDoDA_sqrt2 PFHpA_sqrt2 PFHxS_sqrt2 PFOS_sqrt2 PFOA_sqrt2 PFNA_sqrt2 PFDA_sqrt2 PFUnDA_sqrt2 As_sqrt2 Ba_sqrt2 Cd_sqrt2 Co_sqrt2 Cr_sqrt2 Cs_sqrt2 Cu_sqrt2 Hg_sqrt2 Mn_sqrt2 Mo_sqrt2 Pb_sqrt2 Sb_sqrt2 Se_sqrt2 Sn_sqrt2
 Tl_sqrt2 Zn_sqrt2 totalPFAS totalmetals;
by dash_median;
RUN;


proc npar1way wilcoxon data=chemical_diet_final_analysis;
Class amed_median;
var BetaHCH_adjusted--totalPCBs_adjusted NMeFOSAA_sqrt2
 PFDS_sqrt2 PFDoDA_sqrt2 PFHpA_sqrt2 PFHxS_sqrt2 PFOS_sqrt2 PFOA_sqrt2 PFNA_sqrt2 PFDA_sqrt2 PFUnDA_sqrt2 As_sqrt2 Ba_sqrt2 Cd_sqrt2 Co_sqrt2 Cr_sqrt2 Cs_sqrt2 Cu_sqrt2 Hg_sqrt2 Mn_sqrt2 Mo_sqrt2 Pb_sqrt2 Sb_sqrt2 Se_sqrt2 Sn_sqrt2
 Tl_sqrt2 Zn_sqrt2 totalPFAS totalmetals;
run;


proc npar1way wilcoxon data=chemical_diet_final_analysis;
Class ahei_median;
var BetaHCH_adjusted--totalPCBs_adjusted NMeFOSAA_sqrt2
 PFDS_sqrt2 PFDoDA_sqrt2 PFHpA_sqrt2 PFHxS_sqrt2 PFOS_sqrt2 PFOA_sqrt2 PFNA_sqrt2 PFDA_sqrt2 PFUnDA_sqrt2 As_sqrt2 Ba_sqrt2 Cd_sqrt2 Co_sqrt2 Cr_sqrt2 Cs_sqrt2 Cu_sqrt2 Hg_sqrt2 Mn_sqrt2 Mo_sqrt2 Pb_sqrt2 Sb_sqrt2 Se_sqrt2 Sn_sqrt2
 Tl_sqrt2 Zn_sqrt2 totalPFAS totalmetals;
run;

proc npar1way wilcoxon data=chemical_diet_final_analysis;
Class dash_median;
var BetaHCH_adjusted--totalPCBs_adjusted NMeFOSAA_sqrt2
 PFDS_sqrt2 PFDoDA_sqrt2 PFHpA_sqrt2 PFHxS_sqrt2 PFOS_sqrt2 PFOA_sqrt2 PFNA_sqrt2 PFDA_sqrt2 PFUnDA_sqrt2 As_sqrt2 Ba_sqrt2 Cd_sqrt2 Co_sqrt2 Cr_sqrt2 Cs_sqrt2 Cu_sqrt2 Hg_sqrt2 Mn_sqrt2 Mo_sqrt2 Pb_sqrt2 Sb_sqrt2 Se_sqrt2 Sn_sqrt2
 Tl_sqrt2 Zn_sqrt2 totalPFAS totalmetals;
run;

#################################### to calculated the adjusted p-value in R studio
library(dplyr)
library(tidyr)

median_diff$amed_BH<- p.adjust(median_diff$P_value_amed, method = "BH")
median_diff$ahei_BH<- p.adjust(median_diff$P_value_ahei, method = "BH")
median_diff$dash_BH<- p.adjust(median_diff$P_value_dash, method = "BH")

sheets = list("median_diff" =median_diff)
write.xlsx(sheets,"C:/nus_project/1st_nus_chemical_nutrition/formal_analysis/revision02202024/median_diff.xlsx")
