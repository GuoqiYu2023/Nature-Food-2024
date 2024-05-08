
################################################################################################### to generate figure for adjusted p-value
setwd("C:/nus_project/1st_nus_chemical_nutrition/formal_analysis/revision02202024")
library(pheatmap)
library(vegan)
library(openxlsx)
library(gplots)
foodgroupforqvalue_new3=foodgroupforqvalue_new2[,c(2,3,14)]
data_shorfrom<- reshape(data=foodgroupforqvalue_new3,idvar="Variable",
                        v.names = "BH_allchem",
                        timevar = "Dependent",
                        direction="wide")
write.xlsx(data_shorfrom,file="C:/nus_project/1st_nus_chemical_nutrition/formal_analysis/revision02202024/data_shorfrom0227.xlsx")

foodgroupforqvalue_new3<- read.xlsx("data_shorfrom0227.xlsx", sheet ="figure_adjusted_p")
rownames(foodgroupforqvalue_new3) <-foodgroupforqvalue_new3[,1]
foodgroupforqvalue_new3<-foodgroupforqvalue_new3[,-1]
foodgroupforqvalue_new3<- as.matrix(foodgroupforqvalue_new3)


display_symbols <- matrix(
  ifelse(foodgroupforqvalue_new3 < 0.001, "***",
         ifelse(foodgroupforqvalue_new3 < 0.01, "**",
                ifelse(foodgroupforqvalue_new3 < 0.05, "*", ""))),
  nrow = nrow(foodgroupforqvalue_new3),
  ncol = ncol(foodgroupforqvalue_new3)
)

foodgroupforqvalue_new3_heatmap_fdr2<-pheatmap(
  foodgroupforqvalue_new3,
  cluster_row = FALSE,
  color = colorRampPalette(c("firebrick3", "lightblue", "grey", "white"))(100),
  cluster_cols = FALSE,  angle = 315, 
  display_numbers = display_symbols  
)
pdf("foodgroupforqvalue_new3_heatmap_fdr2.pdf", width = 8, height = 12)
print(foodgroupforqvalue_new3_heatmap_fdr2)
dev.off()
################################################################################################### to generate figure for raw p-value
setwd("C:/nus_project/1st_nus_chemical_nutrition/formal_analysis/revision02202024")
library(pheatmap)
library(vegan)
library(openxlsx)
library(gplots)

foodgroupforqvalue_raw_p<- read.xlsx("data_shorfrom0304.xlsx", sheet ="figure_raw_p")
rownames(foodgroupforqvalue_raw_p) <-foodgroupforqvalue_raw_p[,1]
foodgroupforqvalue_raw_p<-foodgroupforqvalue_raw_p[,-1]
foodgroupforqvalue_raw_p<- as.matrix(foodgroupforqvalue_raw_p)


display_symbols <- matrix(
  ifelse(foodgroupforqvalue_raw_p< 0.001, "***",
         ifelse(foodgroupforqvalue_raw_p< 0.01, "**",
                ifelse(foodgroupforqvalue_raw_p< 0.05, "*", ""))),
  nrow = nrow(foodgroupforqvalue_raw_p),
  ncol = ncol(foodgroupforqvalue_raw_p)
)

foodgroupforqvalue_raw_p<-pheatmap(
  foodgroupforqvalue_raw_p,
  cluster_row = FALSE,
  color = colorRampPalette(c("firebrick3", "lightblue", "grey", "white"))(100),
  cluster_cols = FALSE,  angle = 315, 
  display_numbers = display_symbols  
)
pdf("foodgroupforqvalue_raw_p.pdf", width = 8, height = 12)
print(foodgroupforqvalue_raw_p)
dev.off()
###########################################################################################################################################################
setwd("C:/nus_project/1st_nus_chemical_nutrition/formal_analysis/revision02202024")
library(pheatmap)
library(vegan)
library(openxlsx)
library(gplots)

************************************** to add cluster analysis (tree) to heatmap based on the estimate ***********
  foodgroupforqvalue_new3<- read.xlsx("data_shorfrom0228.xlsx", sheet ="figure_estimate")
rownames(foodgroupforqvalue_new3) <-foodgroupforqvalue_new3[,1]
foodgroupforqvalue_new3<-foodgroupforqvalue_new3[,-1]
foodgroupforqvalue_new3<- as.matrix(foodgroupforqvalue_new3)

Figure_S3<-pheatmap(foodgroupforqvalue_new3, cluster_row = FALSE,cluster_cols = TRUE,border_color = "grey", 
                    display_numbers = TRUE,         
                    number_color = "grey30",         
                    fontsize=8,  angle = 315,                      
                    number_format = "%.2f")              
pdf("Figure_S3.pdf", width = 10, height = 12)
dev.off()
########################################################################### Adobe Illustrator was used to modify the figures
