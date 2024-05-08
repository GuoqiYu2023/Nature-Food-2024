setwd("C:/nus_project/1st_nus_chemical_nutrition/formal_analysis/revision02202024")
library(rio)
library(openxlsx)
library(readxl)
library(dplyr)
library(plyr)
library(psych)
library(ggplot2)
library(clogitL1)
library("mice")
library("survival")
library("DataExplorer")
library(data.table)
library(glmnet)

chemical_diet_final_analysis=import("C:/nus_project/1st_nus_chemical_nutrition/formal_analysis/revision02202024/chemical_diet_final_analysis.xlsx")
myvars<-c("subject","energy","momage","PA_Tot_v0","momrace1","momrace2","momrace3","momBMI_group1","momBMI_group2","momedu1","momedu2","income_groupnew1","income_groupnew2","income_groupnew3","parity","Cotinine_group1","Cotinine_group2","DASH_fruit_s","DASH_vegetable_s","DASH_nutlegume_s","DASH_wgrain_g","DASH_lfdairy_s","DASH_sodium_mg","DASH_rpmeat_s","DASH_ssbnj_s",
          "AHEI_wfruit_s","AHEI_ssb_s","AHEI_transfat_p","AHEI_n3_mg","AHEI_PUFA_p","MED_legume_s","MED_nut_s","MED_fish_s","MED_mufa_saf_r","MED_fruit_nut_g","MED_dairy_s","MED_grain_g","MED_meat_s",
          "log_BetaHCH","log_GammaHCH","log_HCB","log_Oxychlordane","log_TransChlordane","log_TransNo_chlor","log_P_P_DDE","log_O_P_DDD","log_P_P_DDD","log_P_P_DDT","log_Mirex","log_BDE28","log_BDE47","log_BDE100","log_BDE99","log_BDE85","log_PBB153","log_BDE154","log_BDE153","log_BDE183","log_PCB5_8","log_PCB18_17","log_PCB31_28","log_PCB33_20","log_PCB22","log_PCB52_73","log_PCB49_43","log_PCB47_48_75","log_PCB44","log_PCB41_64","log_PCB74_61","log_PCB70_76","log_PCB66_80","log_PCB93_95","log_PCB90_101_89","log_PCB99","log_PCB110","log_PCB118_106","log_PCB114_122","log_PCB105_127","log_PCB146_161","log_PCB153","log_PCB137","log_PCB138_158","log_PCB128","log_PCB167","log_PCB156","log_PCB157","log_PCB182_187","log_PCB183","log_PCB177","log_PCB172_192","log_PCB180","log_PCB170","log_PCB202","log_PCB199","log_PCB196_203","log_PCB195","log_PCB194","log_PCB208","log_PCB206","log_PCB209","log_NMeFOSAA","log_PFDS","log_PFDoDA","log_PFHpA","log_PFHxS","log_PFOS","log_PFOA","log_PFNA","log_PFDA","log_PFUnDA","log_As","log_Ba","log_Cd","log_Co","log_Cr","log_Cs","log_Cu","log_Hg","log_Mn","log_Mo","log_Pb","log_Sb","log_Se","log_Sn","log_Tl","log_Zn","lg_totalocp","lg_totalbdes","lg_totalpcbs","lg_totalpfas","lg_totalmetals")
chemical_diet<- chemical_diet_final_analysis[,myvars]
head(chemical_diet)
dim(chemical_diet)
################################################################# 
run_elastic_net <- function(chemical_diet, response_var) {
  
  myvars <- c("subject", "energy", "momage", "PA_Tot_v0", "momrace1", "momrace2", "momrace3", "momBMI_group1", "momBMI_group2",
              "momedu1", "momedu2", "income_groupnew1", "income_groupnew2", "income_groupnew3", "parity", "Cotinine_group1", 
              "Cotinine_group2", "DASH_fruit_s", "DASH_vegetable_s", "DASH_nutlegume_s", "DASH_wgrain_g", "DASH_lfdairy_s", 
              "DASH_sodium_mg", "DASH_rpmeat_s", "DASH_ssbnj_s", "AHEI_wfruit_s", "AHEI_ssb_s", "AHEI_transfat_p", "AHEI_n3_mg", 
              "AHEI_PUFA_p", "MED_legume_s", "MED_nut_s", "MED_fish_s", "MED_mufa_saf_r", "MED_fruit_nut_g", "MED_dairy_s", "MED_grain_g", 
              "MED_meat_s", response_var)
  chemical_diet_new<- chemical_diet[,myvars]
  chemical_diet_newnew2=chemical_diet_new[complete.cases(chemical_diet_new),]
  dim(chemical_diet_newnew2)
  x <- as.matrix(chemical_diet_newnew2[,c(2:38)])
  y <- chemical_diet_newnew2[[response_var]]
  mode(x)
  mode(y)
  set.seed(123)
  y<-as.numeric(y)
  y<-as.matrix(y)
  sum(is.na(x))
  
  covar_data1<- x[,c(1:16)]
  pollut_data1<-x[,c(17:37)]
  pollut_data1<-scale(pollut_data1[,1:21],T,T)
  
  head(pollut_data1)
  
  covar_adjust_data1 <-cbind(pollut_data1,covar_data1)
  covar_adjust_data1=as.matrix(covar_adjust_data1)
  
  p_fac_data1 <- rep(1,37)
  p_fac_data1[c(17:37)]<-0
  
  # fit the model with alpha from 0 to 1 by 20 
  list.of.fits<-list()
  for (i in 0:20) {fit.name<-paste0("alpha", i/20)
  list.of.fits[[fit.name]]<-cv.glmnet(x=covar_adjust_data1,y=y,family="gaussian",
                                      type.measure = "mse",alpha=i/20)}
  list.of.fits
  mse_result_data1<-matrix(NA,nrow=21,ncol=2,dimnames = list(c(paste("fit",0:20,sep=".")),c("mse","alpha")))
  for (i in 0:20){mse_result_data1[i+1,1]<-min(list.of.fits[[i+1]][2]$cvm) 
  mse_result_data1[i+1,2]<-i/20}
  loc<-which.max(mse_result_data1[,1])[[1]]
  min.mse<-mse_result_data1[loc,2]
  ###################
  set.seed(123)
  fit.11_data1<-cv.glmnet(x=covar_adjust_data1,y=y,family="gaussian",
                          type.measure = "mse",alpha=min.mse,
                          nfolds = 10,standardize=F,
                          keep=T)
  coef_data1<-coef(fit.11_data1,s=fit.11_data1$lambda.min,exact=T,x=covar_adjust_data1,
                   y=y)
  plot (cv.glmnet(x=covar_adjust_data1,y=y,family="gaussian"))
  coefficients<-coef(fit.11_data1,s=fit.11_data1$lambda.min)
  Active.Index<-which(coefficients!=0)
  dim(Active.Index)
  ### combine the elastic net regression results 
  response_var <- cbind(varname=names(as.data.frame(covar_adjust_data1)),
                        cbind(preecla=as.numeric(coef_data1))[-1,])
}

coef_combine1_log_BetaHCH <- run_elastic_net(chemical_diet, "log_BetaHCH")
coef_combine1_log_GammaHCH <- run_elastic_net(chemical_diet, "log_GammaHCH")
coef_combine1_log_HCB <- run_elastic_net(chemical_diet, "log_HCB")
coef_combine1_log_Oxychlordane <- run_elastic_net(chemical_diet, "log_Oxychlordane")
coef_combine1_log_TransChlordane <- run_elastic_net(chemical_diet, "log_TransChlordane")
coef_combine1_log_TransNo_chlor <- run_elastic_net(chemical_diet, "log_TransNo_chlor")
coef_combine1_log_P_P_DDE <- run_elastic_net(chemical_diet, "log_P_P_DDE")
coef_combine1_log_O_P_DDD <- run_elastic_net(chemical_diet, "log_O_P_DDD")
coef_combine1_log_P_P_DDD <- run_elastic_net(chemical_diet, "log_P_P_DDD")
coef_combine1_log_P_P_DDT <- run_elastic_net(chemical_diet, "log_P_P_DDT")
coef_combine1_log_Mirex <- run_elastic_net(chemical_diet, "log_Mirex")
coef_combine1_log_BDE28 <- run_elastic_net(chemical_diet, "log_BDE28")
coef_combine1_log_BDE47 <- run_elastic_net(chemical_diet, "log_BDE47")
coef_combine1_log_BDE100 <- run_elastic_net(chemical_diet, "log_BDE100")
coef_combine1_log_BDE99 <- run_elastic_net(chemical_diet, "log_BDE99")
coef_combine1_log_BDE85 <- run_elastic_net(chemical_diet, "log_BDE85")
coef_combine1_log_PBB153 <- run_elastic_net(chemical_diet, "log_PBB153")
coef_combine1_log_BDE154 <- run_elastic_net(chemical_diet, "log_BDE154")
coef_combine1_log_BDE153 <- run_elastic_net(chemical_diet, "log_BDE153")
coef_combine1_log_BDE183 <- run_elastic_net(chemical_diet, "log_BDE183")
coef_combine1_log_PCB5_8 <- run_elastic_net(chemical_diet, "log_PCB5_8")
coef_combine1_log_PCB18_17 <- run_elastic_net(chemical_diet, "log_PCB18_17")
coef_combine1_log_PCB31_28 <- run_elastic_net(chemical_diet, "log_PCB31_28")
coef_combine1_log_PCB33_20 <- run_elastic_net(chemical_diet, "log_PCB33_20")
coef_combine1_log_PCB22 <- run_elastic_net(chemical_diet, "log_PCB22")
coef_combine1_log_PCB52_73 <- run_elastic_net(chemical_diet, "log_PCB52_73")
coef_combine1_log_PCB49_43 <- run_elastic_net(chemical_diet, "log_PCB49_43")
coef_combine1_log_PCB47_48_75 <- run_elastic_net(chemical_diet, "log_PCB47_48_75")
coef_combine1_log_PCB44 <- run_elastic_net(chemical_diet, "log_PCB44")
coef_combine1_log_PCB41_64 <- run_elastic_net(chemical_diet, "log_PCB41_64")
coef_combine1_log_PCB74_61 <- run_elastic_net(chemical_diet, "log_PCB74_61")
coef_combine1_log_PCB70_76 <- run_elastic_net(chemical_diet, "log_PCB70_76")
coef_combine1_log_PCB66_80 <- run_elastic_net(chemical_diet, "log_PCB66_80")
coef_combine1_log_PCB93_95 <- run_elastic_net(chemical_diet, "log_PCB93_95")
coef_combine1_log_PCB90_101_89 <- run_elastic_net(chemical_diet, "log_PCB90_101_89")
coef_combine1_log_PCB99 <- run_elastic_net(chemical_diet, "log_PCB99")
coef_combine1_log_PCB110 <- run_elastic_net(chemical_diet, "log_PCB110")
coef_combine1_log_PCB118_106 <- run_elastic_net(chemical_diet, "log_PCB118_106")
coef_combine1_log_PCB114_122 <- run_elastic_net(chemical_diet, "log_PCB114_122")
coef_combine1_log_PCB105_127 <- run_elastic_net(chemical_diet, "log_PCB105_127")
coef_combine1_log_PCB146_161 <- run_elastic_net(chemical_diet, "log_PCB146_161")
coef_combine1_log_PCB153 <- run_elastic_net(chemical_diet, "log_PCB153")
coef_combine1_log_PCB137 <- run_elastic_net(chemical_diet, "log_PCB137")
coef_combine1_log_PCB138_158 <- run_elastic_net(chemical_diet, "log_PCB138_158")
coef_combine1_log_PCB128 <- run_elastic_net(chemical_diet, "log_PCB128")
coef_combine1_log_PCB167 <- run_elastic_net(chemical_diet, "log_PCB167")
coef_combine1_log_PCB156 <- run_elastic_net(chemical_diet, "log_PCB156")
coef_combine1_log_PCB157 <- run_elastic_net(chemical_diet, "log_PCB157")
coef_combine1_log_PCB182_187 <- run_elastic_net(chemical_diet, "log_PCB182_187")
coef_combine1_log_PCB183 <- run_elastic_net(chemical_diet, "log_PCB183")
coef_combine1_log_PCB177 <- run_elastic_net(chemical_diet, "log_PCB177")
coef_combine1_log_PCB172_192 <- run_elastic_net(chemical_diet, "log_PCB172_192")
coef_combine1_log_PCB180 <- run_elastic_net(chemical_diet, "log_PCB180")
coef_combine1_log_PCB170 <- run_elastic_net(chemical_diet, "log_PCB170")
coef_combine1_log_PCB202 <- run_elastic_net(chemical_diet, "log_PCB202")
coef_combine1_log_PCB199 <- run_elastic_net(chemical_diet, "log_PCB199")
coef_combine1_log_PCB196_203 <- run_elastic_net(chemical_diet, "log_PCB196_203")
coef_combine1_log_PCB195 <- run_elastic_net(chemical_diet, "log_PCB195")
coef_combine1_log_PCB194 <- run_elastic_net(chemical_diet, "log_PCB194")
coef_combine1_log_PCB208 <- run_elastic_net(chemical_diet, "log_PCB208")
coef_combine1_log_PCB206 <- run_elastic_net(chemical_diet, "log_PCB206")
coef_combine1_log_PCB209 <- run_elastic_net(chemical_diet, "log_PCB209")
coef_combine1_log_NMeFOSAA <- run_elastic_net(chemical_diet, "log_NMeFOSAA")
coef_combine1_log_PFDS <- run_elastic_net(chemical_diet, "log_PFDS")
coef_combine1_log_PFDoDA <- run_elastic_net(chemical_diet, "log_PFDoDA")
coef_combine1_log_PFHpA <- run_elastic_net(chemical_diet, "log_PFHpA")
coef_combine1_log_PFHxS <- run_elastic_net(chemical_diet, "log_PFHxS")
coef_combine1_log_PFOS <- run_elastic_net(chemical_diet, "log_PFOS")
coef_combine1_log_PFOA <- run_elastic_net(chemical_diet, "log_PFOA")
coef_combine1_log_PFNA <- run_elastic_net(chemical_diet, "log_PFNA")
coef_combine1_log_PFDA <- run_elastic_net(chemical_diet, "log_PFDA")
coef_combine1_log_PFUnDA <- run_elastic_net(chemical_diet, "log_PFUnDA")
coef_combine1_log_As <- run_elastic_net(chemical_diet, "log_As")
coef_combine1_log_Ba <- run_elastic_net(chemical_diet, "log_Ba")
coef_combine1_log_Cd <- run_elastic_net(chemical_diet, "log_Cd")
coef_combine1_log_Co <- run_elastic_net(chemical_diet, "log_Co")
coef_combine1_log_Cr <- run_elastic_net(chemical_diet, "log_Cr")
coef_combine1_log_Cs <- run_elastic_net(chemical_diet, "log_Cs")
coef_combine1_log_Cu <- run_elastic_net(chemical_diet, "log_Cu")
coef_combine1_log_Hg <- run_elastic_net(chemical_diet, "log_Hg")
coef_combine1_log_Mn <- run_elastic_net(chemical_diet, "log_Mn")
coef_combine1_log_Mo <- run_elastic_net(chemical_diet, "log_Mo")
coef_combine1_log_Pb <- run_elastic_net(chemical_diet, "log_Pb")
coef_combine1_log_Sb <- run_elastic_net(chemical_diet, "log_Sb")
coef_combine1_log_Se <- run_elastic_net(chemical_diet, "log_Se")
coef_combine1_log_Sn <- run_elastic_net(chemical_diet, "log_Sn")
coef_combine1_log_Tl <- run_elastic_net(chemical_diet, "log_Tl")
coef_combine1_log_Zn <- run_elastic_net(chemical_diet, "log_Zn")
coef_combine1_lg_totalocp <- run_elastic_net(chemical_diet, "lg_totalocp")
coef_combine1_lg_totalbdes <- run_elastic_net(chemical_diet, "lg_totalbdes")
coef_combine1_lg_totalpcbs <- run_elastic_net(chemical_diet, "lg_totalpcbs")
coef_combine1_lg_totalpfas <- run_elastic_net(chemical_diet, "lg_totalpfas")
coef_combine1_lg_totalmetals <- run_elastic_net(chemical_diet, "lg_totalmetals")
###############################################################################################################################################
coef_combine1_totalchem=cbind(as.data.frame(coef_combine1_log_BetaHCH
),as.data.frame(coef_combine1_log_GammaHCH
),as.data.frame(coef_combine1_log_HCB
),as.data.frame(coef_combine1_log_Oxychlordane
),as.data.frame(coef_combine1_log_TransChlordane
),as.data.frame(coef_combine1_log_TransNo_chlor
),as.data.frame(coef_combine1_log_P_P_DDE
),as.data.frame(coef_combine1_log_O_P_DDD
),as.data.frame(coef_combine1_log_P_P_DDD
),as.data.frame(coef_combine1_log_P_P_DDT
),as.data.frame(coef_combine1_log_Mirex
),as.data.frame(coef_combine1_log_BDE28
),as.data.frame(coef_combine1_log_BDE47
),as.data.frame(coef_combine1_log_BDE100
),as.data.frame(coef_combine1_log_BDE99
),as.data.frame(coef_combine1_log_BDE85
),as.data.frame(coef_combine1_log_PBB153
),as.data.frame(coef_combine1_log_BDE154
),as.data.frame(coef_combine1_log_BDE153
),as.data.frame(coef_combine1_log_BDE183
),as.data.frame(coef_combine1_log_PCB5_8
),as.data.frame(coef_combine1_log_PCB18_17
),as.data.frame(coef_combine1_log_PCB31_28
),as.data.frame(coef_combine1_log_PCB33_20
),as.data.frame(coef_combine1_log_PCB22
),as.data.frame(coef_combine1_log_PCB52_73
),as.data.frame(coef_combine1_log_PCB49_43
),as.data.frame(coef_combine1_log_PCB47_48_75
),as.data.frame(coef_combine1_log_PCB44
),as.data.frame(coef_combine1_log_PCB41_64
),as.data.frame(coef_combine1_log_PCB74_61
),as.data.frame(coef_combine1_log_PCB70_76
),as.data.frame(coef_combine1_log_PCB66_80
),as.data.frame(coef_combine1_log_PCB93_95
),as.data.frame(coef_combine1_log_PCB90_101_89
),as.data.frame(coef_combine1_log_PCB99
),as.data.frame(coef_combine1_log_PCB110
),as.data.frame(coef_combine1_log_PCB118_106
),as.data.frame(coef_combine1_log_PCB114_122
),as.data.frame(coef_combine1_log_PCB105_127
),as.data.frame(coef_combine1_log_PCB146_161
),as.data.frame(coef_combine1_log_PCB153
),as.data.frame(coef_combine1_log_PCB137
),as.data.frame(coef_combine1_log_PCB138_158
),as.data.frame(coef_combine1_log_PCB128
),as.data.frame(coef_combine1_log_PCB167
),as.data.frame(coef_combine1_log_PCB156
),as.data.frame(coef_combine1_log_PCB157
),as.data.frame(coef_combine1_log_PCB182_187
),as.data.frame(coef_combine1_log_PCB183
),as.data.frame(coef_combine1_log_PCB177
),as.data.frame(coef_combine1_log_PCB172_192
),as.data.frame(coef_combine1_log_PCB180
),as.data.frame(coef_combine1_log_PCB170
),as.data.frame(coef_combine1_log_PCB202
),as.data.frame(coef_combine1_log_PCB199
),as.data.frame(coef_combine1_log_PCB196_203
),as.data.frame(coef_combine1_log_PCB195
),as.data.frame(coef_combine1_log_PCB194
),as.data.frame(coef_combine1_log_PCB208
),as.data.frame(coef_combine1_log_PCB206
),as.data.frame(coef_combine1_log_PCB209
),as.data.frame(coef_combine1_log_NMeFOSAA
),as.data.frame(coef_combine1_log_PFDS
),as.data.frame(coef_combine1_log_PFDoDA
),as.data.frame(coef_combine1_log_PFHpA
),as.data.frame(coef_combine1_log_PFHxS
),as.data.frame(coef_combine1_log_PFOS
),as.data.frame(coef_combine1_log_PFOA
),as.data.frame(coef_combine1_log_PFNA
),as.data.frame(coef_combine1_log_PFDA
),as.data.frame(coef_combine1_log_PFUnDA
),as.data.frame(coef_combine1_log_As
),as.data.frame(coef_combine1_log_Ba
),as.data.frame(coef_combine1_log_Cd
),as.data.frame(coef_combine1_log_Co
),as.data.frame(coef_combine1_log_Cr
),as.data.frame(coef_combine1_log_Cs
),as.data.frame(coef_combine1_log_Cu
),as.data.frame(coef_combine1_log_Hg
),as.data.frame(coef_combine1_log_Mn
),as.data.frame(coef_combine1_log_Mo
),as.data.frame(coef_combine1_log_Pb
),as.data.frame(coef_combine1_log_Sb
),as.data.frame(coef_combine1_log_Se
),as.data.frame(coef_combine1_log_Sn
),as.data.frame(coef_combine1_log_Tl
),as.data.frame(coef_combine1_log_Zn
),as.data.frame(coef_combine1_lg_totalocp
),as.data.frame(coef_combine1_lg_totalbdes
),as.data.frame(coef_combine1_lg_totalpcbs
),as.data.frame(coef_combine1_lg_totalpfas
),as.data.frame(coef_combine1_lg_totalmetals))
write.xlsx(coef_combine1_totalchem,"C:/nus_project/1st_nus_chemical_nutrition/formal_analysis/revision02202024/coef_combine1_totalchem.xlsx")

################################################################################################################# chemicals class
setwd("C:/nus_project/1st_nus_chemical_nutrition/formal_analysis/revision02202024")
library(pheatmap)
library(vegan)
library(openxlsx)
library(gplots)
data<- read.xlsx("coef_combine1_totalchem.xlsx", sheet ="Sheet2")

rownames(data) <- data[,1]
data<-data[,-1]
data<- as.matrix(data)

Figure S7a<-pheatmap(data, cluster_row = TRUE,cluster_cols = FALSE,border_color = "black", 
                                        display_numbers = TRUE,        
                                        number_color = "black",         
                                        fontsize=10,                   
                                        number_format = "%.2f")            
pdf("Figure S7a.pdf", width = 6, height = 6)
print(Figure S7a)
dev.off()
################################################################################################################# ENR without nutrients
setwd("C:/nus_project/1st_nus_chemical_nutrition/formal_analysis/revision02202024")
library(rio)
library(openxlsx)
library(readxl)
library(dplyr)
library(plyr)
library(psych)
library(ggplot2)
library(clogitL1)
library("mice")
library("survival")
library("DataExplorer")
library(data.table)
library(glmnet)

chemical_diet_final_analysis=import("C:/nus_project/1st_nus_chemical_nutrition/formal_analysis/revision02202024/chemical_diet_final_analysis.xlsx")
myvars<-c("subject","energy","momage","PA_Tot_v0","momrace1","momrace2","momrace3","momBMI_group1","momBMI_group2","momedu1","momedu2","income_groupnew1","income_groupnew2","income_groupnew3","parity","Cotinine_group1","Cotinine_group2","DASH_fruit_s","DASH_vegetable_s","DASH_nutlegume_s","DASH_wgrain_g","DASH_lfdairy_s","DASH_sodium_mg","DASH_rpmeat_s","DASH_ssbnj_s",
          "AHEI_wfruit_s","AHEI_ssb_s","AHEI_transfat_p","AHEI_n3_mg","AHEI_PUFA_p","MED_legume_s","MED_nut_s","MED_fish_s","MED_mufa_saf_r","MED_fruit_nut_g","MED_dairy_s","MED_grain_g","MED_meat_s",
          "log_BetaHCH","log_GammaHCH","log_HCB","log_Oxychlordane","log_TransChlordane","log_TransNo_chlor","log_P_P_DDE","log_O_P_DDD","log_P_P_DDD","log_P_P_DDT","log_Mirex","log_BDE28","log_BDE47","log_BDE100","log_BDE99","log_BDE85","log_PBB153","log_BDE154","log_BDE153","log_BDE183","log_PCB5_8","log_PCB18_17","log_PCB31_28","log_PCB33_20","log_PCB22","log_PCB52_73","log_PCB49_43","log_PCB47_48_75","log_PCB44","log_PCB41_64","log_PCB74_61","log_PCB70_76","log_PCB66_80","log_PCB93_95","log_PCB90_101_89","log_PCB99","log_PCB110","log_PCB118_106","log_PCB114_122","log_PCB105_127","log_PCB146_161","log_PCB153","log_PCB137","log_PCB138_158","log_PCB128","log_PCB167","log_PCB156","log_PCB157","log_PCB182_187","log_PCB183","log_PCB177","log_PCB172_192","log_PCB180","log_PCB170","log_PCB202","log_PCB199","log_PCB196_203","log_PCB195","log_PCB194","log_PCB208","log_PCB206","log_PCB209","log_NMeFOSAA","log_PFDS","log_PFDoDA","log_PFHpA","log_PFHxS","log_PFOS","log_PFOA","log_PFNA","log_PFDA","log_PFUnDA","log_As","log_Ba","log_Cd","log_Co","log_Cr","log_Cs","log_Cu","log_Hg","log_Mn","log_Mo","log_Pb","log_Sb","log_Se","log_Sn","log_Tl","log_Zn","lg_totalocp","lg_totalbdes","lg_totalpcbs","lg_totalpfas","lg_totalmetals")
chemical_diet<- chemical_diet_final_analysis[,myvars]
head(chemical_diet)
dim(chemical_diet)
################################################################# 
run_elastic_net <- function(chemical_diet, response_var) {
  
  myvars <- c("subject", "energy", "momage", "PA_Tot_v0", "momrace1", "momrace2", "momrace3", "momBMI_group1", "momBMI_group2",
              "momedu1", "momedu2", "income_groupnew1", "income_groupnew2", "income_groupnew3", "parity", "Cotinine_group1", 
              "Cotinine_group2", "DASH_fruit_s", "DASH_vegetable_s", "DASH_nutlegume_s", "DASH_wgrain_g", "DASH_lfdairy_s", 
              "DASH_sodium_mg", "DASH_rpmeat_s", "DASH_ssbnj_s", "AHEI_wfruit_s", "AHEI_ssb_s",  "MED_legume_s", "MED_nut_s", "MED_fish_s","MED_fruit_nut_g", "MED_dairy_s", "MED_grain_g", 
              "MED_meat_s", response_var)
  chemical_diet_new<- chemical_diet[,myvars]
  chemical_diet_newnew2=chemical_diet_new[complete.cases(chemical_diet_new),]
  dim(chemical_diet_newnew2)
  x <- as.matrix(chemical_diet_newnew2[,c(2:34)])
  y <- chemical_diet_newnew2[[response_var]]
  mode(x)
  mode(y)
  set.seed(123)
  y<-as.numeric(y)
  y<-as.matrix(y)
  sum(is.na(x))
  
  covar_data1<- x[,c(1:16)]
  pollut_data1<-x[,c(17:33)]
  pollut_data1<-scale(pollut_data1[,1:17],T,T)
  
  head(pollut_data1)
  
  covar_adjust_data1 <-cbind(pollut_data1,covar_data1)
  covar_adjust_data1=as.matrix(covar_adjust_data1)
  
  p_fac_data1 <- rep(1,33)
  p_fac_data1[c(17:33)]<-0
  
  # fit the model with alpha from 0 to 1 by 20 
  list.of.fits<-list()
  for (i in 0:20) {fit.name<-paste0("alpha", i/20)
  list.of.fits[[fit.name]]<-cv.glmnet(x=covar_adjust_data1,y=y,family="gaussian",
                                      type.measure = "mse",alpha=i/20)}
  list.of.fits
  mse_result_data1<-matrix(NA,nrow=21,ncol=2,dimnames = list(c(paste("fit",0:20,sep=".")),c("mse","alpha")))
  for (i in 0:20){mse_result_data1[i+1,1]<-min(list.of.fits[[i+1]][2]$cvm) 
  mse_result_data1[i+1,2]<-i/20}
  loc<-which.max(mse_result_data1[,1])[[1]]
  min.mse<-mse_result_data1[loc,2]
  ###################
  set.seed(123)
  fit.11_data1<-cv.glmnet(x=covar_adjust_data1,y=y,family="gaussian",
                          type.measure = "mse",alpha=min.mse,
                          nfolds = 10,standardize=F,
                          keep=T)
  coef_data1<-coef(fit.11_data1,s=fit.11_data1$lambda.min,exact=T,x=covar_adjust_data1,
                   y=y)
  plot (cv.glmnet(x=covar_adjust_data1,y=y,family="gaussian"))
  coefficients<-coef(fit.11_data1,s=fit.11_data1$lambda.min)
  Active.Index<-which(coefficients!=0)
  dim(Active.Index)
  ### combine the elastic net regression results 
  response_var <- cbind(varname=names(as.data.frame(covar_adjust_data1)),
                        cbind(preecla=as.numeric(coef_data1))[-1,])
}

coef_combine1_log_BetaHCH <- run_elastic_net(chemical_diet, "log_BetaHCH")
coef_combine1_log_GammaHCH <- run_elastic_net(chemical_diet, "log_GammaHCH")
coef_combine1_log_HCB <- run_elastic_net(chemical_diet, "log_HCB")
coef_combine1_log_Oxychlordane <- run_elastic_net(chemical_diet, "log_Oxychlordane")
coef_combine1_log_TransChlordane <- run_elastic_net(chemical_diet, "log_TransChlordane")
coef_combine1_log_TransNo_chlor <- run_elastic_net(chemical_diet, "log_TransNo_chlor")
coef_combine1_log_P_P_DDE <- run_elastic_net(chemical_diet, "log_P_P_DDE")
coef_combine1_log_O_P_DDD <- run_elastic_net(chemical_diet, "log_O_P_DDD")
coef_combine1_log_P_P_DDD <- run_elastic_net(chemical_diet, "log_P_P_DDD")
coef_combine1_log_P_P_DDT <- run_elastic_net(chemical_diet, "log_P_P_DDT")
coef_combine1_log_Mirex <- run_elastic_net(chemical_diet, "log_Mirex")
coef_combine1_log_BDE28 <- run_elastic_net(chemical_diet, "log_BDE28")
coef_combine1_log_BDE47 <- run_elastic_net(chemical_diet, "log_BDE47")
coef_combine1_log_BDE100 <- run_elastic_net(chemical_diet, "log_BDE100")
coef_combine1_log_BDE99 <- run_elastic_net(chemical_diet, "log_BDE99")
coef_combine1_log_BDE85 <- run_elastic_net(chemical_diet, "log_BDE85")
coef_combine1_log_PBB153 <- run_elastic_net(chemical_diet, "log_PBB153")
coef_combine1_log_BDE154 <- run_elastic_net(chemical_diet, "log_BDE154")
coef_combine1_log_BDE153 <- run_elastic_net(chemical_diet, "log_BDE153")
coef_combine1_log_BDE183 <- run_elastic_net(chemical_diet, "log_BDE183")
coef_combine1_log_PCB5_8 <- run_elastic_net(chemical_diet, "log_PCB5_8")
coef_combine1_log_PCB18_17 <- run_elastic_net(chemical_diet, "log_PCB18_17")
coef_combine1_log_PCB31_28 <- run_elastic_net(chemical_diet, "log_PCB31_28")
coef_combine1_log_PCB33_20 <- run_elastic_net(chemical_diet, "log_PCB33_20")
coef_combine1_log_PCB22 <- run_elastic_net(chemical_diet, "log_PCB22")
coef_combine1_log_PCB52_73 <- run_elastic_net(chemical_diet, "log_PCB52_73")
coef_combine1_log_PCB49_43 <- run_elastic_net(chemical_diet, "log_PCB49_43")
coef_combine1_log_PCB47_48_75 <- run_elastic_net(chemical_diet, "log_PCB47_48_75")
coef_combine1_log_PCB44 <- run_elastic_net(chemical_diet, "log_PCB44")
coef_combine1_log_PCB41_64 <- run_elastic_net(chemical_diet, "log_PCB41_64")
coef_combine1_log_PCB74_61 <- run_elastic_net(chemical_diet, "log_PCB74_61")
coef_combine1_log_PCB70_76 <- run_elastic_net(chemical_diet, "log_PCB70_76")
coef_combine1_log_PCB66_80 <- run_elastic_net(chemical_diet, "log_PCB66_80")
coef_combine1_log_PCB93_95 <- run_elastic_net(chemical_diet, "log_PCB93_95")
coef_combine1_log_PCB90_101_89 <- run_elastic_net(chemical_diet, "log_PCB90_101_89")
coef_combine1_log_PCB99 <- run_elastic_net(chemical_diet, "log_PCB99")
coef_combine1_log_PCB110 <- run_elastic_net(chemical_diet, "log_PCB110")
coef_combine1_log_PCB118_106 <- run_elastic_net(chemical_diet, "log_PCB118_106")
coef_combine1_log_PCB114_122 <- run_elastic_net(chemical_diet, "log_PCB114_122")
coef_combine1_log_PCB105_127 <- run_elastic_net(chemical_diet, "log_PCB105_127")
coef_combine1_log_PCB146_161 <- run_elastic_net(chemical_diet, "log_PCB146_161")
coef_combine1_log_PCB153 <- run_elastic_net(chemical_diet, "log_PCB153")
coef_combine1_log_PCB137 <- run_elastic_net(chemical_diet, "log_PCB137")
coef_combine1_log_PCB138_158 <- run_elastic_net(chemical_diet, "log_PCB138_158")
coef_combine1_log_PCB128 <- run_elastic_net(chemical_diet, "log_PCB128")
coef_combine1_log_PCB167 <- run_elastic_net(chemical_diet, "log_PCB167")
coef_combine1_log_PCB156 <- run_elastic_net(chemical_diet, "log_PCB156")
coef_combine1_log_PCB157 <- run_elastic_net(chemical_diet, "log_PCB157")
coef_combine1_log_PCB182_187 <- run_elastic_net(chemical_diet, "log_PCB182_187")
coef_combine1_log_PCB183 <- run_elastic_net(chemical_diet, "log_PCB183")
coef_combine1_log_PCB177 <- run_elastic_net(chemical_diet, "log_PCB177")
coef_combine1_log_PCB172_192 <- run_elastic_net(chemical_diet, "log_PCB172_192")
coef_combine1_log_PCB180 <- run_elastic_net(chemical_diet, "log_PCB180")
coef_combine1_log_PCB170 <- run_elastic_net(chemical_diet, "log_PCB170")
coef_combine1_log_PCB202 <- run_elastic_net(chemical_diet, "log_PCB202")
coef_combine1_log_PCB199 <- run_elastic_net(chemical_diet, "log_PCB199")
coef_combine1_log_PCB196_203 <- run_elastic_net(chemical_diet, "log_PCB196_203")
coef_combine1_log_PCB195 <- run_elastic_net(chemical_diet, "log_PCB195")
coef_combine1_log_PCB194 <- run_elastic_net(chemical_diet, "log_PCB194")
coef_combine1_log_PCB208 <- run_elastic_net(chemical_diet, "log_PCB208")
coef_combine1_log_PCB206 <- run_elastic_net(chemical_diet, "log_PCB206")
coef_combine1_log_PCB209 <- run_elastic_net(chemical_diet, "log_PCB209")
coef_combine1_log_NMeFOSAA <- run_elastic_net(chemical_diet, "log_NMeFOSAA")
coef_combine1_log_PFDS <- run_elastic_net(chemical_diet, "log_PFDS")
coef_combine1_log_PFDoDA <- run_elastic_net(chemical_diet, "log_PFDoDA")
coef_combine1_log_PFHpA <- run_elastic_net(chemical_diet, "log_PFHpA")
coef_combine1_log_PFHxS <- run_elastic_net(chemical_diet, "log_PFHxS")
coef_combine1_log_PFOS <- run_elastic_net(chemical_diet, "log_PFOS")
coef_combine1_log_PFOA <- run_elastic_net(chemical_diet, "log_PFOA")
coef_combine1_log_PFNA <- run_elastic_net(chemical_diet, "log_PFNA")
coef_combine1_log_PFDA <- run_elastic_net(chemical_diet, "log_PFDA")
coef_combine1_log_PFUnDA <- run_elastic_net(chemical_diet, "log_PFUnDA")
coef_combine1_log_As <- run_elastic_net(chemical_diet, "log_As")
coef_combine1_log_Ba <- run_elastic_net(chemical_diet, "log_Ba")
coef_combine1_log_Cd <- run_elastic_net(chemical_diet, "log_Cd")
coef_combine1_log_Co <- run_elastic_net(chemical_diet, "log_Co")
coef_combine1_log_Cr <- run_elastic_net(chemical_diet, "log_Cr")
coef_combine1_log_Cs <- run_elastic_net(chemical_diet, "log_Cs")
coef_combine1_log_Cu <- run_elastic_net(chemical_diet, "log_Cu")
coef_combine1_log_Hg <- run_elastic_net(chemical_diet, "log_Hg")
coef_combine1_log_Mn <- run_elastic_net(chemical_diet, "log_Mn")
coef_combine1_log_Mo <- run_elastic_net(chemical_diet, "log_Mo")
coef_combine1_log_Pb <- run_elastic_net(chemical_diet, "log_Pb")
coef_combine1_log_Sb <- run_elastic_net(chemical_diet, "log_Sb")
coef_combine1_log_Se <- run_elastic_net(chemical_diet, "log_Se")
coef_combine1_log_Sn <- run_elastic_net(chemical_diet, "log_Sn")
coef_combine1_log_Tl <- run_elastic_net(chemical_diet, "log_Tl")
coef_combine1_log_Zn <- run_elastic_net(chemical_diet, "log_Zn")
coef_combine1_lg_totalocp <- run_elastic_net(chemical_diet, "lg_totalocp")
coef_combine1_lg_totalbdes <- run_elastic_net(chemical_diet, "lg_totalbdes")
coef_combine1_lg_totalpcbs <- run_elastic_net(chemical_diet, "lg_totalpcbs")
coef_combine1_lg_totalpfas <- run_elastic_net(chemical_diet, "lg_totalpfas")
coef_combine1_lg_totalmetals <- run_elastic_net(chemical_diet, "lg_totalmetals")
###############################################################################################################################################
coef_combine1_totalchem=cbind(as.data.frame(coef_combine1_log_BetaHCH
),as.data.frame(coef_combine1_log_GammaHCH
),as.data.frame(coef_combine1_log_HCB
),as.data.frame(coef_combine1_log_Oxychlordane
),as.data.frame(coef_combine1_log_TransChlordane
),as.data.frame(coef_combine1_log_TransNo_chlor
),as.data.frame(coef_combine1_log_P_P_DDE
),as.data.frame(coef_combine1_log_O_P_DDD
),as.data.frame(coef_combine1_log_P_P_DDD
),as.data.frame(coef_combine1_log_P_P_DDT
),as.data.frame(coef_combine1_log_Mirex
),as.data.frame(coef_combine1_log_BDE28
),as.data.frame(coef_combine1_log_BDE47
),as.data.frame(coef_combine1_log_BDE100
),as.data.frame(coef_combine1_log_BDE99
),as.data.frame(coef_combine1_log_BDE85
),as.data.frame(coef_combine1_log_PBB153
),as.data.frame(coef_combine1_log_BDE154
),as.data.frame(coef_combine1_log_BDE153
),as.data.frame(coef_combine1_log_BDE183
),as.data.frame(coef_combine1_log_PCB5_8
),as.data.frame(coef_combine1_log_PCB18_17
),as.data.frame(coef_combine1_log_PCB31_28
),as.data.frame(coef_combine1_log_PCB33_20
),as.data.frame(coef_combine1_log_PCB22
),as.data.frame(coef_combine1_log_PCB52_73
),as.data.frame(coef_combine1_log_PCB49_43
),as.data.frame(coef_combine1_log_PCB47_48_75
),as.data.frame(coef_combine1_log_PCB44
),as.data.frame(coef_combine1_log_PCB41_64
),as.data.frame(coef_combine1_log_PCB74_61
),as.data.frame(coef_combine1_log_PCB70_76
),as.data.frame(coef_combine1_log_PCB66_80
),as.data.frame(coef_combine1_log_PCB93_95
),as.data.frame(coef_combine1_log_PCB90_101_89
),as.data.frame(coef_combine1_log_PCB99
),as.data.frame(coef_combine1_log_PCB110
),as.data.frame(coef_combine1_log_PCB118_106
),as.data.frame(coef_combine1_log_PCB114_122
),as.data.frame(coef_combine1_log_PCB105_127
),as.data.frame(coef_combine1_log_PCB146_161
),as.data.frame(coef_combine1_log_PCB153
),as.data.frame(coef_combine1_log_PCB137
),as.data.frame(coef_combine1_log_PCB138_158
),as.data.frame(coef_combine1_log_PCB128
),as.data.frame(coef_combine1_log_PCB167
),as.data.frame(coef_combine1_log_PCB156
),as.data.frame(coef_combine1_log_PCB157
),as.data.frame(coef_combine1_log_PCB182_187
),as.data.frame(coef_combine1_log_PCB183
),as.data.frame(coef_combine1_log_PCB177
),as.data.frame(coef_combine1_log_PCB172_192
),as.data.frame(coef_combine1_log_PCB180
),as.data.frame(coef_combine1_log_PCB170
),as.data.frame(coef_combine1_log_PCB202
),as.data.frame(coef_combine1_log_PCB199
),as.data.frame(coef_combine1_log_PCB196_203
),as.data.frame(coef_combine1_log_PCB195
),as.data.frame(coef_combine1_log_PCB194
),as.data.frame(coef_combine1_log_PCB208
),as.data.frame(coef_combine1_log_PCB206
),as.data.frame(coef_combine1_log_PCB209
),as.data.frame(coef_combine1_log_NMeFOSAA
),as.data.frame(coef_combine1_log_PFDS
),as.data.frame(coef_combine1_log_PFDoDA
),as.data.frame(coef_combine1_log_PFHpA
),as.data.frame(coef_combine1_log_PFHxS
),as.data.frame(coef_combine1_log_PFOS
),as.data.frame(coef_combine1_log_PFOA
),as.data.frame(coef_combine1_log_PFNA
),as.data.frame(coef_combine1_log_PFDA
),as.data.frame(coef_combine1_log_PFUnDA
),as.data.frame(coef_combine1_log_As
),as.data.frame(coef_combine1_log_Ba
),as.data.frame(coef_combine1_log_Cd
),as.data.frame(coef_combine1_log_Co
),as.data.frame(coef_combine1_log_Cr
),as.data.frame(coef_combine1_log_Cs
),as.data.frame(coef_combine1_log_Cu
),as.data.frame(coef_combine1_log_Hg
),as.data.frame(coef_combine1_log_Mn
),as.data.frame(coef_combine1_log_Mo
),as.data.frame(coef_combine1_log_Pb
),as.data.frame(coef_combine1_log_Sb
),as.data.frame(coef_combine1_log_Se
),as.data.frame(coef_combine1_log_Sn
),as.data.frame(coef_combine1_log_Tl
),as.data.frame(coef_combine1_log_Zn
),as.data.frame(coef_combine1_lg_totalocp
),as.data.frame(coef_combine1_lg_totalbdes
),as.data.frame(coef_combine1_lg_totalpcbs
),as.data.frame(coef_combine1_lg_totalpfas
),as.data.frame(coef_combine1_lg_totalmetals))
write.xlsx(coef_combine1_totalchem,"C:/nus_project/1st_nus_chemical_nutrition/formal_analysis/revision02202024/coef_combine1_totalchem_withoutnutrients.xlsx")

#################################################################################################################
setwd("C:/nus_project/1st_nus_chemical_nutrition/formal_analysis/revision02202024")
library(pheatmap)
library(vegan)
library(openxlsx)
library(gplots)
data<- read.xlsx("coef_combine1_totalchem_withoutnutrients.xlsx", sheet ="Sheet1")

rownames(data) <- data[,1]
data<-data[,-1]
data<- as.matrix(data)

jpeg("Figure S7b.jpeg", height=3000,width=3000,bg="white",res = 600)
pheatmap(data, cluster_row = TRUE,cluster_cols = FALSE,border_color = "black", 
         display_numbers = TRUE,        
         number_color = "black",        
         fontsize=10,                   
         number_format = "%.2f")           
dev.off()

Figure S7b<-pheatmap(data, cluster_row = TRUE,cluster_cols = FALSE,border_color = "black",
                                                         display_numbers = TRUE,         
                                                         number_color = "black",       
                                                         fontsize=10,                  
                                                         number_format = "%.2f")       
pdf("Figure S7b.pdf", width = 6, height = 6)
print(Figure S6b)
dev.off()

