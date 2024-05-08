setwd("C:/nus_project/1st_nus_chemical_nutrition/formal_analysis/revision02202024")
library(pheatmap)
library(vegan)
library(openxlsx)
library(gplots)
foodgroup_chemical<- read.xlsx("Summary_results0227.xlsx", sheet = "race_foodgroups")
var_name=read.xlsx("Summary_results0227.xlsx", sheet = "var_name")
var_name_chem=var_name[,c(2:5)]
var_name_food=var_name[1:30,c(6:8)]

foodgroup_chemical <- foodgroup_chemical %>%
  filter(Variable %in% c("MED_dairy_s","MED_fish_s","DASH_fruit_s","MED_fruit_nut_g","MED_grain_g","MED_legume_s","DASH_lfdairy_s","MED_meat_s","MED_mufa_saf_r","AHEI_n3_mg","Variable","MED_nut_s","AHEI_nutlegume_s","AHEI_PUFA_p","AHEI_rpmeat_s","DASH_sodium_mg","DASH_ssbnj_s","AHEI_ssb_s","AHEI_transfat_p","AHEI_vegetable_s","AHEI_wfruit_s","AHEI_wgrain_g"))

foodgroup_chemical_data <- merge(foodgroup_chemical, var_name_chem, by = 'Dependent', all.x = TRUE)
foodgroup_chemical_data <- merge(foodgroup_chemical_data, var_name_food, by = 'Variable', all.x = TRUE)

race0=foodgroup_chemical_data[,c(4:6,28:30,32)]
race1=foodgroup_chemical_data[,c(10:12,28:30,32)]
race2=foodgroup_chemical_data[,c(16:18,28:30,32)]
race3=foodgroup_chemical_data[,c(22:24,28:30,32)]
******************************************************************************************* to generate heatmap for raw p-value
race0_new=race0[,c(1,6,7)]
data_shorfrom_race0<- reshape(data=race0_new,idvar="new.name",
                              v.names = "Probt_race0",
                              timevar = "chemicals",
                              direction="wide")

race1_new=race1[,c(1,6,7)]
data_shorfrom_race1<- reshape(data=race1_new,idvar="new.name",
                              v.names = "Probt_race1",
                              timevar = "chemicals",
                              direction="wide")

race2_new=race2[,c(1,6,7)]
data_shorfrom_race2<- reshape(data=race2_new,idvar="new.name",
                              v.names = "Probt_race2",
                              timevar = "chemicals",
                              direction="wide")

race3_new=race3[,c(1,6,7)]
data_shorfrom_race3<- reshape(data=race3_new,idvar="new.name",
                              v.names = "Probt_race3",
                              timevar = "chemicals",
                              direction="wide")

sheets = list("data_shorfrom_race0" =data_shorfrom_race0,"data_shorfrom_race1"=data_shorfrom_race1,"data_shorfrom_race2"=data_shorfrom_race2,"data_shorfrom_race3" =data_shorfrom_race3)

write.xlsx(sheets,file="C:/nus_project/1st_nus_chemical_nutrition/formal_analysis/revision02202024/foodgroup_chem_race.xlsx")

foodgroup_race0_raw_p<- read.xlsx("foodgroup_chem_race.xlsx", sheet ="Sheet1")
rownames(foodgroup_race0_raw_p) <-foodgroup_race0_raw_p[,1]
foodgroup_race0_raw_p<-foodgroup_race0_raw_p[,-1]
foodgroup_race0_raw_p<- as.matrix(foodgroup_race0_raw_p)


display_symbols <- matrix(
  ifelse(foodgroup_race0_raw_p< 0.001, "***",
         ifelse(foodgroup_race0_raw_p< 0.01, "**",
                ifelse(foodgroup_race0_raw_p< 0.05, "*", ""))),
  nrow = nrow(foodgroup_race0_raw_p),
  ncol = ncol(foodgroup_race0_raw_p)
)

foodgroup_race0_raw_p<-pheatmap(
  foodgroup_race0_raw_p,
  cluster_row = FALSE,
  color = colorRampPalette(c("firebrick3", "lightblue", "grey", "white"))(100),
  cluster_cols =FALSE,  angle = 315, 
  display_numbers = display_symbols 
)
pdf("foodgroup_race0_raw_p.pdf", width = 8, height = 12)
print(foodgroup_race0_raw_p)
dev.off()


foodgroup_race1_raw_p<- read.xlsx("foodgroup_chem_race.xlsx", sheet ="Sheet2")
rownames(foodgroup_race1_raw_p) <-foodgroup_race1_raw_p[,1]
foodgroup_race1_raw_p<-foodgroup_race1_raw_p[,-1]
foodgroup_race1_raw_p<- as.matrix(foodgroup_race1_raw_p)


display_symbols <- matrix(
  ifelse(foodgroup_race1_raw_p< 0.001, "***",
         ifelse(foodgroup_race1_raw_p< 0.01, "**",
                ifelse(foodgroup_race1_raw_p< 0.05, "*", ""))),
  nrow = nrow(foodgroup_race1_raw_p),
  ncol = ncol(foodgroup_race1_raw_p)
)

foodgroup_race1_raw_p<-pheatmap(
  foodgroup_race1_raw_p,
  cluster_row = FALSE,
  color = colorRampPalette(c("firebrick3", "lightblue", "grey", "white"))(100),
  cluster_cols =FALSE,  angle = 315, 
  display_numbers = display_symbols  
)
pdf("foodgroup_race1_raw_p.pdf", width = 8, height = 12)
print(foodgroup_race1_raw_p)
dev.off()


foodgroup_race2_raw_p<- read.xlsx("foodgroup_chem_race.xlsx", sheet ="Sheet3")
rownames(foodgroup_race2_raw_p) <-foodgroup_race2_raw_p[,1]
foodgroup_race2_raw_p<-foodgroup_race2_raw_p[,-1]
foodgroup_race2_raw_p<- as.matrix(foodgroup_race2_raw_p)


display_symbols <- matrix(
  ifelse(foodgroup_race2_raw_p< 0.001, "***",
         ifelse(foodgroup_race2_raw_p< 0.01, "**",
                ifelse(foodgroup_race2_raw_p< 0.05, "*", ""))),
  nrow = nrow(foodgroup_race2_raw_p),
  ncol = ncol(foodgroup_race2_raw_p)
)

foodgroup_race2_raw_p<-pheatmap(
  foodgroup_race2_raw_p,
  cluster_row = FALSE,
  color = colorRampPalette(c("firebrick3", "lightblue", "grey", "white"))(100),
  cluster_cols =FALSE,  angle = 315, 
  display_numbers = display_symbols 
)
pdf("foodgroup_race2_raw_p.pdf", width = 8, height = 12)
print(foodgroup_race2_raw_p)
dev.off()


foodgroup_race3_raw_p<- read.xlsx("foodgroup_chem_race.xlsx", sheet ="Sheet4")
rownames(foodgroup_race3_raw_p) <-foodgroup_race3_raw_p[,1]
foodgroup_race3_raw_p<-foodgroup_race3_raw_p[,-1]
foodgroup_race3_raw_p<- as.matrix(foodgroup_race3_raw_p)


display_symbols <- matrix(
  ifelse(foodgroup_race3_raw_p< 0.001, "***",
         ifelse(foodgroup_race3_raw_p< 0.01, "**",
                ifelse(foodgroup_race3_raw_p< 0.05, "*", ""))),
  nrow = nrow(foodgroup_race3_raw_p),
  ncol = ncol(foodgroup_race3_raw_p)
)

foodgroup_race3_raw_p<-pheatmap(
  foodgroup_race3_raw_p,
  cluster_row = FALSE,
  color = colorRampPalette(c("firebrick3", "lightblue", "grey", "white"))(100),
  cluster_cols =FALSE,  angle = 315, 
  display_numbers = display_symbols  
)
pdf("foodgroup_race3_raw_p.pdf", width = 8, height = 12)
print(foodgroup_race3_raw_p)
dev.off()
************************************************************************************************* to generate heatmap for adjusted p-value
race0_new=race0[,c(2,6,7)]
data_shorfrom_race0<- reshape(data=race0_new,idvar="new.name",
                              v.names = "BH_race0",
                              timevar = "chemicals",
                              direction="wide")

race1_new=race1[,c(2,6,7)]
data_shorfrom_race1<- reshape(data=race1_new,idvar="new.name",
                              v.names = "BH_race1",
                              timevar = "chemicals",
                              direction="wide")

race2_new=race2[,c(2,6,7)]
data_shorfrom_race2<- reshape(data=race2_new,idvar="new.name",
                              v.names = "BH_race2",
                              timevar = "chemicals",
                              direction="wide")

race3_new=race3[,c(2,6,7)]
data_shorfrom_race3<- reshape(data=race3_new,idvar="new.name",
                              v.names = "BH_race3",
                              timevar = "chemicals",
                              direction="wide")

sheets = list("data_shorfrom_race0" =data_shorfrom_race0,"data_shorfrom_race1"=data_shorfrom_race1,"data_shorfrom_race2"=data_shorfrom_race2,"data_shorfrom_race3" =data_shorfrom_race3)

write.xlsx(sheets,file="C:/nus_project/1st_nus_chemical_nutrition/formal_analysis/revision02202024/foodgroup_chem_race_adjustedPvalue.xlsx")

foodgroup_race0_adjusted_p<- read.xlsx("foodgroup_chem_race_adjustedPvalue.xlsx", sheet ="Sheet1")
rownames(foodgroup_race0_adjusted_p) <-foodgroup_race0_adjusted_p[,1]
foodgroup_race0_adjusted_p<-foodgroup_race0_adjusted_p[,-1]
foodgroup_race0_adjusted_p<- as.matrix(foodgroup_race0_adjusted_p)


display_symbols <- matrix(
  ifelse(foodgroup_race0_adjusted_p< 0.001, "***",
         ifelse(foodgroup_race0_adjusted_p< 0.01, "**",
                ifelse(foodgroup_race0_adjusted_p< 0.05, "*", ""))),
  nrow = nrow(foodgroup_race0_adjusted_p),
  ncol = ncol(foodgroup_race0_adjusted_p)
)

foodgroup_race0_adjusted_p<-pheatmap(
  foodgroup_race0_adjusted_p,
  cluster_row = FALSE,
  color = colorRampPalette(c("firebrick3", "lightblue", "grey", "white"))(100),
  cluster_cols =FALSE,  angle = 315, 
  display_numbers = display_symbols  
)
pdf("foodgroup_race0_adjusted_p.pdf", width = 8, height = 12)
print(foodgroup_race0_adjusted_p)
dev.off()


foodgroup_race1_adjusted_p<- read.xlsx("foodgroup_chem_race_adjustedPvalue.xlsx", sheet ="Sheet2")
rownames(foodgroup_race1_adjusted_p) <-foodgroup_race1_adjusted_p[,1]
foodgroup_race1_adjusted_p<-foodgroup_race1_adjusted_p[,-1]
foodgroup_race1_adjusted_p<- as.matrix(foodgroup_race1_adjusted_p)


display_symbols <- matrix(
  ifelse(foodgroup_race1_adjusted_p< 0.001, "***",
         ifelse(foodgroup_race1_adjusted_p< 0.01, "**",
                ifelse(foodgroup_race1_adjusted_p< 0.05, "*", ""))),
  nrow = nrow(foodgroup_race1_adjusted_p),
  ncol = ncol(foodgroup_race1_adjusted_p)
)

foodgroup_race1_adjusted_p<-pheatmap(
  foodgroup_race1_adjusted_p,
  cluster_row = FALSE,
  color = colorRampPalette(c("firebrick3", "lightblue", "grey", "white"))(100),
  cluster_cols =FALSE,  angle = 315, 
  display_numbers = display_symbols  
)
pdf("foodgroup_race1_adjusted_p.pdf", width = 8, height = 12)
print(foodgroup_race1_adjusted_p)
dev.off()


foodgroup_race2_adjusted_p<- read.xlsx("foodgroup_chem_race_adjustedPvalue.xlsx", sheet ="Sheet3")
rownames(foodgroup_race2_adjusted_p) <-foodgroup_race2_adjusted_p[,1]
foodgroup_race2_adjusted_p<-foodgroup_race2_adjusted_p[,-1]
foodgroup_race2_adjusted_p<- as.matrix(foodgroup_race2_adjusted_p)


display_symbols <- matrix(
  ifelse(foodgroup_race2_adjusted_p< 0.001, "***",
         ifelse(foodgroup_race2_adjusted_p< 0.01, "**",
                ifelse(foodgroup_race2_adjusted_p< 0.05, "*", ""))),
  nrow = nrow(foodgroup_race2_adjusted_p),
  ncol = ncol(foodgroup_race2_adjusted_p)
)

foodgroup_race2_adjusted_p<-pheatmap(
  foodgroup_race2_adjusted_p,
  cluster_row = FALSE,
  color = colorRampPalette(c("firebrick3", "lightblue", "grey", "white"))(100),
  cluster_cols =FALSE,  angle = 315, 
  display_numbers = display_symbols 
)
pdf("foodgroup_race2_adjusted_p.pdf", width = 8, height = 12)
print(foodgroup_race2_adjusted_p)
dev.off()


foodgroup_race3_adjusted_p<- read.xlsx("foodgroup_chem_race_adjustedPvalue.xlsx", sheet ="Sheet4")
rownames(foodgroup_race3_adjusted_p) <-foodgroup_race3_adjusted_p[,1]
foodgroup_race3_adjusted_p<-foodgroup_race3_adjusted_p[,-1]
foodgroup_race3_adjusted_p<- as.matrix(foodgroup_race3_adjusted_p)


display_symbols <- matrix(
  ifelse(foodgroup_race3_adjusted_p< 0.001, "***",
         ifelse(foodgroup_race3_adjusted_p< 0.01, "**",
                ifelse(foodgroup_race3_adjusted_p< 0.05, "*", ""))),
  nrow = nrow(foodgroup_race3_adjusted_p),
  ncol = ncol(foodgroup_race3_adjusted_p)
)

foodgroup_race3_adjusted_p<-pheatmap(
  foodgroup_race3_adjusted_p,
  cluster_row = FALSE,
  color = colorRampPalette(c("firebrick3", "lightblue", "grey", "white"))(100),
  cluster_cols =FALSE,  angle = 315, 
  display_numbers = display_symbols 
)
pdf("foodgroup_race3_adjusted_p.pdf", width = 8, height = 12)
print(foodgroup_race3_adjusted_p)
dev.off()
********************************************************************** based on the significance of each food group with each chemical across race/ethnicity, we picked EPA+DHA, SSB (including juice), Fish, and MUFA: SFA ratio to re-do heatmap.
race0_new=race0[,c(3,6,7)]
data_shorfrom_race0<- reshape(data=race0_new,idvar="new.name",
                              v.names = "Beta_race0",
                              timevar = "chemicals",
                              direction="wide")

race1_new=race1[,c(3,6,7)]
data_shorfrom_race1<- reshape(data=race1_new,idvar="new.name",
                              v.names = "Beta_race1",
                              timevar = "chemicals",
                              direction="wide")

race2_new=race2[,c(3,6,7)]
data_shorfrom_race2<- reshape(data=race2_new,idvar="new.name",
                              v.names = "Beta_race2",
                              timevar = "chemicals",
                              direction="wide")

race3_new=race3[,c(3,6,7)]
data_shorfrom_race3<- reshape(data=race3_new,idvar="new.name",
                              v.names = "Beta_race3",
                              timevar = "chemicals",
                              direction="wide")

sheets = list("data_shorfrom_race0" =data_shorfrom_race0,"data_shorfrom_race1"=data_shorfrom_race1,"data_shorfrom_race2"=data_shorfrom_race2,"data_shorfrom_race3" =data_shorfrom_race3)

write.xlsx(sheets,file="C:/nus_project/1st_nus_chemical_nutrition/formal_analysis/revision02202024/foodgroup_chem_race_beta.xlsx")
library(dplyr)
foodgroup_race_beta<- read.xlsx("foodgroup_chem_race_beta.xlsx", sheet ="Sheet1")
vars=c("chemicals","EPA+DHA_race0","EPA+DHA_race1","EPA+DHA_race2","EPA+DHA_race3","Fish_race0","Fish_race1","Fish_race2","Fish_race3","SSB.(including.juice)_race0","SSB.(including.juice)_race1","SSB.(including.juice)_race2","SSB.(including.juice)_race3","MUFA:.SFA.ratio_race0","MUFA:.SFA.ratio_race1","MUFA:.SFA.ratio_race2","MUFA:.SFA.ratio_race3")
foodgroup_race_beta <- foodgroup_race_beta %>% select(vars)

rownames(foodgroup_race_beta) <-foodgroup_race_beta[,1]
foodgroup_race_beta<-foodgroup_race_beta[,-1]
foodgroup_race_beta<- as.matrix(foodgroup_race_beta)


foodgroup_s5_simplified<-pheatmap(
  foodgroup_race_beta,border_color = "grey",
  cluster_row = FALSE,
  cluster_cols =FALSE,  angle = 315, 
  number_color = "black",       
  display_numbers = TRUE, 
  fontsize=10,                  
  number_format = "%.2f")         

pdf("foodgroup_s5_simplified.pdf", width = 10, height = 14)
print(foodgroup_s5_simplified)
dev.off()