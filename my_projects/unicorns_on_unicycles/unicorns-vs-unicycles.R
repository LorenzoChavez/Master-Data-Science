### --------------------------------------------------------------- ###
### Name of project: unicorns                                       ###
### User: Lorenzo                                                   ###
### Dataset:  https://github.com/RMHogervorst/unicorns_on_unicycles ###
### --------------------------------------------------------------- ###

### The dataset contains the number of unicyles sold between 1670-1680 
### and the population of unicorns in Wester Europe at the time
### This data was obviously made up and will only be analysed for academic purposes

# install.packages("readxl")
library(readxl)
library(dplyr)
library(tidyverse)
library(ggplot2)

## ----- Download Data ----- ##

if(!file.exists("data")){
  dir.create("data")
}

dataFolder <- './data/'
urlObs <- 'https://github.com/RMHogervorst/unicorns_on_unicycles/raw/master/observations.xlsx'
urlSales <- 'https://github.com/RMHogervorst/unicorns_on_unicycles/raw/master/sales.xlsx'

pathObs <- file.path(dataFolder, 'observations.xlsx')
pathSales <- file.path(dataFolder, 'sales.xlsx')

#downloads in 'ASCII' by default. Changed to binary 'wb'
download.file(urlObs, pathObs, mode="wb") 
download.file(urlSales, pathSales, mode="wb")

unicorns <- read_excel(pathObs)
bikes <- read_excel(pathSales)

# ggplot(unicorns, aes(year, pop, col=countryname))+geom_line(size=2)


## ------- Cleaning Data -------- ##

str(bikes)
head(bikes)
summary(bikes)

str(unicorns)
head(unicorns)
summary(unicorns)

#it seems that bikes has 4 columns with the same data. Let´s check it out
sum(bikes$name_of_country != bikes$name_of_country__1)
sum(bikes$year != bikes$year__1)

unicorns$countryname <- toupper(unicorns$countryname)

bikesClean <- bikes %>% 
  select(-ends_with("_1"), -ends_with("_2"))
  
df <- merge(x=bikesClean, y=unicorns, by.x = c("name_of_country", "year"), by.y = c("countryname", "year"))

df$year <- as.integer(df$year)

df %>% 
  select(name_of_country, year, pop) %>% 
  group_by(year, name_of_country) %>% 
  summarise(pop=sum(pop)) %>% 
  ggplot(aes(year, pop, fill=name_of_country)) + geom_col() + 
  scale_x_discrete(limits=c(1670:1680))

ggplot(df, aes(x=bikes, y=pop)) + geom_point()+ geom_smooth(method = 'lm', se=FALSE)

linearModel <- lm(bikes~pop, data=df)

summary(linearModel)

# we can see that the correlation is almost perfect, and the R2 is close to 1, which is odd.
# This should make you think that there is something wrong with the data or, in this case,
# there is no actual relation between the number of unycicles sold and the population of unicorns




