library(tidyverse)

## ?? deal with duplicates in PLAYERID columns with nba + ncaa

##cleaning nba advanced data and putting it into nba_data tibble
nba_data <- data.frame()

for(year in c(2008:2017)) {
  temp <- read_csv(paste("data/nba_advanced/nba_advanced_", year, ".csv", sep = ""))
  temp$Year <- year
  
  nba_data <- rbind(nba_data, temp)
  
}

nba_data <- rename(nba_data, PLAYERID = ADVANCED)

nba_data <- nba_data %>% mutate(PLAYER = PLAYERID)

new_player_column <- nba_data$PLAYERID %>% 
  str_replace_all("\\d+", "") %>% 
  str_trim() %>% 
  str_replace_all("III|II|IV", "") %>% 
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

nba_data$PLAYERID <- mapply(function(first, last){paste(first, last, sep = "")}, trunc_first_names, last_name)
nba_data$TEAM <- team_abbrv

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

##cleaning nba combine data and putting it into combine_data tibble

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

combine_data$WINGSPAN <- sapply(new_wingspans, FUN = function(x){
  as.double(x[1]) * 12 + as.double(x[2])
})

combine_data$Max_Vertical <- sapply(combine_data$Max_Vertical, FUN = function(x) {
  as.double(x)
})

combine_data$Agility <- sapply(combine_data$Agility, FUN = function(x) {
  as.double(x)
})

combine_data$Sprint <- sapply(combine_data$Sprint, FUN = function(x) {
  as.double(x)
})



##cleaning ncaa data and putting it into ncaa_data tibble

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
  str_replace_all("III|II|IV", "") %>% 
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

Big12 <- c("KAN", "OKST", "OU", "BAYLOR", "TEXAS", "TTU", "WVU", "KSU", "TCU", "ISU")
ACC <- c("UVA", "DUKE", "CLEM", "UNC", "MIA", "FSU", "LOU", "SYR", "BC", "GT", "WAKE", "PITT", "NCST", "VT", "ND", "BC")
BigEast <- c("XAVIER", "NOVA", "SHU", "CREIGH", "PROV", "BUTLER", "MARQ", "GTOWN", "SJC", "DPU")
BigTen <- c("MSU", "PUR", "MICH", "NEB", "PSU", "IND", "MD", "WIS", "NU", "MINN", "ILL", "IOWA", "RUTG")
SEC <- c("AUB", "TENN", "FLA", "UK", "ARK", "MIZZOU", "MSU", "TXA&M", "ALA", "LSU", "UGA", "USC", "VANDY", "OMISS")
TheAmerican <- c("CIN", "HOU", "WICH", "TULSA", "MEM", "UCF", "TEMPLE", "UCONN", "SMU", "TULANE", "ECU", "USF")
PAC12 <- c("ARIZ", "USC", "UTAH", "UCLA", "STAN", "ORE", "WASH", "ASU", "CU", "OSU", "WSU", "CAL") 

ncaa_data <- ncaa_data %>% mutate(CONF_NCAA = case_when(
  Team %in% Big12 ~ "Big 12", 
  Team %in% ACC ~ "ACC",
  Team %in% BigEast ~"Big East",
  Team %in% BigTen ~ "Big Ten",
  Team %in% SEC ~ "SEC",
  Team %in% TheAmerican ~ "The American",
  Team %in% PAC12 ~ "PAC 12"
))

# cleaning all defense data and saving it into nba_all_defense_players

all_teams <- read_csv("data/nba_all_defense.csv")

all_teams$Season <- sapply(all_teams$Season, FUN = function(x){
  strtoi(x %>% str_sub(1, 4))
})

nba_all_defense_players <- data.frame(matrix(ncol = 3, nrow = 0))
x <- c("PLAYER", "YEAR", "TEAM")
colnames(nba_all_defense_players) <- x

seasons <- rep(all_teams$Season, 6)
teams <- rep(all_teams$Tm, 6)
players <- c(all_teams$PLAYER_1,
             all_teams$PLAYER_2,
             all_teams$PLAYER_3,
             all_teams$PLAYER_4,
             all_teams$PLAYER_5,
             all_teams$PLAYER_6)
nba_all_defense_players <- data.frame(Season = seasons, Team = teams, Player = players)

nba_all_defense_players <- rename(nba_all_defense_players, PLAYERID = Player)

nba_all_defense_players <- nba_all_defense_players %>% mutate(PLAYER = PLAYERID)

new_player_column <- nba_all_defense_players$PLAYERID
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

nba_all_defense_players$PLAYERID <- mapply(function(first, last){paste(first, last, sep = "")}, trunc_first_names, last_name)

#combining nba_data and combine_data

nba_and_combine_data <- left_join(nba_data, combine_data, by = c("PLAYERID"), suffix = c('_NBA', '_COMB'))

# standardizing nba and combine data

standardize <- function(x) {
  return((x - mean(x, na.rm = TRUE)) / sd(x, na.rm = TRUE))
}

nba_and_combine_data <- nba_and_combine_data %>% 
  filter(!is.na(POS), GP >= 40, MPG >= 15.0)

nba_and_combine_data[nba_and_combine_data == '-'] <- NA

nba_and_combine_data <- nba_and_combine_data %>% mutate(HEIGHT_GROUP = case_when(
  POS == "PG" ~ 1,
  POS == "PG-SG" ~ 1,
  POS == "SG-PG" ~ 1,
  POS == "SG" ~ 1,
  POS == "SG-SF" ~ 2,
  POS == "SF-SG" ~ 2,
  POS == "SF" ~ 2,
  POS == "SF-PF" ~ 2,
  POS == "PF-SF" ~ 2,
  POS == "PF" ~ 2,
  POS == "PF-C" ~ 3,
  POS == "C-PF" ~ 3,
  POS == "C" ~ 3
))

nba_and_combine_data <- nba_and_combine_data %>% 
  group_by(Year_NBA, HEIGHT_GROUP) %>% 
  mutate(zDEF_RTG_NBA = (-1) * standardize(DEF_RTG),
         zSTL_PCT_NBA = standardize(STL_PCT),
         zBLK_PCT_NBA = standardize(BLK_PCT),
         z_HEIGHT = standardize(HEIGHT_NO_SHOES),
         z_WINGSPAN = standardize(WINGSPAN),
         z_VERTICAL = standardize(Max_Vertical),
         z_AGILITY = standardize(Agility))


nba_and_combine_data <- rename(nba_and_combine_data,
                        YEAR_NBA = Year_NBA,
                        TEAM_NBA = TEAM,
                        GP_NBA = GP,
                        GS_NBA = GS,
                        MPG_NBA = MPG,
                        DEF_RTG_NBA = DEF_RTG,
                        STL_PCT_NBA = STL_PCT,
                        BLK_PCT_NBA = BLK_PCT)

# combine nba_and_combine_data with nba_all_defense_players

nba_all_defense_players$PLAYER <- NULL
nba_all_defense_players <- rename(nba_all_defense_players, YEAR_NBA = Season)
# ?? should all defense column be 0, 1, 2?
nba_and_combine_data <- left_join(nba_and_combine_data, nba_all_defense_players, by = c("PLAYERID", "YEAR_NBA"))

# standardize ncaa_data

ncaa_data <- ncaa_data %>% 
  group_by(Year, CONF_NCAA) %>% 
  filter(GP >= 15, MPG >= 12) %>% 
  mutate(zDEF_RTG_NCAA = (-1) * standardize(DEF_RTG),
         zSTL_PCT_NCAA = standardize(STL_PCT),
         zBLK_PCT_NCAA = standardize(BLK_PCT)) %>% 
  ungroup() %>% 
  select(PLAYERID, GP, GS, MPG, DEF_RTG, STL_PCT, BLK_PCT, zDEF_RTG_NCAA, zSTL_PCT_NCAA, zBLK_PCT_NCAA, Year, PLAYER, Team, CONF_NCAA)

ncaa_data <- rename(ncaa_data,
                               YEAR_NCAA = Year,
                               TEAM_NCAA = Team,
                               GP_NCAA = GP,
                               GS_NCAA = GS,
                               MPG_NCAA = MPG,
                               DEF_RTG_NCAA = DEF_RTG,
                               STL_PCT_NCAA = STL_PCT,
                               BLK_PCT_NCAA = BLK_PCT,
                               PLAYER_NCAA = PLAYER)

# ?? only take last year of college


## ?? combine nba_and_combine_data with ncaa_data





