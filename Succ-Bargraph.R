---
title: "carRm_RNA-seq_MAP-SM"
author: "Sergio Mares"
date: "1/23/2021"
output: html_document
---
  
if(!require(devtools)) install.packages("devtools")
  devtools::install_github("kassambara/ggpubr")  
  
install.packages("ggpubr")
    
library(ggpubr)  
library(ggplot2)
library("RColorBrewer")

#∆calC

PWp <- read.csv("~/Desktop/2021/MAP Lab | RNA Seq/CalC Data/SEP02-2020/Post-MAPKING Meeting/DEG2/p_5mM-c_5mM/Enriched-KEGG.csv",row.names = 1)
PWc <- read.csv("~/Desktop/2021/MAP Lab | RNA Seq/CalC Data/SEP02-2020/Post-MAPKING Meeting/DEG2/p_0mM-c_0mM/Enriched-KEGG.csv",row.names = 1)

data1 <- data.frame(g=as.numeric(c(PWp[,3])),p=factor(c(PWp[,4])),r=factor(c(PWp[,1]),levels=c('Up regulated','Down regulated')))
str(data1)

bg1 <-ggplot(data=data1, aes(x=p, y=g, fill=r)) + coord_flip() +
  geom_bar(stat="identity", width=0.75, position=position_dodge()) +
  theme(axis.text = element_text(size = 7)) + facet_wrap(~r, scales="free_x") +
  labs(x = "Protein families") + labs(y = "Number of Genes")  + 
  labs(title = "5 mM WTvs 5 mM ∆calC") + labs(fill="Legend") +
  scale_fill_manual(values=c("#00C0B8", "#F8766D"))

bg1

data2 <- data.frame(g=as.numeric(c(PWc[,3])),p=factor(c(PWc[,4])),r=factor(c(PWc[,1]),levels=c('Up regulated','Down regulated')))
str(data2)

bg2 <- ggplot(data=data2, aes(x=p, y=g, fill=r)) + coord_flip() +
  geom_bar(stat="identity", width=0.75, position=position_dodge()) +
  theme(axis.text = element_text(size = 7)) + facet_wrap(~r, scales="free_x") +
  labs(x = "Protein families") + labs(y = "Number of Genes")  + 
  labs(title = "0 mM WT vs 0 mM ∆calC") + labs(fill="Legend") +
  scale_fill_manual(values=c("#00C0B8", "#F8766D"))

bg2
  
ggarrange(bg1, bg2 + rremove("x.text"), 
          labels = c("A", "B"),
          ncol = 2, nrow = 2)

