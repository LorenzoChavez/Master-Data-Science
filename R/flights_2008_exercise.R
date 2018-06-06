library(dplyr)
library(tidyr)

# The flights dataset contains all flights from the USA in 2008
# http://stat-computing.org/dataexpo/2009/the-data.html
flights <- data.table::fread('data/flights/2008.csv')

# Exercise 1:
# How many weekend flights to JFK airport flew a distance of more than 1000 miles 
# but had a total taxiing time below 15 minutes?
# Combine the Year, Month and DayofMonth variables to create a Date column.

flights %>%
  filter(Dest == 'JFK') %>% 
  mutate(Date = as.Date(paste(Year, Month, DayofMonth, sep = '-'))) %>% 
  filter(DayOfWeek %in% c(6, 7), Distance > 1000, TaxiIn + TaxiOut < 15) %>% 
  nrow()0

# Keep flights leaving to DFW and arrange according to decreasing AirTime 

flights_DFW <- flights %>% 
  filter(Dest == 'JFK') %>% 
  arrange(desc(AirTime))

# Percentage of fights that were delayed
flights %>% 
  filter(!is.na(ArrDelay)) %>% 
  count(Delayed = ArrDelay > 0) %>% 
  mutate(Per = n / sum(n))


# Exercise 2:
# Filter flights to keep all American Airline flights and save it to aa.
# Print out a summary of aa with the following variables:
#   - n_flights: the total number of flights,
#   - n_canc: the total number of cancelled flights,
#   - p_canc: the percentage of cancelled flights,
#   - avg_delay: the average arrival delay of flights whose delay is not NA

aa <- flights %>% filter(UniqueCarrier == "AA")

aa %>% 
  summarise(n_flights = n(), 
            n_canc = sum(Cancelled), 
            p_canc = 100 * (n_canc / n_flights), 
            avg_delay = mean(ArrDelay, na.rm = T))

# Exercise 3: 
# Print out a summary of aa with the following variables:
# n_security: the total number of cancelled flights by security reasons,
# CancellationCode: reason for cancellation (A = carrier, B = weather, C = NAS, D = security)

aa %>% 
  filter(CancellationCode == 'D') %>% 
  summarise(n_security = n())


# Exercise 4: 
# 1) Keep flights that are delayed (ArrDelay > 0 and not NA). 
# Next, create a by-carrier summary with a single variable: avg, the average delay 
# of the delayed flights. Again add a new variable rank to the summary according to 
# avg. Finally, arrange by this rank variable.

flights %>% 
  filter(ArrDelay > 0, !is.na(ArrDelay)) %>% 
  group_by(UniqueCarrier) %>% 
  summarise(avg = mean(ArrDelay)) %>% 
  mutate(avg_rank = rank(avg)) %>% 
  arrange(avg_rank)


# 2) How many airplanes only flew from JFK? 
# The result contains only a single column named nplanes and a single row.

flights %>% 
  filter(Dest == 'JFK') %>% 
  summarise(nplanes = n())


# 3) Find the most visited destination for each carrier
# Your solution should contain four columns:
# UniqueCarrier and Dest, n, how often a carrier visited a particular destination,
# rank, how each destination ranks per carrier. rank should be 1 for every row, 
# as you want to find the most visited destination for each carrier.

flights %>% 
  group_by(UniqueCarrier, Dest) %>% 
  summarise(n=n()) %>% 
  mutate(dest_rank=rank(desc(n))) %>%
  filter(dest_rank == 1) %>% 
  arrange(desc(n))
