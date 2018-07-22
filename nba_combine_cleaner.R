library(tidyverse)

combine_data <- data.frame()

for(year in c(2004:2018)) {
  athlete_temp <- read_csv(paste("data/nba_combine_athlete/nba_combine_athlete_", year, ".csv", sep = ""))
  athlete_temp$Year <- year
  anthro_temp <- read_csv(paste("data/nba_combine_anthro/nba_combine_anthro_", year, ".csv", sep = ""))
  year_combine_data <- full_join(athlete_temp, anthro_temp, by = c("PLAYER", "POS"))
  combine_data <- rbind(combine_data, year_combine_data)
  
}

combine_data <- rename(combine_data, PLAYERID = PLAYER)

combine_data <- combine_data %>% mutate(PLAYER = PLAYERID)

new_player_column <- combine_data$PLAYER
new_player_column <- gsub(" Jr.", "", new_player_column)
new_player_column <- gsub(" Sr.", "", new_player_column)
new_player_column <- gsub(" II", "", new_player_column)
new_player_column <- gsub(" III", "", new_player_column)
new_player_column <- gsub(" IV", "", new_player_column)

new_player_column <- new_player_column %>% 
  str_trim() %>% 
  str_to_upper()


new_player_column <- gsub("[[:punct:]]+", "", new_player_column)
new_player_column <- new_player_column %>% str_split(" ")

trunc_first_names <- sapply(new_player_column, FUN = function(x){str_sub(x[[1]], 1, 3)})
last_name <- sapply(new_player_column, FUN = function(x){x[length(x)]})

combine_data$PLAYERID <- mapply(function(first, last){paste(first, last, sep = "")}, trunc_first_names, last_name)

new_height_no_shoes <- combine_data$HEIGHT_NO_SHOES %>% 
  str_replace_all("'", "") %>% 
  str_trim() %>% 
  str_split(" ")

combine_data$HEIGHT_NO_SHOES <- sapply(new_height_no_shoes, FUN = function(x){
  as.double(x[1]) * 12 + as.double(x[2])
})

new_height_shoes <- combine_data$HEIGHT_SHOES %>% 
  str_replace_all("'", "") %>% 
  str_trim() %>% 
  str_split(" ")

combine_data$HEIGHT_SHOES <- sapply(new_height_shoes, FUN = function(x){
  as.double(x[1]) * 12 + as.double(x[2])
})

new_standing_reach <- combine_data$STANDING_REACH %>% 
  str_replace_all("'", "") %>% 
  str_trim() %>% 
  str_split(" ")

combine_data$STANDING_REACH <- sapply(new_standing_reach, FUN = function(x){
  as.double(x[1]) * 12 + as.double(x[2])
})

new_wingspans <- combine_data$WINGSPAN %>% 
  str_replace_all("'", "") %>% 
  str_trim() %>% 
  str_split(" ")

combine_data$WINGSPAN <- sapply(new_wingspans, FUN = function(x){
  as.double(x[1]) * 12 + as.double(x[2])
})


save(combine_data, file = "data/combine_data.RData")

# ncaa_blocks[which(duplicated(ncaa_blocks$Player)),]
