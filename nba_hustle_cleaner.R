library(tidyverse)

nba_data <- data.frame()

for(year in c(2016, 2017)) {
  temp <- read_csv(paste("data/nba_advanced/nba_hustle_", year, ".csv", sep = ""))
  temp$Year <- year
  
  nba_data <- rbind(nba_data, temp)
  
}

nba_data <- rename(nba_data, PLAYERID = PLAYER)

nba_data <- nba_data %>% mutate(PLAYER = PLAYERID)

new_player_column <- nba_data$PLAYER %>% 
  str_replace_all(" Jr.", "") %>% 
  str_replace_all(" Sr.", "") %>% 
  str_replace_all(" II", "") %>% 
  str_replace_all(" III", "") %>% 
  str_replace_all(" IV", "") %>% 
  str_trim() %>% 
  str_to_upper() %>% 
  str_replace_all("[[:punct:]]+", "") %>% 
  str_split(" ")

trunc_first_names <- sapply(new_player_column, FUN = function(x){str_sub(x[[1]], 1, 3)})
last_name <- sapply(new_player_column, FUN = function(x){x[length(x)]})

nba_data$PLAYERID <- mapply(function(first, last){paste(first, last, sep = "")}, trunc_first_names, last_name)

save(nba_data, file = "data/nba_hustle.RData")
