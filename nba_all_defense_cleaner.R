library(tidyverse)

nba_all_defense <- read_csv("data/nba_all_defense.csv")

nba_all_defense$Season <- sapply(nba_all_defense$Season, FUN = function(x){
  strtoi(x %>% str_sub(1, 4))
})

new_all_defense <- data.frame(matrix(ncol = 3, nrow = 0))
x <- c("PLAYER", "YEAR", "TEAM")
colnames(new_all_defense) <- x

seasons <- rep(nba_all_defense$Season, 6)
teams <- rep(nba_all_defense$Tm, 6)
players <- c(nba_all_defense$PLAYER_1,
             nba_all_defense$PLAYER_2,
             nba_all_defense$PLAYER_3,
             nba_all_defense$PLAYER_4,
             nba_all_defense$PLAYER_5,
             nba_all_defense$PLAYER_6)
all_teams <- data.frame(Season = seasons, Team = teams, Player = players)

all_teams <- rename(all_teams, PLAYERID = Player)

all_teams <- all_teams %>% mutate(PLAYER = PLAYERID)

new_player_column <- all_teams$PLAYERID
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

all_teams$PLAYERID <- mapply(function(first, last){paste(first, last, sep = "")}, trunc_first_names, last_name)

save(all_teams, file = "data/all_defense_players.RData")
