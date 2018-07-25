library(tidyverse)

load("data/combined.RData")

standardize <- function(x) {
  return((x - mean(x, na.rm = TRUE)) / sd(x, na.rm = TRUE))
}

qualified_nba <- combined %>% 
  filter(!is.na(POS), !is.na(STL_PCT.x), !is.na(BLK_PCT.x), !is.nan(DEF_RTG.x), GP.x >= 40, MPG.x >= 15.0)

qualified_nba[qualified_nba == '-'] <- NA

qualified_nba <- qualified_nba %>% mutate(HEIGHT_GROUP = case_when(
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

qualified_nba <- qualified_nba %>% 
  group_by(Year.x, HEIGHT_GROUP) %>% 
  mutate(zDEF_RTG_NBA_year = (-1) * standardize(DEF_RTG.x),
         zSTL_PCT_NBA_year = standardize(STL_PCT.x),
         zBLK_PCT_NBA_year = standardize(BLK_PCT.x),
         z_HEIGHT = standardize(HEIGHT_NO_SHOES),
         z_WINGSPAN = standardize(WINGSPAN),
         z_VERTICAL = standardize(as.numeric(Max_Vertical)),
         z_AGILITY = standardize(as.numeric(Agility)))

#qualified_nba <- qualified_nba %>% 
#  filter(!is.nan(zDEF_RTG_NBA_year), !is.na(zDEF_RTG_NBA_year))

qualified_nba <- rename(qualified_nba,
                        YEAR_NBA = Year.x, 
                        YEAR_NCAA = Year, 
                        TEAM_NCAA = Team, 
                        TEAM_NBA = TEAM,
                        GP_NBA = GP.x,
                        GP_NCAA = GP.y,
                        GS_NBA = GS.x,
                        GS_NCAA = GS.y,
                        MPG_NBA = MPG.x,
                        MPG_NCAA = MPG.y,
                        DEF_RTG_NBA = DEF_RTG.x,
                        DEF_RTG_NCAA = DEF_RTG.y,
                        STL_PCT_NBA = STL_PCT.x,
                        STL_PCT_NCAA = STL_PCT.y,
                        BLK_PCT_NCAA = BLK_PCT.y,
                        BLK_PCT_NBA = BLK_PCT.x)

guards <- qualified_nba %>% filter(HEIGHT_GROUP == 1)
forwards <- qualified_nba %>% filter(HEIGHT_GROUP == 2)
centers <- qualified_nba %>% filter(HEIGHT_GROUP == 3)



save(guards, file = "data/qualified_standardized_guards.RData")
save(forwards, file = "data/qualified_standardized_forwards.RData")
save(centers, file = "data/qualified_standardized_centers.RData")


