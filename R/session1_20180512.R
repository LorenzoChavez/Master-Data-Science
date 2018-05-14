titanic <- read.csv("train.csv")

titanic[1,]
titanic[,"Survived"]
titanic[10,"Survived"]
titanic[c(1,5,10),"Survived"]

titanic[c(2,4,60),c("Survived", "Name")]
titanic[c(2,4,6),c("Survived")] <- 0 #changes values from table to specified ones

colnames(titanic)
colnames(titanic)[1] #select column name
rownames(titanic) #return the index in strings format

rbind() #concatenates rows
cbind() #concatenates columns

titanic[,"Age"]
# VS
titanic$Age #another way to select Age column

myFavouriteColumns <- c("Age", "Survived")

titanic[,myFavouriteColumns] #this will not work with the $column

min(titanic$Age) #this returns NA as some values are missing
min(titanic$Age, na.rm = TRUE)
max(titanic$Age, na.rm = TRUE)
mean(titanic$Age, na.rm = TRUE)

summary(titanic) #basic statistics for the DataFrame
summary(titanic$Age) #basic statistics for a column

titanic$Age < 18 #returns FALSE/TRUE for each element in "Age"
underAgedMask <- titanic$Age < 18 #Saves TRUE/FALSE, so only works for this project

titanic[titanic$Age < 18,] #returns only rows with that statement
titanic[underAgedMask,]

#Convert NA to FALSE Values

#First Method - Long way
is.na(underAgedMask)
underAgedMask[is.na(underAgedMask)] <- FALSE #modifies our underAgedMask variable

underAge <- titanic[underAgedMask,]

#Second Method - Short Way

titanic[titanic$Age < 18 & !is.na(titanic$Age),] # AND we can do the same operation in only one line
titanic[titanic$Age < 18 | !is.na(titanic$Age),] # OR

library("dplyr") #most common way to check if a package is installed
require("dplyr") #another way, less common

install.packages(c(""))

#Exercise 1: Filter women from 1st Class. Columns: "Survived", "Fare"
women1stClass <- titanic[titanic$Sex == "female" & titanic$Pclass == 1, c("Survived","Fare")]
head(women1stClass)

#Exercise 2: % survived from this group
mean(women1stClass$Survived, na.rm = TRUE)
women1stClass_survived <- sum(women1stClass$Survived) / nrow(women1stClass)
women1stClass_survived

#how to apply a function to a vector
tapply(titanic$Survived, titanic$Sex, mean) #apply a function to more than one column
tapply(titanic$Survived, titanic$Sex == "female" & titanic$Pclass == 3, mean) #0.50 percent of women of 3rd class survived
tapply(titanic$Survived, titanic$Pclass, mean) #two levels

#how to apply a function to a vector/DataFrame
by(titanic, titanic$Sex, summary)

#how to use multiple functions aggregated
aggregate(Survived~Sex, titanic, mean) #best output format. Left(column to apply function)~Rigth(Columns to group)
aggregate(Survived~Sex+Pclass, titanic, mean) #multiple levels grouped with '+' operator
aggregate(Survived~Pclass+Sex, titanic, mean)

aggregate(cbind(Survived,Age)~Pclass+Sex, titanic, mean)

#be careful when ignoring NA values
cor(titanic$Survived, titanic$Age, use = "comple") #you dont have to type the entire optional atribute. "complete.obs"
cor(titanic[,c("xx","yy")])

# install.packages("dplyr") #be careful with the error mesagge. You can use "dplyr::" to call the fucntions within a package
#ratr is really important when working in a project

# The library below is the most used one nowadays. Very important one.
library(dplyr) #it has pipes, it is a very intuitive package

titanic %>%
  group_by(Sex, Pclass) %>%
  summarise(mediaSurvived = mean(Survived))

#IMPORTANT below

# class() == type() in python
# str() == info() in python. Structure in R
# 1:10 to create vector from 1 to 10
#
#
#
#
#












