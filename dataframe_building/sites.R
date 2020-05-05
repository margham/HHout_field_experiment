#Combine cn data with the location data
#save as a dataframe in the soil_Fractionation project. 
#final file saved as cn.loc.csv

#load libraries
library(plotKML)
library(XML)
library(OpenStreetMap)
library(lubridate)
library(dplyr)
library(tidyverse)
library(vegan)
library(plyr)
library(ggplot2)
library(ggmap)
devtools::install_github("dkahle/ggmap", ref = "tidyup")

#read in the data frames
sample_locations <- read.delim("hh_edit_2.csv", header=TRUE, sep = ";")
summary(sample_locations)

cn.wts.sums <- read.csv("cn.wts.sums.csv", header=TRUE)
summary(cn.wts.sums)

#check that site names are the same
all.equal(cn.wts.sums$site, sample_locations$site)

#not the same. Try subsetting just the sites and joining, see what happens
cn.wts.sites <- subset(cn.wts.sums, select=site) #subset
sample.loc.sites <- subset(sample_locations, select = site) #subset
join(cn.wts.sites, sample.loc.sites, type = "left") #join
#maybe it matches? Bad test.


#try joining the data frames by site, first make test dataframes
cn.wts.test <- cn.wts.sums
sample.loc.test <- sample_locations

cn.loc <- join(cn.wts.test, sample.loc.test, type="left")
View(cn.loc)

#check levels of site in cn.loc
unique(cn.loc$site)
#okay looks like no levels were lost in the translation. 

#save as csv
write.csv(cn.loc, file="cn.loc.csv")

