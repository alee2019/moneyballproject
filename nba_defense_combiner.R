load("data/nba_hustle.RData")
load("data/nba_advanced.RData")

nba_data_all <- full_join(nba_data, nba_hustle_data, by = c("PLAYERID", "Year", "GP", "TEAM"))

save(nba_data_all, file = "data/nba_data_all.RData")
