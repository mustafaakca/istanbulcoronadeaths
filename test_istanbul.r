############  Mustafa AKCA  ##########

###########################################################
###        General Preperation For Analysis              ##
###########################################################
# Clear plots
if(!is.null(dev.list())) dev.off()

# Clear console
cat("\014") 

# Clean workspace
rm(list=ls())


if(!require(dplyr)){install.packages("dplyr")}
library("dplyr")

if(!require(lattice)){install.packages("lattice")}
library("lattice")

 
if(!require(pastecs)){install.packages("pastecs")}
library("pastecs")

###########################################################
###                    Loading Data                      ##
###########################################################
#Set work directory
setwd("C:/Users/test/Desktop")


isttest =read.csv("istanbultest3.csv")

#colnames(isttest)[2] <- '2020_Beklenen'
#colnames(isttest)[3] <- '2020_Gerceklesen'

                                                        #COMPARING MEANS

bwplot(death~category, data= isttest ,xlab="Yillar" , ylab="Olen Kisi Sayisi ", pch= '|')



s=shapiro.test(isttest$death)   #It is not Normal distribution  (We cannot  use parametric tests.)
s$p.value<0.05

res.ftest <- var.test(death~category, data=isttest  )
res.ftest$p.value    



res <- wilcox.test(death~category, data = isttest, exact = FALSE) 
res$p.value  

