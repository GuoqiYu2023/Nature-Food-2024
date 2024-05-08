setwd("C:/nus_project/1st_nus_chemical_nutrition/formal_analysis/revision02202024")
library(pheatmap)
library(vegan)
library(openxlsx)
library(gplots)
dp_chem<- read.xlsx("Summary_results0227.xlsx", sheet ="adjusted_TEI")
dp_chem=dp_chem[c(2,3,16,19,22)]
dp_chem<-dp_chem[,-1]
rownames(dp_chem) <-dp_chem[,1]
dp_chem<-dp_chem[,-1]
dp_chem<- as.matrix(dp_chem)

figure1a_dp_chem<-pheatmap(dp_chem, cluster_row = FALSE,cluster_cols = FALSE,border_color = "grey", 
                          display_numbers = TRUE,        
                          number_color = "grey40",        
                          fontsize=10,  angle = 315,               
                          number_format = "%.2f")            
pdf("figure1a_dp_chem.pdf", width = 4, height = 14)
print(figure1a_dp_chem)
dev.off()


dp_chem<- read.xlsx("Summary_results0227.xlsx", sheet ="adjusted_TEI")
dp_chem_p=dp_chem[c(2,3,28:30)]
dp_chem_p<-dp_chem_p[,-1]
rownames(dp_chem_p) <-dp_chem_p[,1]
dp_chem_p<-dp_chem_p[,-1]
dp_chem_p<- as.matrix(dp_chem_p)

display_symbols <- matrix(
  ifelse(dp_chem_p < 0.001, "***",
         ifelse(dp_chem_p < 0.01, "**",
                ifelse(dp_chem_p < 0.05, "*", ""))),
  nrow = nrow(dp_chem_p),
  ncol = ncol(dp_chem_p)
)

figure1a_dp_chem_p<-pheatmap(dp_chem_p, cluster_row = FALSE,cluster_cols = FALSE,border_color = "black", 
                            display_numbers = display_symbols,         
                            color = colorRampPalette(c("firebrick3", "lightblue", "grey", "white"))(100),
                            number_color = "black",        
                            fontsize=10,  angle = 315,                   
                            number_format = "%.2f")             
pdf("figure1a_dp_chem_p.pdf", width = 4, height = 14)
print(figure1a_dp_chem_p)
dev.off()

dp_chem<- read.xlsx("Summary_results0227.xlsx", sheet ="adjusted_TEI")
dp_chem_rawp=dp_chem[c(2,3,7,11,15)]
dp_chem_rawp<-dp_chem_rawp[,-1]
rownames(dp_chem_rawp) <-dp_chem_rawp[,1]
dp_chem_rawp<-dp_chem_rawp[,-1]
dp_chem_rawp<- as.matrix(dp_chem_rawp)

display_symbols <- matrix(
  ifelse(dp_chem_rawp < 0.001, "***",
         ifelse(dp_chem_rawp < 0.01, "**",
                ifelse(dp_chem_rawp < 0.05, "*", ""))),
  nrow = nrow(dp_chem_rawp),
  ncol = ncol(dp_chem_rawp)
)


figure1a_dp_chem_rawp<-pheatmap(dp_chem_rawp, cluster_row = FALSE,cluster_cols = FALSE,border_color = "black", 
                               display_numbers = display_symbols,         
                               color = colorRampPalette(c("firebrick3", "lightblue", "grey", "white"))(100),
                               number_color = "black",        
                               fontsize=10,  angle = 315,                  
                               number_format = "%.2f")             
pdf("figure1a_dp_chem_rawp.pdf", width = 4, height = 14)
print(figure1a_dp_chem_rawp)
dev.off()