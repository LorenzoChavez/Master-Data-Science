#1. Mean of the age of men that survived
aggregate(Age~Sex == "male" & Survived == 1, titanic, mean)
mean(titanic[titanic$Sex == "male" & titanic$Survived, "Age"], na.rm = TRUE) #another way

titanic %>%   # another way
  filter(Sex == "male") %>%
  filter(Survived == 1) %>%
  .[,"Age"] %>%
  mean(na.rm = TRUE) #(media = mean(Age, na.rm = TRUE))

#2. How many people survived
sum(titanic$Survived)

#3. How many people died
sum(!titanic$Survived)

#4. How many people travelled on the Titanic
nrow(titanic)
sum(titanic$Embarked != "")

#5. Ratio between 1st Class and 3rd Class passengers
firstClass <- sum(titanic$Pclass == 1)
thirdClass <- sum(titanic$Pclass == 3)

thirdClass / firstClass

#6. Select columns Age and Sex for 1st class passengers
titanic[titanic$Pclass == 1,c("Age", "Sex")]

#7. Calculate the mask to select 3rd Class passengers who survived 
#   or men from 1st Class who died
survived3rd <- titanic$Pclass == 3 & titanic$Survived
died1st <- titanic$Pclass == 1 & !titanic$Survived & titanic$Sex == 'male'
firstOr3rd <- survived3rd | died1st

# Check with View(titanic[firstOr3rd, ])

nrow(titanic[firstOr3rd, ])

#8. Correlation between age and fare grouped by sex
cor(titanic[ , c("Age", "Fare")], use = "comple")

## 9. Create a new column in "titanic" named risk with the values below:
#            Woman    Man
# 1st Class   1        2
# 2nd Class   2        3
# 3rd Class   3        4

titanic$Risk <- 0

women1st <- titanic$Pclass == 1 & titanic$Sex == "female"
women2nd <- titanic$Pclass == 2 & titanic$Sex == "female"
women3rd <- titanic$Pclass == 3 & titanic$Sex == "female"

titanic$Risk[women1st] <- 1
titanic$Risk[women2nd] <- 2
titanic$Risk[women3rd] <- 3

men1st <- titanic$Pclass == 1 & titanic$Sex == "male"
men2nd <- titanic$Pclass == 2 & titanic$Sex == "male"
men3rd <- titanic$Pclass == 3 & titanic$Sex == "male"

titanic$Risk[men1st] <- 2
titanic$Risk[men2nd] <- 3
titanic$Risk[men3rd] <- 4

## 10. Crea otra columna desviacionFare con la diferencia entre Fare y la media
# de todos los "Fare" del dataset.
# Calcula el mínimo y máximo de esta nueva variable para cada combinación
# de sexo y clase.

## 11. Mira la ayuda de xtabs y presenta los mínimos de otra manera con
# esta función