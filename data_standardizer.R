library(tidyverse)

load("data/combined.RData")

standardize <- function(x) {
  return((x - mean(x, na.rm = TRUE)) / sd(x, na.rm = TRUE))
}

qualified_nba <- combined %>% 
  filter(!is.na(HEIGHT_NO_SHOES), !is.na(STL_PCT.x), !is.na(BLK_PCT.x), !is.nan(DEF_RTG.x), GP.x >= 40, MPG.x >= 15.0)

qualified_nba[qualified_nba == '-'] <- NA

qualified_nba <- qualified_nba %>% mutate(HEIGHT_GROUP = case_when(
  HEIGHT_NO_SHOES <= 76.0 ~ 1,
  HEIGHT_NO_SHOES > 76.0 & HEIGHT_NO_SHOES <= 81.0 ~ 2,
  HEIGHT_NO_SHOES > 81.0 ~ 3
))

qualified_nba <- qualified_nba %>% 
  group_by(Year, HEIGHT_GROUP) %>% 
  mutate(zDEF_RTG_NBA_year = (-1) * standardize(DEF_RTG.x),
         zSTL_PCT_NBA_year = standardize(STL_PCT.x),
         zBLK_PCT_NBA_year = standardize(BLK_PCT.x),
         z_HEIGHT = standardize(HEIGHT_NO_SHOES),
         z_WINGSPAN = standardize(WINGSPAN),
         z_VERTICAL = standardize(as.numeric(Max_Vertical)),
         z_AGILITY = standardize(as.numeric(Agility)))

#qualified_nba <- qualified_nba %>% 
#  filter(!is.nan(zDEF_RTG_NBA_year), !is.na(zDEF_RTG_NBA_year))

save(qualified_nba, file = "data/qualified_standardized_combined.RData")


