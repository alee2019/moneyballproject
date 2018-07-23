library(tidyverse)

load("data/nba_college_combine_all.RData")
load("data/all_defense_players.RData")

all_teams <- rename(all_teams, Year.x = Season, ALL_DEFENSE = Team)
all_teams$PLAYER <- NULL

data_complete <- left_join(data_complete, all_teams, by = c("PLAYERID", "Year.x"))

save(data_complete, file = "data/data_complete.RData")