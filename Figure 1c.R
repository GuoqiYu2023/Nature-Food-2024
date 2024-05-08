setwd("C:/nus_project/1st_nus_chemical_nutrition/formal_analysis/revision02202024")
library(pheatmap)
library(vegan)
library(openxlsx)
library(gplots)
data<- read.xlsx("combined_loading_factors0226.xlsx", sheet ="Sheet3")

rownames(data) <- data[,1]
data<-data[,-1]
data<- as.matrix(data)

figure_2c<-pheatmap(data, cluster_row = TRUE,cluster_cols = FALSE,border_color = "black",
                          display_numbers = TRUE,        
                          number_color = "black",     
                          fontsize=9,                 
                          number_format = "%.2f")   
pdf("figure_2c.pdf", width = 6, height = 4)
print(loading_fartors)
dev.off()