# Read raw csv data
# analysis-template/src/
# Zijian Jiang

# Use this file for reading in the raw data
##############################################################################
## GG606 Deliverable 1 ##
## Tuesday, Feb 23rd	 ##
## Zijian Jiang        ##
##############################################################################
library(ggplot2)
library(plotrix)
library(readxl)
#Read dataset
ncdb <- read_excel('D://gg606//NCDB_2017.xlsx',sheet = 1) #change the directory to your own, the table is Excel worksheet file instead of CSV, change functionif necessary
#Exploring dataset
head(ncdb)
tail(ncdb)
names(ncdb)
