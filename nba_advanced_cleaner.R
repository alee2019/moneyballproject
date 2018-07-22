library(tidyverse)

nba_data <- data.frame()

for(year in c(2004:2017)) {
  temp <- read_csv(paste("data/nba_advanced/nba_advanced_", year, ".csv", sep = ""))
  temp$Year <- year

  nba_data <- rbind(nba_data, temp)
  
}

nba_data <- rename(nba_data, PLAYERID = ADVANCED)

nba_data <- nba_data %>% mutate(PLAYER = PLAYERID)

new_player_column <- nba_data$PLAYERID %>% 
  str_replace_all("\\d+", "") %>% 
  str_trim() %>% 
  str_replace_all("II|III|IV", "") %>% 
  str_replace_all("(?!,)[[:punct:]]", "") %>% 
  str_to_upper() %>% 
  str_replace_all("Jr|Sr", "") %>% 
  str_split(",")

length(new_player_column)

trunc_first_names <- sapply(new_player_column, FUN = function(x){
    x[2] %>% str_trim() %>% str_sub(1, 3) %>% str_trim()
  })


last_name <- sapply(new_player_column, FUN = function(x) {
    x[1] %>% str_trim() %>% str_split(" ") %>% {.[[1]][length(.[[1]])]}
  })

team_abbrv <- sapply(new_player_column, FUN = function(x) {
  x[2] %>% str_trim() %>% str_split(" ") %>% {.[[1]][length(.[[1]])]}
})

nba_data$PLAYERID <- mapply(function(first, last){paste(first, last, sep = "")}, trunc_first_names, last_name)
nba_data$Team <- team_abbrv

nba_data$STL_PCT <- sapply(nba_data$STL_PCT, FUN = function(x) {
  x %>% str_sub(1, -2) %>% as.double() %>% {. / 100}
})

nba_data$BLK_PCT <- sapply(nba_data$BLK_PCT, FUN = function(x) {
  x %>% str_sub(1, -2) %>% as.double() %>% {. / 100}
})

nba_data$AST_PCT <- sapply(nba_data$AST_PCT, FUN = function(x) {
  x %>% str_sub(1, -2) %>% as.double() %>% {. / 100}
})

nba_data$TO_PCT <- sapply(nba_data$TO_PCT, FUN = function(x) {
  x %>% str_sub(1, -2) %>% as.double() %>% {. / 100}
})

save(combine_data, file = "data/nba_advanced.RData")
