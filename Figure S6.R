setwd("C:/nus_project/1st_nus_chemical_nutrition/formal_analysis/revision02202024")
library(pheatmap)
library(vegan)
library(openxlsx)
library(gplots)
data<- read.xlsx("combined_loading_factors0226.xlsx", sheet ="no_nutrient1")

rownames(data) <- data[,1]
data<-data[,-1]
data<- as.matrix(data)

Figure_S6<-pheatmap(data, cluster_row = TRUE,cluster_cols = FALSE,border_color = "black",
                                             display_numbers = TRUE,        
                                             number_color = "black",        
                                             fontsize=10,                   
                                             number_format = "%.2f")          
pdf("Figure_S6.pdf", width = 6, height = 4)
print(Figure_S6)
dev.off()