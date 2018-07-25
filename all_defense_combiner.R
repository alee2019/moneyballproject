library(tidyverse)

load("data/combined.RData")
load("data/all_defense_players.RData")

all_teams <- rename(all_teams, Year.x = Season, ALL_DEFENSE = Team)
all_teams$PLAYER <- NULL

combined <- left_join(combined, all_teams, by = c("PLAYERID", "Year.x"))

save(combined, file = "data/combined.RData")