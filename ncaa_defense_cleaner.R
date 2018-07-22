library(tidyverse)

ncaa_data <- data.frame()

for(year in c(2001:2017)) {
  temp <- read_csv(paste("data/ncaa_defense_all/ncaa_defense_", year, ".csv", sep = ""))
  temp$Year <- year
  
  ncaa_data <- rbind(ncaa_data, temp)
  
}

ncaa_data <- rename(ncaa_data, PLAYERID = ADVANCED)

ncaa_data <- ncaa_data %>% mutate(PLAYER = PLAYERID)

new_player_column <- ncaa_data$PLAYERID %>% 
  str_replace_all("\\d+", "") %>% 
  str_trim() %>% 
  str_replace_all("II|III|IV", "") %>% 
  str_replace_all("(?![\\,\\.])[[:punct:]]", "") %>% 
  str_to_upper() %>% 
  str_replace_all(" JR\\.| SR\\.", "") %>% 
  str_replace_all("\\.", "") %>% 
  str_split(",")

trunc_first_names <- sapply(new_player_column, FUN = function(x){
  x[2] %>% str_trim() %>% str_sub(1, 3) %>% str_trim()
})


last_name <- sapply(new_player_column, FUN = function(x) {
  x[1] %>% str_trim() %>% str_split(" ") %>% {.[[1]][length(.[[1]])]}
})

team_abbrv <- sapply(new_player_column, FUN = function(x) {
  x[2] %>% str_trim() %>% str_split(" ") %>% {.[[1]][length(.[[1]])]}
})

ncaa_data$PLAYERID <- mapply(function(first, last){paste(first, last, sep = "")}, trunc_first_names, last_name)
ncaa_data$Team <- team_abbrv

ncaa_data$STL_PCT <- sapply(ncaa_data$STL_PCT, FUN = function(x) {
  x %>% str_sub(1, -2) %>% as.double() %>% {. / 100}
})

ncaa_data$BLK_PCT <- sapply(ncaa_data$BLK_PCT, FUN = function(x) {
  x %>% str_sub(1, -2) %>% as.double() %>% {. / 100}
})

ncaa_data$AST_PCT <- sapply(ncaa_data$AST_PCT, FUN = function(x) {
  x %>% str_sub(1, -2) %>% as.double() %>% {. / 100}
})

ncaa_data$TO_PCT <- sapply(ncaa_data$TO_PCT, FUN = function(x) {
  x %>% str_sub(1, -2) %>% as.double() %>% {. / 100}
})

save(combine_data, file = "data/ncaa_defense.RData")
