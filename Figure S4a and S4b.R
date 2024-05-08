######################################################################################################################## generate heatmap
################# Figure 2a
setwd("C:/nus_project/1st_nus_chemical_nutrition/formal_analysis/revision02202024")
library(pheatmap)
library(vegan)
library(openxlsx)
library(gplots)

race_dp_chem<- read.xlsx("Summary_results0227.xlsx", sheet ="stratified_pattern")
race_dp_chem=race_dp_chem[c(3,6,9,12,15,18,21,24,27,30,33,36,39)]
rownames(race_dp_chem) <-race_dp_chem[,1]
race_dp_chem<-race_dp_chem[,-1]
race_dp_chem<- as.matrix(race_dp_chem)

figureS4a<-pheatmap(race_dp_chem, cluster_row = FALSE,cluster_cols = FALSE,border_color = "grey", 
                                     display_numbers = TRUE,        
                                     number_color = "grey40",        
                                     fontsize=10,  angle = 315,               
                                     number_format = "%.2f")            
pdf("figureS4a.pdf", width = 8, height = 14)
print(figureS4a)
dev.off()


race_dp_chem<- read.xlsx("Summary_results0227.xlsx", sheet ="stratified_pattern")
race_dp_chem_p=race_dp_chem[c(3,5,8,11,14,17,20,23,26,29,32,35,38)]
rownames(race_dp_chem_p) <-race_dp_chem_p[,1]
race_dp_chem_p<-race_dp_chem_p[,-1]
race_dp_chem_p<- as.matrix(race_dp_chem_p)

display_symbols <- matrix(
  ifelse(race_dp_chem_p < 0.001, "***",
         ifelse(race_dp_chem_p < 0.01, "**",
                ifelse(race_dp_chem_p < 0.05, "*", ""))),
  nrow = nrow(race_dp_chem_p),
  ncol = ncol(race_dp_chem_p)
)

race_dp_chem_p<-pheatmap(race_dp_chem_p, cluster_row = FALSE,cluster_cols = FALSE,border_color = "black", 
                         display_numbers = display_symbols,         
                         color = colorRampPalette(c("firebrick3", "lightblue", "grey", "white"))(100),
                         number_color = "black",        
                         fontsize=10,  angle = 315,                   
                         number_format = "%.2f")             
pdf("race_dp_chem_p.pdf", width = 8, height = 12)
print(race_dp_chem_p)
dev.off()

race_dp_chem<- read.xlsx("Summary_results0227.xlsx", sheet ="stratified_pattern")
race_dp_chem_rawp=race_dp_chem[c(3,4,7,10,13,16,19,22,25,28,31,34,37)]
rownames(race_dp_chem_rawp) <-race_dp_chem_rawp[,1]
race_dp_chem_rawp<-race_dp_chem_rawp[,-1]
race_dp_chem_rawp<- as.matrix(race_dp_chem_rawp)

display_symbols <- matrix(
  ifelse(race_dp_chem_rawp < 0.001, "***",
         ifelse(race_dp_chem_rawp < 0.01, "**",
                ifelse(race_dp_chem_rawp < 0.05, "*", ""))),
  nrow = nrow(race_dp_chem_rawp),
  ncol = ncol(race_dp_chem_rawp)
)

race_dp_chem_rawp<-pheatmap(race_dp_chem_rawp, cluster_row = FALSE,cluster_cols = FALSE,border_color = "black", 
                            display_numbers = display_symbols,         
                            color = colorRampPalette(c("firebrick3", "lightblue", "grey", "white"))(100),
                            number_color = "black",        
                            fontsize=10,  angle = 315,                  
                            number_format = "%.2f")             
pdf("race_dp_chem_rawp.pdf", width = 8, height = 12)
print(race_dp_chem_rawp)
dev.off()

################# Figure 2b
setwd("C:/nus_project/1st_nus_chemical_nutrition/formal_analysis/revision02202024")
library(pheatmap)
library(vegan)
library(openxlsx)
library(gplots)
dp_chemical_interaction<- read.xlsx("combined_patternscore_chemicals_interactionnew.xlsx", sheet = "combined")
******************************************************************************************* to generate heatmap for raw p-value and adjusted p-value
dp_chemical_interaction_raw=dp_chemical_interaction[,c(3:6)]
dp_chemical_interaction_adjusted=dp_chemical_interaction[,c(3,7:9)]


rownames(dp_chemical_interaction_adjusted) <-dp_chemical_interaction_adjusted[,1]
dp_chemical_interaction_adjusted<-dp_chemical_interaction_adjusted[,-1]
dp_chemical_interaction_adjusted<- as.matrix(dp_chemical_interaction_adjusted)


display_symbols <- matrix(
  ifelse(dp_chemical_interaction_adjusted< 0.001, "***",
         ifelse(dp_chemical_interaction_adjusted< 0.01, "**",
                ifelse(dp_chemical_interaction_adjusted< 0.05, "*", ""))),
  nrow = nrow(dp_chemical_interaction_adjusted),
  ncol = ncol(dp_chemical_interaction_adjusted)
)

dp_chemical_interaction_adjusted1<-pheatmap(
  dp_chemical_interaction_adjusted,
  cluster_row = FALSE,border_color = "grey", 
  color = colorRampPalette(c("firebrick3", "skyblue", "lightblue", "grey", "white"))(200),
  cluster_cols =FALSE,   fontsize=10, angle = 315, number_color = "grey40",
  display_numbers = display_symbols 
)
pdf("dp_chemical_interaction_adjusted1.pdf", width = 3, height = 14)
print(dp_chemical_interaction_adjusted1)
dev.off()

figureS4b<-pheatmap(
  dp_chemical_interaction_raw,
  cluster_row = FALSE,border_color = "grey", 
  color = colorRampPalette(c("firebrick3", "skyblue", "lightblue", "grey", "white"))(200),
  cluster_cols =FALSE,   fontsize=10, angle = 315, number_color = "grey40",
  display_numbers = TRUE  
)
pdf("figureS4b.pdf", width = 3, height = 14)
print(figureS4b)
dev.off()
######################################### we further mordify the figure by Adobe Illustrator ##################