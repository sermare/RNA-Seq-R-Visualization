---
  title: "carRm_RNA-seq_MAP-SM"
author: "Sergio Mares"
date: "1/23/2021"
output: html_document
---
  
library(ggplot2)

PW <- read.csv("~/Desktop/2021/MAP Lab | RNA Seq/CalC Data/SEP02-2020/Post-MAPKING Meeting/DEG2/c_5mM-c_0mM/Enriched.csv",row.names = 1)
View(PW)

genes <- c(rep(PW[1:15,3]),rep(PW[15:30,3]))
regulated <- c(rep(PW[1:15,1]),rep(PW[15:30,1]))
pathway <- rep(c(PW[1:15,4],c(PW[15:30,4])))
data1 <- data.frame(g=as.numeric(c(genes)),p=factor(c(pathway)),r=factor(c(regulated),levels=c('Up regulated','Down regulated')))

data1$r <- factor(data1$r, levels=c('Up regulated','Down regulated'))
str(data1$r)

str(data)
View(data)

p <- ggplot(data=data1, aes(x=p, y=g, fill=r))+ coord_flip()
p + geom_bar(stat="identity", width=0.75, position=position_dodge()) +
  theme(axis.text = element_text(size = 5)) 

# Increase bottom margin
par(mar=c(5,20,1,1))

#barplot 
barplot(data$g,beside=T, names.arg=data$p, las=2,
        col=mycols[data$r], 
        horiz=T ,
        cex.names=0.5)

p <- ggplot(data=data1, aes(x=p, y=g, fill=r))+ coord_flip()
p + geom_bar(stat="identity", width=0.75, position=position_dodge()) +
  theme(axis.text = element_text(size = 5)) 

  




