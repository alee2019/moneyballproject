library(tidyverse)

nba_data <- data.frame()

for(year in c(2004:2016)) {
  temp <- read_csv(paste("data/nba_advanced/nba_advanced_", year, ".csv", sep = ""))
  temp$Year <- year

  nba_data <- rbind(nba_data, temp)
  
}

combine_data <- rename(combine_data, PLAYERID = PLAYER)

combine_data <- combine_data %>% mutate(PLAYER = PLAYERID)